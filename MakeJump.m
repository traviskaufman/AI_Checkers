function [list_of_S,list_of_moves] = MakeJump(S,a,b,aa,bb,aaa,bbb,Jump,list_of_S,list_of_moves,RW)

piece=S(b,a);
S(b,a)=0; %empty previous occupied spot by RW piece
S(bb,aa)=0; %empty previous occupied spot by 1-RW piece
promotion=0;

if ((bbb==1+7*(1-RW)) && (piece==1+RW)) %King promotion for simple pieces
    promotion=1;
    S(bbb,aaa)=3+RW;
else
    S(bbb,aaa)=piece;
end

[list_of_S,list_of_moves]=ListUpdate(S,a,b,aaa,bbb,list_of_S,list_of_moves);

if (promotion ~= 1) %check possilbe new jump
    [Jump,list_of_S,list_of_moves]=ExploitMoves(S, aaa, bbb, Jump,  list_of_S, list_of_moves, RW);
end
