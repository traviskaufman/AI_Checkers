function [board] = InitBoardWithState(pieces)
%INITBOARDWITHSTATE Initialize the checker board with a pre-built state.
%   Used for scenario testing.

len = length(pieces);
board = zeros(8);

for i=1:len
    piece = pieces(i);
    board(piece.row, piece.column) = piece.color;

end


