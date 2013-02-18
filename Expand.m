function [S, flag] = Expand(S, RW, flag)

% do a Min-Max-Desicion Search, return the State and best move
[S, move, flag] = MinMaxDecision(S, RW, flag);

move % output the move given by each player

if (flag == 1)
    if(RW == 0)
        disp('Red lose the game');
    else
        disp('White lose the game');
    end
end

end
