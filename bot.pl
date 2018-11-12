/*Function to generate an integer between 0 and size of validMoves.*/
choose_move(Difficulty, Player, Move, Board) :- Difficulty = 1,
    valid_moves(Board, Player, ListOfMoves), length(ListOfMoves, Len), 
    random(0, Len, Int), 
    nth0(Int, ListOfMoves, Move).

choose_move(Difficulty, Player, Board, NewBoard) :- Difficulty = 2,
    valid_moves(Board, Player, ListOfMoves),
    generate_boards(Board, Player, ListOfMoves, ListOfBoards),
    check_value(ListOfBoards, NewBoard, AuxBoard, BestValue, 0).

/*Function that evaluates a board. It receives the player and the board to evaluate and returns a value.*/
value(Board, Player, Value) :- get_pawns(Board, Player, ListOfPawns), 
    distance_pawns(Player, BestPawn, Aux2, 100, BestDistance, ListOfPawns),
    Value is (12-BestDistance)*8.3.

distance_pawns(_, BestPawn, Aux2, Aux, BestDistance, []) :- BestDistance=Aux, BestPawn=Aux2.
distance_pawns(Player, BestPawn, Aux2, Aux, BestDistance, [CellLetter-CellNumber|T]) :- 
    enemy(Player, Opponent),
    castle(Opponent, CastleLetter-CastleNumber), 
    letters_to_numbers(CastleLetter, CNumber),
    letters_to_numbers(CellLetter, CellN),
    Distance is abs(CNumber-CellN) + abs(CastleNumber-CellNumber),
    save_best_distance(Aux, Aux11, Distance, Aux22, BestPawn, CellLetter-CellNumber),
    distance_pawns(Player, BestPawn, Aux22, Aux11, BestDistance, T).

save_best_distance(BestDistance, Aux, Distance, BestPawn, _, Pawn) :-
    BestDistance > Distance, !, Aux = Distance, BestPawn = Pawn.
save_best_distance(BestDistance,Aux,_,BestPawn, Aux2,_) :- Aux = BestDistance, Aux2=BestPawn.

letters_to_numbers(Letter, Number) :- char_code('A', NumberA), char_code(Letter, NumberLetter), Number is NumberLetter-NumberA.


generate_boards(_, _, [], []).

generate_boards(Board, Player, [H|T], [H1|T1]):- 
    move(H, 'C2', Player, Board, NewBoard), 
    value(NewBoard, Player, Value), !,
    H1 = NewBoard-Value,
    generate_boards(Board, Player, T, T1).

check_value([], BestBoard, AuxBoard, BestValue, AuxValue):- BestBoard=AuxBoard, BestValue=AuxValue.
check_value([Board-Value|T], BestBoard, AuxBoard, BestValue, AuxValue) :- AuxValue < Value, !, 
    AuxSaveBoard = Board, 
    AuxSaveValue = Value,
    check_value(T, BestBoard, AuxSaveBoard, BestValue, AuxSaveValue).
check_value([_|T], BestBoard, AuxSaveBoard, BestValue, AuxSaveValue) :- check_value(T, BestBoard, AuxSaveBoard, BestValue, AuxSaveValue).