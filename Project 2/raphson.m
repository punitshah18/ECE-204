%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Punit Shah and Dylan Nogueira %
%     Group 5 - Section 205     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% reallocate the return values so they can be called in initialization.m
function [temp, iter, error] = raphson(F, diffF, initial,sym)

% setting our initial guess
initialroot = initial; 

% using a boolean instead of a error value because it wasn't working with
% an error value while loop :)
done = false; 
% iteration count number
iterations = 0;

% test error value, uncomment and comment accordingly
testerror = 0.0005;
% testerror = 0.00005;

while done == false
    % plug and chug formula for newton - raphson method
    secondaryroot = initialroot - double(subs(F, sym, initialroot) / subs(diffF, sym, initialroot));
    
    % calculate error values
     Error = abs((secondaryroot - initialroot) / secondaryroot);
        if(Error < testerror)
            % make the boolean return true, process terminates
            done = true; 
        end
        
    % Update previous guess if not broken out of loop
    initialroot = secondaryroot;
    % Update the iteration counter
    iterations = iterations + 1; 
end

% reallocate the values to be used in initialization.m
temp = secondaryroot;
iter = iterations;
% multiply error by 100 because we are using decimal values
error = Error * 100;


end