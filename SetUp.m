function [flag, S, RED_TO_PLAY, BLACK_TO_PLAY] = SetUp(key)
% Unit Test Test Bootstrap
flag = 0;
scenarios = GetScenarios;
S = InitBoardWithState(scenarios(key));
RED_TO_PLAY = 0;
BLACK_TO_PLAY = 1;
end
