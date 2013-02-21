function [result] = TerminalTest(S, RW, flag, depth, Jump, round)
%function to find whether the search should stop.

result = 0;

maxDepth = max((log2(40) - log2(round)), 1);

%if depth of search reach a max value, then stop
if (depth > maxDepth && Jump ~= 1) % maximum depth
    result = 1;
end

%or someone lose the game, stop searching
if (flag == 1)
    result = 1;
end

end