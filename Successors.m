function [list_of_S,list_of_moves, flag, Jump] = Successors(S, RW, flag)

%function to find all the successors of a state
%this is implemented in checker 1

list_of_moves=0;
list_of_S = 0;
Jump=0;

for a=1:8
    for b=1:8
        if (mod(a+b,2)~=0)
            if ((S(b,a)==1+RW) || (S(b,a)==3+RW)) %RW piece
                % Exploit grid with R/W pieces
                [Jump,list_of_S,list_of_moves] = ExploitMoves(S,a,b,Jump,list_of_S,list_of_moves,RW);
            end
        end
    end
end

if (list_of_moves==0)
    flag=1;
end

end