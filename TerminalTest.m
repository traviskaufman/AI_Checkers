function [result] = TerminalTest(S, RW, flag, depth, Jump)

%function to find whether the search should stop.

result = 0;
[list_of_S,list_of_moves, flag] = Successors(S, RW, flag);

%if depth of search reach a max value, then stop
if (depth > 4 && Jump ~= 1) % maximum depth
    result = 1;
end

%or someone lose the game, stop searching
if (flag == 1)
    result = 1;
end

end