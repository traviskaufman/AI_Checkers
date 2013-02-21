function [S]=SimulateGame 
%SIMULATE A GAME OF CHECKERS

S = InitializeGame;
flag=0; %flag to detect if the game ended
t=1;
numberOfPlays = 40;

while t <= numberOfPlays %up to 60 plays per player
    t % output the round number
    S % output the board information
    if (flag == 1)
        disp('game end');
        t = inf;
    else
        [S, flag] = Expand(S,0,flag, t);
        if (flag == 1)
            disp('game end');
            t = inf;
        else
            [S, flag] = Expand(S,1,flag, t);
        end
    end
    t=t+1;
end

    % if no playe lose after 40 round, then they should agree to draw
    if (t == numberOfPlays + 1) 
        disp('Agree to draws');
        S %output the final board information
    end
end