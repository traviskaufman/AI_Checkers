function [S] =InitializeGame 
%initialize a game of checkers.
%   Detailed explanation goes here
S=zeros(8);

for a=1:8
    for b=1:3
        if (mod(a+b,2)~=0)
            S(b,a)=1; %red pieces
        end
    end
    for b=6:8
        if (mod(a+b,2)~=0)
            S(b,a)=2; %red pieces
        end
    end
end
