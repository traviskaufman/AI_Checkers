function fail(msg, stack)
% Raise a failure with the given message and context
%
% Timothy Wall
% Oculus Technologies Corporation
% Copyright (c) 2005 Timothy Wall
%------------------------------------------------------------------------

if nargin == 1
    stack = printstack;
end
msg=sprintf('%s\n%s', msg, stack);
lastwarn(msg);
error(sprintf('FAIL: %s', msg));
