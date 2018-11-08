/*Function that recieves a Board and the current Player and returns the list of possible movements.*/
valid_moves(Board, Player, ListOfMoves) :- 
    castle(Player, L-N), check_board(Board, Symbol, L-N), players_pieces(Player, Symbol), !,
    check_pawns(Board, Player, [L-N], ListOfMovements, [], ListOfEnemies, [], ListOfFriends, []), 
    return_list_of_moves(ListOfMoves, ListOfMovements, ListOfEnemies, ListOfFriends).

valid_moves(Board, Player, ListOfMoves) :-
    get_pawns(Board, Player, ListOfPawns),
    check_pawns(Board, Player, ListOfPawns, ListOfMovements, [], ListOfEnemies, [], ListOfFriends, []), !,
    return_list_of_moves(ListOfMoves, ListOfMovements, ListOfEnemies, ListOfFriends).

/*Function to check if Player still has enemy pawns to eat if it jumped over one already.*/
has_enemies(Board, Player, LCell-NCell) :- 
    check_pawns(Board, Player, [LCell-NCell], _, [], Enemies, [], _, []), 
    length(Enemies, Len), Len>0.

/*Function that returns the list of valid moves (ListOfMoves) based on the other 3 lists of possible movements separated into 3 categories:
ListOfMoves - direct movements, ListOfEnemies - jumps over enemies, ListOfFriends, jumps over friends.*/
return_list_of_moves(ListOfMoves, ListOfMovements, ListOfEnemies, ListOfFriends):-
    ListOfEnemies=[], !,
    append(ListOfMovements, ListOfFriends, ListOfMoves).

return_list_of_moves(ListOfMoves, _, ListOfEnemies, _):-
    ListOfMoves = ListOfEnemies.

/*Function that, for each pawn of the player, checks the adjacent cells and saves the valid movements into 3 categories:
ListOfMoves - direct movements, ListOfEnemies - jumps over enemies, ListOfFriends, jumps over friends.*/
check_pawns(_, _, [], ListOfMoves, Aux1, ListOfEnemies, Aux2, ListOfFriends, Aux3) :- ListOfMoves = Aux1,
                                                                                ListOfEnemies = Aux2,
                                                                                ListOfFriends = Aux3.
check_pawns(Board, Player, [H|T], ListOfMoves, Aux1, ListOfEnemies, Aux2, ListOfFriends, Aux3) :- adjacent_cells(H, List), 
                                                    check_adjacents(Board, Player, H, List, Moves, Aux1, Enemies, Aux2, Friends, Aux3),
                                                    check_pawns(Board, Player, T, ListOfMoves, Moves, ListOfEnemies, Enemies, ListOfFriends, Friends).

/*Function that goes through the list of adjacent cells (L-N) of a pawn located in Letter-Number of the Player and puts in Moves the 
movements that can be done directly, in Enemies, the movements where the pawn jumps over an opponent's pawn and in Friends, the movements
where the pawn jumps over pawns.
Base Case: when the list is empty put in the Moves, Friends and Enemies lists what's in the auxiliary lists.*/
check_adjacents(_, _,_-_, [], Moves, Aux1, Enemies, Aux2, Friends, Aux3) :- Moves=Aux1, Enemies=Aux2, Friends=Aux3.
check_adjacents(Board, Player, Letter-Number, [L-N|T], Moves, Aux1, Enemies, Aux2, Friends, Aux3) :- 
    check_board(Board, Symbol, L-N), 
    check_symbol(Board, Player, Symbol, Letter-Number, L-N, Aux1, Aux11, Aux2, Aux22, Aux3, Aux33),
    check_adjacents(Board, Player, Letter-Number,T, Moves, Aux11, Enemies, Aux22, Friends, Aux33).
check_adjacents(Board, Player, Letter-Number, [L-N|T], Moves, Aux1, Enemies, Aux2, Friends, Aux3) :- 
    check_adjacents(Board, Player, Letter-Number,T, Moves, Aux1, Enemies, Aux2, Friends, Aux3).

/*Function that moves a pawn, if possible, and changes the board accordingly. It receives the cell in which the pawn is and to which the pawn
will go, the TypeOfPlayer that is playing (Player or Computer), the Player and the current Board and it returns the new board.*/
move(Letter-Number-NewLetter-NewNumber, TypeOfPlayer, Player, Board, NewBoard) :-
    valid_moves(Board, Player, ListOfMoves),
    member(Letter-Number-NewLetter-NewNumber, ListOfMoves),
    check_board(Board, Symbol, Letter-Number),
    change_board(Board, 0, Letter-Number, Board1),
    change_board(Board1, Symbol, NewLetter-NewNumber, Board2),
    display(TypeOfPlayer, Player, Letter-Number-NewLetter-NewNumber, Board2, NewBoard).

/*When the movement can't be made there's a new try.*/
move(_, TypeOfPlayer, Player, Board, NewBoard):- write('Can\'t move. Try again.'), 
    players_turn(Board, TypeOfPlayer, Player, NewBoard).

/*Function that determines whether the end of game was achieved*/
game_over(Board, Player) :- enemy(Player, Opponent),
    castle(Opponent, Letter-Number),
    check_board(Board, Symbol, Letter-Number), 
    players_pieces(Player, Symbol),
    nl, nl, write('****GAME OVER****'), nl, write('**** Player '), write(Player), write(' wins****').

game_over(Board, Player) :- enemy(Player, Opponent),
    get_pawns(Board, Opponent, ListOfPawns),
    length(ListOfPawns, 0),
    nl, nl, write('****GAME OVER****'), nl, write('**** Player '), write(Player), write(' wins****').

/*Game loop that receives the initial board and the types of players ('C1', 'C2', 'C3' - computer, 'P' - player)*/
game_loop(Board, TypeOfPlayer1, TypeOfPlayer2) :- 
    players_turn(Board, TypeOfPlayer1, '*', NewBoard), !,
    \+game_over(NewBoard, '*'),
    players_turn(NewBoard, TypeOfPlayer2, '.', NewBoard2), !,
    \+game_over(NewBoard2, '.'),
    game_loop(NewBoard2, TypeOfPlayer1, TypeOfPlayer2).

players_turn(Board, TypeOfPlayer, Player, NewBoard) :- TypeOfPlayer = 'P', 
    readingInput(Board, OldLetter-OldNumber, NewLetter-NewNumber, Player),
    move(OldLetter-OldNumber-NewLetter-NewNumber, TypeOfPlayer, Player, Board, NewBoard).

/*Function that decides the movement for the current's player turn. If the TypeOfPlayer is 'C1', it gets the movement from the easiest level of
computing.*/
players_turn(Board, TypeOfPlayer, Player, NewBoard) :- TypeOfPlayer = 'C1',
    choose_move(1, Player, Move, Board),
    move(Move, TypeOfPlayer, Player, Board, NewBoard).

%players_turn(Board, TypeOfPlayer, Player, NewBoard) :- TypeOfPlayer = 'C2', ...


display(TypeOfPlayer, Player, OldLetter-OldNumber-NewLetter-NewNumber, Board, NewBoard) :- 
    check_jump_over_enemy(Player, OldLetter-OldNumber-NewLetter-NewNumber, Board, Board2), 
    has_enemies(Board2, Player, NewLetter-NewNumber), !,
    display_game(Board2, Player), 
    players_turn(Board2, TypeOfPlayer, Player, NewBoard).

display(_, Player, OldLetter-OldNumber-NewLetter-NewNumber, Board, NewBoard) :- 
    check_jump_over_enemy(Player, OldLetter-OldNumber-NewLetter-NewNumber, Board, NewBoard), !, 
    enemy(Player, Opponent), display_game(NewBoard, Opponent).

display(_, Player, _, Board, NewBoard):- NewBoard=Board,
    enemy(Player, Opponent), display_game(NewBoard, Opponent).

/*Function that checks if pawn has jumped over enemy by checking if it jumped more than one cell and if the cell it jumped over was an enemy.*/
/*Diagonally up-left*/
check_jump_over_enemy(Player, Letter-Number-NewLetter-NewNumber, Board, NewBoard) :-
    Num is Number-NewNumber, char_code(Letter, AsciiLetter), char_code(NewLetter, AsciiNewLetter),
    NumLetter is AsciiLetter-AsciiNewLetter, Num>1, NumLetter>1, N is NewNumber+1, NumL is AsciiNewLetter+1,
    char_code(L, NumL), check_board(Board, Symbol, L-N), enemy(Player, Opponent),
    players_pieces(Opponent, Symbol), change_board(Board, 0, L-N, NewBoard), !.

/*Diagonally down-right*/
check_jump_over_enemy(Player, Letter-Number-NewLetter-NewNumber, Board, NewBoard) :-
    Num is Number-NewNumber, char_code(Letter, AsciiLetter), char_code(NewLetter, AsciiNewLetter),
    NumLetter is AsciiLetter-AsciiNewLetter, Num<0-1, NumLetter<0-1, N is NewNumber-1, NumL is AsciiNewLetter-1,
    char_code(L, NumL), check_board(Board, Symbol, L-N), enemy(Player, Opponent),
    players_pieces(Opponent, Symbol), change_board(Board, 0, L-N, NewBoard), !.

/*Diagonally up-right*/
check_jump_over_enemy(Player, Letter-Number-NewLetter-NewNumber, Board, NewBoard) :-
    Num is Number-NewNumber, char_code(Letter, AsciiLetter), char_code(NewLetter, AsciiNewLetter),
    NumLetter is AsciiLetter-AsciiNewLetter, Num>1, NumLetter<0-1, N is NewNumber+1, NumL is AsciiNewLetter-1,
    char_code(L, NumL), check_board(Board, Symbol, L-N), enemy(Player, Opponent),
    players_pieces(Opponent, Symbol), change_board(Board, 0, L-N, NewBoard), !.

/*Diagonally down-left*/
check_jump_over_enemy(Player, Letter-Number-NewLetter-NewNumber, Board, NewBoard) :-
    Num is Number-NewNumber, char_code(Letter, AsciiLetter), char_code(NewLetter, AsciiNewLetter),
    NumLetter is AsciiLetter-AsciiNewLetter, Num<0-1, NumLetter>1, N is NewNumber-1, NumL is AsciiNewLetter+1,
    char_code(L, NumL), check_board(Board, Symbol, L-N), enemy(Player, Opponent),
    players_pieces(Opponent, Symbol), change_board(Board, 0, L-N, NewBoard),!.

/*Up*/
check_jump_over_enemy(Player, Letter-Number-NewLetter-NewNumber, Board, NewBoard) :-
    Num is Number-NewNumber, char_code(Letter, AsciiLetter), char_code(NewLetter, AsciiNewLetter),
    NumLetter is AsciiLetter-AsciiNewLetter, Num>1, N is NewNumber+1, 
    check_board(Board, Symbol, Letter-N), enemy(Player, Opponent),
    players_pieces(Opponent, Symbol), change_board(Board, 0, Letter-N, NewBoard),!.

/*Down*/
check_jump_over_enemy(Player, Letter-Number-NewLetter-NewNumber, Board, NewBoard) :-
    Num is Number-NewNumber, char_code(Letter, AsciiLetter), char_code(NewLetter, AsciiNewLetter),
    NumLetter is AsciiLetter-AsciiNewLetter, Num<0-1, N is NewNumber-1, 
    check_board(Board, Symbol, Letter-N), enemy(Player, Opponent),
    players_pieces(Opponent, Symbol), change_board(Board, 0, Letter-N, NewBoard),!.

/*Right*/
check_jump_over_enemy(Player, Letter-Number-NewLetter-NewNumber, Board, NewBoard) :-
    Num is Number-NewNumber, char_code(Letter, AsciiLetter), char_code(NewLetter, AsciiNewLetter),
    NumLetter is AsciiLetter-AsciiNewLetter, NumLetter<0-1, NumL is AsciiNewLetter-1,
    char_code(L, NumL), check_board(Board, Symbol, L-Number), enemy(Player, Opponent),
    players_pieces(Opponent, Symbol), change_board(Board, 0, L-Number, NewBoard),!.

/*Left*/
check_jump_over_enemy(Player, Letter-Number-NewLetter-NewNumber, Board, NewBoard) :-
    Num is Number-NewNumber, char_code(Letter, AsciiLetter), char_code(NewLetter, AsciiNewLetter),
    NumLetter is AsciiLetter-AsciiNewLetter, NumLetter>1, NumL is AsciiNewLetter+1,
    char_code(L, NumL), check_board(Board, Symbol, L-Number), enemy(Player, Opponent),
    players_pieces(Opponent, Symbol), change_board(Board, 0, L-Number, NewBoard),!.

/*When the pawn doesn't jump over an enemy.*/
%check_jump_over_enemy(_, _-_-_-_, Board, NewBoard) :- NewBoard = Board.