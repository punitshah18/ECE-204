%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Punit Shah and Dylan Nogueira %
%     Group 5 - Section 205     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% reallocate the return values so they can be called in initialization.m
function[temp, iter, error] = bisection(F, left, right, sym)

% find initial midpoint
mid = (left + right)/2;

% using a boolean instead of a error value because it wasn't working with
% an error value while loop :)
done = false; 

% iteration count number
iterations = 0; 

% test error value, uncomment and comment accordingly
testerror = 0.0005;
% testerror = 0.00005;

% Solve using bisection method
while done == false
% find the leftval by plugging left into the equation in initialization.m
leftval = double(subs(F, sym, left));
% find the midval by plugging left into the equation in initialization.m
midval = double(subs(F, sym, mid));

% Update midpoint so we can use the oldmiddle in the error calculation
oldmiddle = mid;

% MAKE CASE FOR IF IT GUESSES ROOT INSTANTLY?

% Check for root locations 
    if(leftval*midval > 0)
        % change the middle value to be between the old middle value and
        % the right value
        mid = (right + mid)/2;
        % change left value to be the old middle value
        left = oldmiddle;

    elseif(leftval*midval < 0)
        % change the middle value to be between the old middle value and
        % the left value
        mid = (left + mid)/2;
        % change the right value to be the old middle value;
        right = oldmiddle;
    end
    
    % calculate error values
    Error = abs((mid-oldmiddle)/mid);
    if(Error < testerror)
        % make the boolean return true, process terminates
        done = true; 
    end
    
% Update the iteration counter
iterations = iterations + 1; 
end

% reallocate the values to be used in initialization.m
temp = mid;
iter = iterations;
% multiply error by 100 because we are using decimal values
error = Error * 100;


end