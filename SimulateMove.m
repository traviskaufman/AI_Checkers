function [list_of_S,list_of_moves]=SimulateMove(S,a,b,aa,bb,list_of_S,list_of_moves,RW)

SS=S;
SS(b,a)=0; %move piece to (aa,bb)

if ((bb==1+7*(1-RW)) && (S(b,a)==1+RW)) %King promotion for simple pieces
    SS(bb,aa)=3+RW;  %king promotion
else
    SS(bb,aa)=S(b,a);
end
[list_of_S,list_of_moves] = ListUpdate(SS,a,b,aa,bb,list_of_S,list_of_moves);

end