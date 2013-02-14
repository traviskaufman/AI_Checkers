function [list_of_S,list_of_moves] = ListUpdate(S,a,b,aaa,bbb,list_of_S,list_of_moves)

candidate=zeros(4,1);
candidate(1)=a;
candidate(2)=b;
candidate(3)=aaa;
candidate(4)=bbb;

if (list_of_moves==0)
    list_of_moves=candidate;
else
    list_of_moves=cat(2,candidate,list_of_moves);
end

if (list_of_S==0)
    list_of_S=S;
else
    list_of_S=cat(3,S,list_of_S);
end
end
