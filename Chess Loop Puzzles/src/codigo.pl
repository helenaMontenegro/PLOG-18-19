:- use_module(library(clpfd)).
:- use_module(library(lists)).

/*------------------------------MENU-------------------------------*/
/*Function that starts the menu.*/
menu :-
	print_options,
	read(Input),
	analise_input(Input).

/*Function which calls the decision problem with the right arguments according to the user's input.*/
analise_input(16):-statistics(walltime, [Start,_]),
    chess_loops(3,2,[1,2],[2,2]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(1):-statistics(walltime, [Start,_]),
    chess_loops(3,2,[4,3],[2,2]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(2):-
statistics(walltime, [Start,_]),
    chess_loops(5,4,[3,4],[3,3]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(3):-statistics(walltime, [Start,_]),
    chess_loops(4,2,[4,1],[2,2]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(4):-statistics(walltime, [Start,_]),
    chess_loops(5,4,[1,4],[3,3]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(5):-statistics(walltime, [Start,_]),
    chess_loops(3,3,[3,2],[2,2]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

 analise_input(6):-statistics(walltime, [Start,_]),
    chess_loops(4,4,[2,3],[4,4]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(7):-statistics(walltime, [Start,_]),
    chess_loops(5,3,[2,3],[4,4]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(8):-statistics(walltime, [Start,_]),
    chess_loops(6,4,[2,4],[4,4]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(9):-statistics(walltime, [Start,_]),
    chess_loops(5,5,[4,2],[4,4]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(10):-statistics(walltime, [Start,_]),
    chess_loops(4,3,[1,3],[3,3]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(11):-statistics(walltime, [Start,_]),
    chess_loops(8,3,[1,3],[5,5]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(12):-statistics(walltime, [Start,_]),
    chess_loops(4,2,[5,3],[2,2]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(13):-statistics(walltime, [Start,_]),
    chess_loops(6,3,[5,3],[3,3]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(14):-statistics(walltime, [Start,_]),
    chess_loops(5,4,[5,3],[3,3]),
    statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(15):-
 statistics(walltime, [Start,_]),
    chess_loops(7,4,[3,5],[4,4]),
     statistics(walltime, [End,_]),
     Time is End - Start,
     format('~3d seconds.~n', [Time]),
    menu.

analise_input(17):-
    write('Exiting...'), nl.

analise_input(_) :-
    write('\nError: that option does not exist.\n\n'),
    menu.

/*Function that prints the menu in the console.*/
print_options :- nl,
    write('        |------------------------------------------------------------------------|'),nl,
	write('        |    ___ _                _                    ___            _          |'),nl,
	write('        |   / __| |_  ___ ______ | |   ___  ___ _ __  | _ \\_  _ _____| |___ ___  |'),nl,
	write('        |  | (__| \' \\/ -_|_-<_-< | |__/ _ \\/ _ \\ \'_ \\ |  _/ || |_ /_ / / -_|_-<  |'),nl,
	write('        |   \\___|_||_\\___/__/__/ |____\\___/\\___/ .__/ |_|  \\_,_/__/__|_\\___/__/  |'),nl,
	write('        |                                      |_|                               |'),nl,
    write('        |                                                                        |'),nl,
    write('        |                  1. 2 knights and kings on a 2x3 board                 |'),nl,
    write('        |                  2. 3 knights and kings on a 4x5 board                 |'),nl,
    write('        |                  3. 2 rooks and kings on a 2x4 board                   |'),nl,
    write('        |                  4. 3 rooks and kings on a 4x5 board                   |'),nl,
	write('        |                  5. 2 bishops and knights on a 3x3 board               |'),nl,
	write('        |                  6. 4 bishops and knights on a 4x4 board               |'),nl,
    write('        |                  7. 3 bishops and knights on a 3x5 board               |'),nl,
    write('        |                  8. 4 bishops and kings on a 4x6 board                 |'),nl,
	write('        |                  9. 4 bishops and kings on a 5x5 board                 |'),nl,
	write('        |                 10. 3 knights and rooks on a 3x4 board                 |'),nl,
	write('        |                 11. 5 knights and rooks on a 3x8 board                 |'),nl,
	write('        |                 12. 2 knights and queens on a 2x4 board                |'),nl,
    write('        |                 13. 3 knights and queens on a 3x6 board                |'),nl,
	write('        |                 14. 3 knights and queens on a 4x5  board               |'),nl,
	write('        |                 15. 4 knights and queens on a 4x7 board                |'),nl,
    write('        |                 16. 2 bishops and rooks on a 2x3 board                 |'),nl,
    write('        |                                                                        |'),nl,
    write('        |                                 17. Exit                               |'),nl,
    write('        |                                                                        |'),nl,
    write('        |                       Please choose a option...                        |'),nl,
    write('        |                                                                        |'),nl,
    write('        |          --Developed by Helena Montenegro and Juliana Marques--        |'),nl,
	write('        |------------------------------------------------------------------------|'),nl,
	nl,nl,nl.

/*---------------------------DISPLAY-------------------------------*/
/*Function to display the board received as argument*/
display_board([H|T]) :- 
    length(H, Len), 
    display_board([H|T], Len).

display_board([], Len) :- write(' '), display_sep(Len).
display_board([H|T], Len) :- 
    write(' '),
    display_sep(Len),
    write(' |'), 
    display_line(H),
    display_board(T, Len).

/*Auxiliar function to display separator between lines*/
display_sep(0) :- nl.
display_sep(Len) :- write('-----'), L is Len-1, display_sep(L).

/*Auxiliar function to display the line of the board received as argument*/
display_line([]) :- nl.
display_line([H|T]) :-  translate_symbol(H, Symbol), write(' '), write(Symbol), write(' |'), display_line(T).

/*Function to translate numerical values in board to easy to recognize symbols*/
translate_symbol(0, '  ').
translate_symbol(1, Char) :- char_code(Char, 9814).
translate_symbol(2, Char) :- char_code(Char, 9815).
translate_symbol(3, Char) :- char_code(Char, 9816).
translate_symbol(4, Char) :- char_code(Char, 9812).
translate_symbol(5, Char) :- char_code(Char, 9813).

/*------------------------END-OF-DISPLAY--------------------------*/

/*------------------------MAIN-FUNCTION---------------------------*/
/*Main funcion which recieves the number of each pawn in the loop and the board's dimensions and does the chess loop.
The variable is the board that will contain the elements, represented by an array.
The numbers represent:
 0 - empty cell
 1 - rook
 2 - bishop
 3 - horse
 4 - king
 5 - queen
*/
chess_loops(TamX, TamY, Pawns, Quantity) :-
    TamTot is TamX*TamY, 
    length(Board, TamTot),
    domain(Board, 0, 5),

%Restriction 1: restricts number of each type of pawn in the board
    restrict_number_pawns(Board, Pawns, Quantity, 0, NCells),
    WhiteCells is TamTot-NCells,
    count(0, Board, #=, WhiteCells),

%Restriction 2: there cant be an empty row or column on the edges
    getOuterColumn(TamX, TamY, OuterColumn, Board),
    length(OuterColumn, OuterLen),
    count(0, OuterColumn, #<, OuterLen),
    getInnerColumn(TamX, TamY, InnerColumn, Board),
    length(InnerColumn, InnerLen),
    count(0, InnerColumn, #<, InnerLen),
    length(FirstRow, TamX),
    append(FirstRow, _, Board),
    count(0, FirstRow, #<, TamX),
    length(LastRow, TamX),
    append(_, LastRow, Board),
    count(0, LastRow, #<, TamX),

%Restriction 3: restricts the place where each pawn can be (further explained in the function that applies it)
    nth1(1, Quantity, Quant),
    restrict_movement(Quant, Pawns, Board, TamX, TamY, List),

%Restriction 4: with one movement, one pawn can reach one and one only other pawn
    restriction_cant_move(Board, Pawns, List, TamX, TamY, 1),
    append(Board, List, B), !,

%End of restrictions
    labeling([occurrence, enum], B),
    make_board_matrix(Board, BoardMatrix, [], TamX),
    display_board(BoardMatrix).

/*Restriction that from one cell with a pawn only one movement can reach a cell with a pawn, the rest of the cells 
reachable with one movement have to be empty.*/
restriction_cant_move(Board, [Pawn, _], List, TamX, TamY, Count) :-
    length(List, Count),
    element(Count, List, Place),
    element(1, List, Place3),
    make_list(Pawn, Count, Place, Place3, TamX, TamY, List, ListToSend, 1),
    cant_move(Board, Pawn, Place, ListToSend, TamX, TamY).
restriction_cant_move(Board, [Pawn, Pawn2], List, TamX, TamY, Count) :-
    element(Count, List, Place),
    C is Count+1,
    element(C, List, Place3),
    make_list(Pawn, Count, Place, Place3, TamX, TamY, List, ListToSend, 1),
    cant_move(Board, Pawn, Place, ListToSend, TamX, TamY),
    restriction_cant_move(Board, [Pawn2, Pawn], List, TamX, TamY, C).

/*Function that goes through the not instantiates list of positions of each pawn and returns the list of positions that 
the pawn received as argument (whose index in the list is Count, whose position is Place and which attacks the pawn
in the position Place3) can't attack.*/
make_list(_, _, _, _, _, _, [], [], _).
make_list(Pawn, Count, Place, Place3, TamX, TamY, [H1|T1], List, Aux) :-
    length([H1|T1], Count), Aux = 1, A is Aux+1,
    make_list(Pawn, Count, Place, Place3, TamX, TamY, T1, List, A).
make_list(Pawn, Count, Place, Place3, TamX, TamY, [_|T1], List, Aux) :-
    Aux = Count, A is Aux+1,
    make_list(Pawn, Count, Place, Place3, TamX, TamY, T1, List, A).
make_list(Pawn, Count, Place, Place3, TamX, TamY, [_|T1], List, Aux) :-
    Aux is Count+1, A is Aux+1,
    make_list(Pawn, Count, Place, Place3, TamX, TamY, T1, List, A).
make_list(Pawn, Count, Place, Place3, TamX, TamY, [H1|T1], List, Aux) :- Pawn \= 3, Pawn \=4, 
    translate_position_coords(Place, X1, Y1, TamX, TamY),
    translate_position_coords(H1, X2, Y2, TamX, TamY),
    translate_position_coords(Place3, X3, Y3, TamX, TamY),
    ((X2#=X1 #/\ Y2#\=Y1 #/\ X3#=X1 #/\ Y3#\=Y1 #/\ Place3 #> Place #/\ H1 #> Place3) #\/
    (X2#=X1 #/\ Y2#\=Y1 #/\ X3#=X1 #/\ Y3#\=Y1 #/\ Place3 #< Place #/\ H1 #< Place3) #\/
    (X2#\=X1 #/\ Y2#=Y1 #/\ X3#\=X1 #/\ Y3#=Y1 #/\ Place3 #> Place #/\ H1 #> Place3) #\/
    (X2#\=X1 #/\ Y2#=Y1 #/\ X3#\=X1 #/\ Y3#=Y1 #/\ Place3 #< Place #/\ H1 #< Place3) #\/
    (X2#=X1+A #/\ Y2#=Y1+B #/\ A#\= 0 #/\ X3#=X1+B #/\ Y3#=Y1+B #/\ B#\= 0 #/\ Place3 #< Place #/\ H1 #< Place3) #\/
    (X2#=X1+A #/\ Y2#=Y1-A #/\ A#\= 0 #/\ X3#=X1+B #/\ Y3#=Y1-B #/\ B#\= 0 #/\ Place3 #< Place #/\ H1 #< Place3)) #<=> Val,
    interpret_val(Val, Pawn, Count, Place, Place3, TamX, TamY, [H1|T1], List, Aux).
make_list(Pawn, Count, Place, Place3, TamX, TamY, [H1|T1], [H2|T2], Aux) :- 
    A is Aux+1,
    H2 #= H1,
    make_list(Pawn, Count, Place, Place3, TamX, TamY, T1, T2, A).

/*Function auxiliary to the one above, to ensure the restriction done before #<=> is imposed. It's useful for 
cases where for the pawn to arrive at another pawn it has to jump. In these cases the other pawn can be at a place
reachable from the initial pawn with one movement.*/
interpret_val(Val, Pawn, Count, Place, Place3, TamX, TamY, [H1|T1], [H2|T2], Aux) :-
    (H2 #= H1) #\ Val,
    A is Aux+1,
    make_list(Pawn, Count, Place, Place3, TamX, TamY, T1, T2, A).

/*Function that goes through the list generated in make_list() and ensures that the Pawn can't reach any of 
the pawns positioned in the elements of this list. Place refers to the place where the Pawn is positioned.*/
cant_move(_, _, _, [], _, _).
cant_move(Board, Pawn, Place, [Place1 | Rest], TamX, TamY) :- 
    not_choose_move(Pawn, Place, Place1, TamX, TamY), 
    cant_move(Board, Pawn, Place, Rest, TamX, TamY).

/*Function that restricts the position of the pawn received as argument.
Recursively, it will choose a pawn of type received as argument in Pawn. In one movement the pawn has to reach an enemy pawn, so
the function gets the position of two pawns in the board, one of the received type and other of any other type and checks if
in one movement the first pawn can get to the second pawn's position by calling the function for the respective type of movement.*/
restrict_movement(0, _, _, _, _, []).
restrict_movement(Quantity, [Pawn, Pawn2], Board, TamX, TamY, ListToReturn) :- 
    Quantity > 0,
    element(Place, Board, Pawn),
    element(Place2, Board, Pawn2),
    element(Place3, Board, Pawn),
    Place3 #\= Place,
    choose_move(Pawn, Place, Place2, TamX, TamY, Board),
    choose_move(Pawn2, Place2, Place3, TamX, TamY, Board),
    List = [Place, Place2],
    Q is Quantity-1,
    restrict_movement(Q, List, Place3, Place, [Pawn,Pawn2], Board, TamX, TamY, ListToReturn).

/*This function is called for the second and so on iterations, to make sure that the recursivity isn't applied to the same pawn as 
the previous iteration.*/
restrict_movement(0, ListToReturn, _, _, _, _, _, _, ListToReturn).
restrict_movement(Quantity, List, Place, FirstPlace, [Pawn, Pawn2], Board, TamX, TamY, ListToReturn) :- 
    Quantity > 0,
    element(Place2, Board, Pawn2),
    diff_place(Place2, List),
    element(Place3, Board, Pawn),
    place3_place1(Place3, Place, FirstPlace, Quantity, List),
    choose_move(Pawn, Place, Place2, TamX, TamY, Board),
    choose_move(Pawn2, Place2, Place3, TamX, TamY, Board),
    append(List, [Place], L),
    append(L, [Place2], L4),    
    Q is Quantity-1,
    restrict_movement(Q, L4, Place3, FirstPlace, [Pawn, Pawn2], Board, TamX, TamY, ListToReturn).

/*Function that defines the relationship between the cell to which the second pawn can move to (Place) and the cell where the first pawn that was
position is (FirstPlace), as well as the cell to which the first pawn that was positioned in the same iteration is (Place1). 
If the function restrict_movement is in the last iteration the place is the place resulting of the movement of the last pawn positioned and,
as such, has to overlap with the FirstPlace, where the first cell to be positioned is.
If the function is at any other iteration but the last, the Place has to be a cell where no other cell was positioned so far.*/
place3_place1(Place, _,FirstPlace, Q, _) :- Q#=1, Place #= FirstPlace.
place3_place1(Place, Place1, _, Q, List) :- Q#>1, Place #\= Place1, diff_place(Place, List).

/*Function that checks if the first argument is not a member of the list received as the second argument (similar to member, but with
restrictions).*/
diff_place(_, []) :- !.
diff_place(Place, [PlaceDiff|Rest]) :-
    Place #\= PlaceDiff,
    diff_place(Place, Rest).

/*Function that applies restriction to the number of pawns in the board.
It receives the Board, the list of Paws that should exist in the board, the list of quantities of the pawns in the board, an auxiliary
value meant to help discover the last argument to be returned which is the number of pawns of any type in the board.*/
restrict_number_pawns(_, [], [], Count, Count).
restrict_number_pawns(Board, [Pawn1|RestOfPawns], [Quant1|RestOfQuants], AuxCount, Count) :-
    count(Pawn1, Board, #=, Quant1),
    Aux is AuxCount + Quant1,
    restrict_number_pawns(Board, RestOfPawns, RestOfQuants, Aux, Count).

/*Auxiliar function that gets the last column of the board in order to use it in the chess_loops to check if it's not filled with empty cells.
It receives the dimensions of the board (TamX and TamY) and the board and it returns the last column.*/
getOuterColumn(_, 0, [], _).
getOuterColumn(TamX, TamY, [H|T], Board) :-
    Pos is TamX * TamY,
    element(Pos, Board, H),
    Tam is TamY-1,
    getOuterColumn(TamX, Tam, T, Board).

/*Auxiliar function that gets the first column of the board in order to use it in the chess_loops to check if it's not filled with empty cells.
It receives the dimensions of the board (TamX and TamY) and the board and it returns the first column.*/
getInnerColumn(_, 0, [], _).
getInnerColumn(TamX, TamY, [H|T], Board) :-
    Pos is TamX * TamY - TamX + 1,
    element(Pos, Board, H),
    Tam is TamY-1,
    getInnerColumn(TamX, Tam, T, Board).

/*Funtion that turns the board's list into a matrix.
It receives the Board, and the size of a row of the board and it returns the matrix.*/
make_board_matrix([], BoardMatrix, BoardMatrix, _).
make_board_matrix(Board, BoardMatrix, AuxBoard, TamX) :-
    get_line(Board, Rest, TamX, Line),
    append(AuxBoard, [Line], AuxToSend),
    make_board_matrix(Rest, BoardMatrix, AuxToSend, TamX).

/*Auxiliar function that get's one line of the board and returns the rest of the board.*/
get_line(Board, Board, 0, []).
get_line([H|T], Rest, TamX, [H1|T1]) :-
    H1 = H,
    Tam is TamX - 1,
    get_line(T, Rest, Tam, T1).


/*----------------------END-OF-MAIN-FUNCTION-----------------------*/

/*-------------------------PAWNS-MOVEMENTS-------------------------*/

/*Function that depending on the Pawn received as first argument calls its type of movement*/
choose_move(1, Place1, Place2, TamX, TamY, _) :- rook_move(Place1, Place2, TamX, TamY).
choose_move(2, Place1, Place2, TamX, TamY, _) :- bishop_move(Place1, Place2, TamX, TamY).
choose_move(3, Place1, Place2, TamX, TamY, _) :- horse_move(Place1, Place2, TamX, TamY).
choose_move(4, Place1, Place2, TamX, TamY, _) :- king_move(Place1, Place2, TamX, TamY).
choose_move(5, Place1, Place2, TamX, TamY, _) :- queen_move(Place1, Place2, TamX, TamY).

/*Function that ensures that the Place2 is a cell that the Pawn can't reach with one movement*/
not_choose_move(1, Place1, Place2, TamX, TamY) :- not_rook_move(Place1, Place2, TamX, TamY).
not_choose_move(2, Place1, Place2, TamX, TamY) :- not_bishop_move(Place1, Place2, TamX, TamY).
not_choose_move(3, Place1, Place2, TamX, TamY) :- not_horse_move(Place1, Place2, TamX, TamY).
not_choose_move(4, Place1, Place2, TamX, TamY) :- not_king_move(Place1, Place2, TamX, TamY).
not_choose_move(5, Place1, Place2, TamX, TamY) :- not_queen_move(Place1, Place2, TamX, TamY).

/*Function that translates a cell's position (Pos) in an list to its coordinates in a matrix (X and Y)*/
translate_position_coords(Pos, X, Y, TamX, _) :- 
    P #= Pos - 1,
    X #= mod(P, TamX) + 1, 
    Y #= P // TamX + 1.

/*The following functions have as arguments:
 Pos1 - the position in the Board array in which the pawn is supposed to be
 Pos2 - a position to which the pawn can move from Pos1
 TamX - the number of columns of the board
 TamY - the number of rows of the board*/

/*Function that defines the bishop's movement.*/
bishop_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    A#\=0,
    X2 #= X1 + A,
    (Y2 #= Y1 + A #\/ Y2 #= Y1 - A).

/*Function that ensures that the cell Pos2 is not reachable with the bishop's movement from the cell Pos1*/
not_bishop_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    (X2 #= X1 + A #/\
    (Y2 #\= Y1 + A #/\ Y2 #\= Y1 - A)).

/*Function that defines the rook's movement.*/
rook_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    A#\=0,
    ((X1 #= X2 #/\ Y1 #= Y2+A) #\/ 
    (X1 #= X2 + A #/\ Y1 #= Y2)).

/*Function that ensures that the cell Pos2 is not reachable with the rook's movement from the cell Pos1*/
not_rook_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    X1 #\= X2 #/\ Y1 #\= Y2.

/*Function that defines the horse's movement.*/
horse_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    (X1 #= X2 + 2 #/\ Y1 #= Y2 + 1) #\/
    (X1 #= X2 + 2 #/\ Y1 #= Y2 - 1) #\/
    (X1 #= X2 + 1 #/\ Y1 #= Y2 + 2) #\/
    (X1 #= X2 + 1 #/\ Y1 #= Y2 - 2) #\/
    (X1 #= X2 - 2 #/\ Y1 #= Y2 - 1) #\/
    (X1 #= X2 - 2 #/\ Y1 #= Y2 + 1) #\/
    (X1 #= X2 - 1 #/\ Y1 #= Y2 - 2) #\/
    (X1 #= X2 - 1 #/\ Y1 #= Y2 + 2).

/*Function that ensures that the cell Pos2 is not reachable with the horse's movement from the cell Pos1*/
not_horse_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    (X1 #\= X2+2 #/\
    X1 #\= X2-2 #/\
    X1 #\= X2+1 #/\
    X1 #\= X2-1) #\/
    (X1 #= X2 + 2 #/\ Y1 #\= Y2 + 1 #/\ Y1 #\= Y2 - 1) #\/
    (X1 #= X2 + 1 #/\ Y1 #\= Y2 + 2 #/\ Y1 #\= Y2 - 2) #\/
    (X1 #= X2 - 2 #/\ Y1 #\= Y2 - 1 #/\ Y1 #\= Y2 + 1) #\/
    (X1 #= X2 - 1 #/\ Y1 #\= Y2 - 2 #/\ Y1 #\= Y2 + 2).

/*Function that defines the king's movement.*/
king_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    ((X2 #= X1 + 1 #\/ X2 #= X1 - 1) #/\ (Y2 #= Y1 + 1 #\/ Y2 #= Y1 - 1)) #\/
    ((X2 #= X1 + 1 #\/ X2 #= X1 - 1) #/\ Y2 #= Y1) #\/
    (X2 #= X1 #/\ (Y2 #= Y1 + 1 #\/ Y2 #= Y1 - 1)).

/*Function that ensures that the cell Pos2 is not reachable with the king's movement from the cell Pos1*/
not_king_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    ((X2 #= X1 + 1 #\/ X2 #= X1 - 1) #/\ (Y2 #\= Y1 + 1 #/\ Y2 #\= Y1 - 1) #/\ Y2 #\= Y1) #\/
    X2 #> X1+1 #\/ X2 #< X1-1 #\/
    (X2 #= X1 #/\ (Y2 #\= Y1 + 1 #/\ Y2 #\= Y1 - 1)).

/*Function that defines the queen's movement.*/
queen_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    ((X2 #= X1 + A) #/\ (Y2 #= Y1 + A #\/ Y2 #= Y1 - A)) #\/
    (X1 #= X2 #/\ Y1 #\= Y2) #\/ (X1 #\= X2 #/\ Y1 #= Y2).

/*Function that ensures that the cell Pos2 is not reachable with the queen's movement from the cell Pos1*/
not_queen_move(Pos1, Pos2, TamX, TamY) :- 
    translate_position_coords(Pos1, X1, Y1, TamX, TamY),
    translate_position_coords(Pos2, X2, Y2, TamX, TamY),
    X2 #\= X1  #/\ Y2 #\= Y1  #/\
    (X2 #= X1 + A #/\ Y2 #\= Y1 + A #/\ Y2 #\= Y1 - A).

/*----------------------END_OF_PAWNS-MOVEMENTS---------------------*/