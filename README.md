# PLOG 2018/2019

Curricular Unity: PLOG - Logic Programming <br>
Lective Year: 2018/2019

Programming Language: Prolog <br>
Program used: Sicstus.

Developed in collaboration with *Juliana Marques*.

## Cam

We developed the game Cam, with the following game modes: *PC vs PC*, *Player vs PC* and *Player vs Player*. There are two levels of difficulty, one where the plays are selected randomly, and another one where every board is evaluated with a number from 0 to 100 and best one is chosen. This evaluation takes into account the distance between the opponent's castle and the player's piece which is closest to it, the average of the difference between every piece of the player and the opponent's castle, and whether or not the board holds a piece of the player which has an enemy next to it.

The implementation as well as the game are further explained in [here](https://github.com/helenaMontenegro/PLOG-18-19/blob/master/docs/report_cam.pdf).

This is an example of how the interface looks like:

![Cam Image](https://github.com/helenaMontenegro/PLOG-18-19/blob/master/docs/Cam1.JPG)

A 3D interface for this game was implemented for another curricular unity (LAIG) and it is available [here](https://github.com/helenaMontenegro/LAIG-18_19).

## Chess Loop Puzzles

The objective of this project was to implement a program to solve a decision problem using restrictions, where the decision problem is Chess Loop Puzzles. The objective of Chess Loop Puzzles is to position different types of chess pieces in a board with different dimensions so that each piece attacks, with its characteristic movement, only a piece of a different type, forming a loop.

The implementations is further explained in [here](https://github.com/helenaMontenegro/PLOG-18-19/blob/master/docs/report_chess_loops.pdf).

This is an example of the program, where there are 5 towers and 5 horses in a 8x3 board:

![Chess Loops Image](https://github.com/helenaMontenegro/PLOG-18-19/blob/master/docs/ChessLoops1.JPG)
