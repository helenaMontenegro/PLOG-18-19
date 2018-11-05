/*Function to generate an integer between 0 and size of validMoves.*/
choose_move(Difficulty, Player, Move, Board) :- Difficulty = 1,
    valid_moves(Board, Player, ListOfMoves), length(ListOfMoves, Len), 
    random(0, Len, Int), 
    nth0(Int, ListOfMoves, Move).