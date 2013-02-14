function TestScenario3
%TESTSCENARIO3 Tests Checkers Scenario 1 (see GetScenarios.m)
[flag, S, RED_TO_PLAY, BLACK_TO_PLAY] = SetUp('KNG_PROMO_NO_MVS_END_GAME');

expectedStateAfterFirstMove = [
    0     0     0     0     0     0     0     0
    0     0     0     0     0     0     0     0
    0     0     0     0     0     1     0     0
    0     0     0     0     0     0     1     0
    0     0     0     0     0     0     0     2
    0     0     0     0     0     0     0     0
    0     0     0     0     0     0     0     0
    0     0     3     0     0     0     0     0
];

expectedFlagAfterFirstMove = 0;

expectedStateAfterSecondMove = [
    0     0     0     0     0     0     0     0
    0     0     0     0     0     0     0     0
    0     0     0     0     0     1     0     0
    0     0     0     0     0     0     1     0
    0     0     0     0     0     0     0     2
    0     0     0     0     0     0     0     0
    0     0     0     0     0     0     0     0
    0     0     3     0     0     0     0     0
];

expectedFlagAfterSecondMove = 1;

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

disp('Scenario 3: All Assertions Passed!');
end


