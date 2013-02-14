function [Jump,list_of_S,list_of_moves] = CheckMove(S,a,b,aa,bb,d,Jump,list_of_S,list_of_moves,RW,FB)

if ((S(bb,aa)==0) && (Jump==0))  %simple move of the piece
    [list_of_S,list_of_moves] = SimulateMove(S,a,b,aa,bb,list_of_S,list_of_moves,RW);
    
elseif ((S(bb,aa)==2-RW) || (S(bb,aa)==4-RW)) %white/red piece in front, so Jump maybe possible
    ng=Neighbor(aa,bb,d,RW,FB); %keep same direction d.
    if (ng ~= 0) %neighbor must be inside the board
        if (S(ng(2),ng(1))==0) %neighbor must be empty to accept Jump and Jump is obliged
            if (Jump==0)
                Jump=1; %first jump
                list_of_S = 0; %reinitialize the list of S's.
                list_of_moves=0; %reinitialize the list_of_moves
            end
            [list_of_S,list_of_moves]=MakeJump(S,a,b,aa,bb,ng(1),ng(2),Jump,list_of_S,list_of_moves,RW);
        end
    end
end