function [S, move, flag] = MinMaxDecision(S, RW, flag)

%first find all the successors of the current state
[list_of_S, list_of_moves, flag, Jump] = Successors(S, RW, flag);

%if no successors, then game over, set flag to 1 and return
%previously a bug here, lots of time consumed to find it.
if (list_of_S == 0)
    flag = 1;
    move = 0;
    return;
end

%find the max utility value for current state
[value] = MaxValue(S, -inf, inf, RW, flag, 0); % depth zero

%search one step further to find which successor can provide the above max
%utility value, and return this step(move/action)
%this may be less efficient because lots of redundent exists
%here. it may affect the constant factor in the time complexity
for i = 1:length(list_of_S(1,1,:))
    if(value == MinValue(list_of_S(:,:,i), -inf, inf, mod(RW+1,2), flag, 1))
        S = list_of_S(:,:,i);
        move = list_of_moves(:,i);
        break; %if find a right successor with minimul value, skip the rest. saves some time.
    end
end

end