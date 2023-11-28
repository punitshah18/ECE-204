%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Punit Shah and Dylan Nogueira %
%     Group 5 - Section 205     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% reallocate the return values so they can be called in initialization.m
function [temp, iter, error] = fixed(F, initial, sym)

% iteration count number
iterations = 0;

% setting our initial guess
oldtemp = initial;

% test error value, uncomment and comment accordingly
testerror = 0.0005;
% testerror = 0.00005;

% using a boolean instead of a error value because it wasn't working with
% an error value while loop :)
done = false;

while(done == false)
    
    % plug and chug formula for fixed point iteration
    tempnew = double(subs(F, sym, oldtemp));
    % calculate error values    
    Error = abs((tempnew - oldtemp)/tempnew);
    if (Error < testerror)
        % make the boolean return true, process terminates
        done = true;
    end
    
    % Update previous guess if not broken out of loop
    oldtemp = tempnew;
    % Update the iteration counter
    iterations = iterations + 1;
end

% reallocate the values to be used in initialization.m
temp = tempnew;
iter = iterations;
% multiply error by 100 because we are using decimal values
error = Error * 100;

end