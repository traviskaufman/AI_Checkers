function [value] = MaxValue(S, in_alpha, in_beta, RW, flag, depth)

%this is implmented following the algorithm

%one tricky here is the use of mod(RW+1, 2), this is used to switch the
%value of RW between 0 and 1

[list_of_S,list_of_moves, flag, Jump] = Successors(S, RW, flag);

if TerminalTest(S, RW, flag, depth, Jump)
    value = Utility(S, RW);
else
    value = -inf;
    for i = 1:length(list_of_S(1,1,:))
        value = max(value, MinValue(list_of_S(:,:,i), in_alpha, in_beta, mod(RW+1, 2), flag, depth+1));
        if value >= in_beta
            break; % return value
        end
        in_alpha = max(in_alpha, value);
    end
end

end