function TestScenario1
%TESTSCENARIO1 Tests Checkers Scenario 1 (see GetScenarios.m)
[flag, S, RED_TO_PLAY, BLACK_TO_PLAY] = SetUp('JMP_FWD_NO_JMP_BKWD');

expectedStateAfterFirstMove = [
    0     0     0     0     0     0     0     0
    0     0     0     0     0     0     0     0
    0     0     0     0     0     1     0     0
    0     0     0     0     0     0     0     0
    0     0     0     0     0     0     0     0
    0     0     0     0     0     0     0     0
    0     1     0     1     0     0     0     0
    2     0     0     0     0     0     0     0
];

expectedFlagAfterFirstMove = 0;

expectedStateAfterSecondMove = [
    0     0     0     0     0     0     0     0
    0     0     0     0     0     0     0     0
    0     0     0     0     0     1     0     0
    0     0     0     0     0     0     0     0
    0     0     0     0     0     0     0     0
    0     0     2     0     0     0     0     0
    0     0     0     1     0     0     0     0
    0     0     0     0     0     0     0     0
];

expectedFlagAfterSecondMove = 0;

% Check the first sequence
[S, flag] = Expand(S, RED_TO_PLAY, flag);
assertEquals(...
    'Expected State After First Move', expectedStateAfterFirstMove, S ...
);
             
assertEquals(...
    'Expected Flag After First Move', expectedFlagAfterFirstMove, flag ...
);

% Check the second sequence
[S, flag] = Expand(S, BLACK_TO_PLAY, flag);
assertEquals(...
    'Expected State After Second Move', expectedStateAfterSecondMove, S ...
);
             
assertEquals(...
    'Expected Flag After First Move', expectedFlagAfterSecondMove, flag ...
);

disp('Scenario 1: All Assertions Passed!');
end
