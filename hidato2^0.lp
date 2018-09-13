%* cerner_2^5_2018 
This program solves Hidato which is a logic puzzle, known also as Number Snake. You are given a
grid partially filled with numbers, for instance:
  6 e e
  e 2 8
  1 e e
where e stands for empty cell.
The goal is to fill the grid so that consecutive numbers connect horizontally,
vertically, or diagonally.
you can run this code here : https://potassco.org/clingo/run/
*%

%initial setting.
grid(1,1,6).grid(2,2,2).grid(2,3,8).grid(3,1,1).
#const gridSize = 3.
%Generate a value for every box in grid.
1 { grid(Row, Col, Val) : Val=1..gridSize*gridSize } 1 :- Row=1..gridSize, Col=1..gridSize.
1 { grid(Row, Col, Val) : Row=1..gridSize, Col=1..gridSize } 1 :- Val=1..gridSize*gridSize.
% create a window of possible state combination.
window(Row, Col+1, Row, Col) :- Row=1..gridSize, Col=1..gridSize.
window(Row, Col, Row, Col+1) :- Row=1..gridSize, Col=1..gridSize.
window(Row, Col+1, Row+1, Col) :-Row=1..gridSize, Col=1..gridSize.
window(Row, Col, Row+1, Col) :- Row=1..gridSize, Col=1..gridSize.
window(Row, Col, Row+1, Col+1) :- Row=1..gridSize, Col=1..gridSize.
window(Row+1, Col+1, Row, Col) :- Row=1..gridSize, Col=1..gridSize.
window(Row+1, Col, Row, Col) :- Row=1..gridSize, Col=1..gridSize.
window(Row+1, Col, Row, Col+1) :- Row=1..gridSize, Col=1..gridSize.
%Remove states combinations out of window.
:-grid(Row1,Col1,Val), grid(Row2, Col2, Val+1), not window(Row1,Col1,Row2,Col2), Val=1..gridSize*gridSize.
%Prints the output.
#show grid/3.