/*Function to generate an integer between 0 and size of validMoves.*/
choose_move(Difficulty, Player, Move, Board) :- Difficulty = 1,
    valid_moves(Board, Player, ListOfMoves), length(ListOfMoves, Len), 
    random(0, Len, Int), 
    nth0(Int, ListOfMoves, Move).

choose_move(Difficulty, Player, Board, NewBoard) :- Difficulty = 2,
    valid_moves(Board, Player, ListOfMoves),
    generate_boards(Board, Player, ListOfMoves, ListOfBoards),
    check_value(ListOfBoards, Board2, AuxBoard, BestValue, -100, Counter, 0, 0),
    nth0(Counter, ListOfMoves, Move),
    check_enemies_c2(Player, Move, Board, Board2, NewBoard).

check_enemies_c2(Player, OldLetter-OldNumber-NewLetter-NewNumber, InitialBoard, SBoard, NewBoard) :-
    check_board(InitialBoard, Symbol, OldLetter-OldNumber),
    change_board(InitialBoard, 0, OldLetter-OldNumber, Board1),
    change_board(Board1, Symbol, NewLetter-NewNumber, Board2), !,
    a(Player, OldLetter-OldNumber-NewLetter-NewNumber, Board2, SBoard, NewBoard).

a(Player, OldLetter-OldNumber-NewLetter-NewNumber, Board2, SBoard, NewBoard) :-
    check_jump_over_enemy(Player, OldLetter-OldNumber-NewLetter-NewNumber, Board2, B), !,
    c_enemies(SBoard, Player, NewLetter-NewNumber, NewBoard).

a(_, _, _, SBoard, NewBoard) :- NewBoard=SBoard.

c_enemies(SBoard, Player, NewLetter-NewNumber, NewBoard):-
    has_enemies(SBoard, Player, NewLetter-NewNumber), !,
    display_game(SBoard, Player), 
    players_turn(SBoard, 'C2', Player, NewBoard).

c_enemies(SBoard, _, _, NewBoard):- 
    NewBoard=SBoard.

/*Function that evaluates a board. It receives the player and the board to evaluate and returns a value.*/
value(Board, Player, Value) :- get_pawns(Board, Player, ListOfPawns), 
    distance_pawns(Player, BestPawn, Aux2, 12, BestDistance, ListOfPawns),
    check_enemy_adjacent_recursive(Player, Board, ListOfPawns, V),
    Value is (12-BestDistance)*8.3+V.

check_enemy_adjacent_recursive(_, _, [], Value) :- Value is 0.
check_enemy_adjacent_recursive(Player, Board, [H|T], Value) :- 
    adjacent_cells(H, AdjList),
    check_enemy_adjacent(Player, Board, H, AdjList, V),
    V=0, !,check_enemy_adjacent_recursive(Player, Board, T, Value).
check_enemy_adjacent_recursive(_, _, _, Value) :- Value is -50.

check_enemy_adjacent(_, _, _, [], Value) :- Value is 0, !.
check_enemy_adjacent(Player, Board, Letter-Number, [L-N|T], Value) :- 
    check_board(Board, Symbol, L-N),
    analyze_symbol(Board, Player, Symbol, Letter-Number, L-N, Value), !.
check_enemy_adjacent(Player, Board, Letter-Number, [L-N|T], Value) :- 
    check_enemy_adjacent(Player, Board, Letter-Number, T, Value), !.

analyze_symbol(Board, Player, Symbol, Letter-Number, L-N, Value) :- enemy(Player, Opponent),
    players_pieces(Opponent, Symbol),
    get_opposed_cell_letter(OpL, Letter, L),
    get_opposed_cell_number(OpN, Number, N),
    check_board(Board, 0, OpL-OpN), !, Value is -50. 

get_opposed_cell_letter(OpLetter, Letter, L) :- Letter=L, !, OpLetter=L.
get_opposed_cell_letter(OpLetter, Letter, L) :- 
    char_code(Letter, Num1), char_code(L, Num2), Num1 > Num2, !, 
    N is Num1+1, char_code(L, N).
get_opposed_cell_letter(OpLetter, Letter, L) :- 
    char_code(Letter, Num1), char_code(L, Num2), N is Num1-1, char_code(L, N).

get_opposed_cell_number(OpNumber, Number, N) :- Number=N, !, OpNumber = N.
get_opposed_cell_number(OpNumber, Number, N) :- Number>N, !, OpNumber is Number+1.
get_opposed_cell_number(OpNumber, Number, N) :- OpNumber is Number-1.

distance_pawns(_, BestPawn, BestPawnBefore, BestDistanceBefore, BestDistance, []) :- BestDistance=BestDistanceBefore, BestPawn=BestPawnBefore.
distance_pawns(Player, BestPawn, BestPawnBefore, BestDistanceBefore, BestDistance, [CellLetter-CellNumber|T]) :- 
    enemy(Player, Opponent),
    castle(Opponent, CastleLetter-CastleNumber), 
    letters_to_numbers(CastleLetter, CNumber),
    letters_to_numbers(CellLetter, CellN),
    Distance is abs(CNumber-CellN) + abs(CastleNumber-CellNumber),
    save_best_distance(BestDistanceBefore, NewBestDistance, Distance, NewBestPawn,BestPawnBefore, CellLetter-CellNumber),
    distance_pawns(Player, BestPawn, NewBestPawn, NewBestDistance, BestDistance, T).

save_best_distance(BestDistanceBefore, NewBestDistance, CurrentDistance, NewBestPawn,BestPawnBefore, Pawn) :-
    BestDistanceBefore > CurrentDistance, !, NewBestDistance = CurrentDistance, NewBestPawn = Pawn.
save_best_distance(BestDistanceBefore,NewBestDistance,_,NewBestPawn, BestPawnBefore,_) :- 
    NewBestDistance = BestDistanceBefore, 
    NewBestPawn=BestPawnBefore.

letters_to_numbers(Letter, Number) :- char_code('A', NumberA), char_code(Letter, NumberLetter), Number is NumberLetter-NumberA.


generate_boards(_, _, [], []).

generate_boards(Board, Player, [H|T], [H1|T1]):- 
    move(H, 'C2', Player, Board, NewBoard),
    value(NewBoard, Player, Value), !,
    H1 = NewBoard-Value,
    generate_boards(Board, Player, T, T1).

check_value([], BestBoard, AuxBoard, BestValue, AuxValue, Counter, _, AuxCounter2):- BestBoard=AuxBoard, BestValue=AuxValue, Counter=AuxCounter2.
check_value([Board-Value|T], BestBoard, AuxBoard, BestValue, AuxValue, Counter, AuxCounter, AuxCounter2) :- AuxValue < Value, !, 
    AuxSaveBoard = Board, 
    AuxSaveValue = Value,
    A=AuxCounter,
    N is AuxCounter+1,
    check_value(T, BestBoard, AuxSaveBoard, BestValue, AuxSaveValue, Counter, N, A).
check_value([_|T], BestBoard, AuxSaveBoard, BestValue, AuxSaveValue, Counter, AuxCounter, AuxCounter2) :- 
    N is AuxCounter+1,
    check_value(T, BestBoard, AuxSaveBoard, BestValue, AuxSaveValue, Counter, N, AuxCounter2).