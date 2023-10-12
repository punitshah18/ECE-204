%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 204 Simulation Assignment 1%
% Punit Shah and Dylan Nogueira  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


A = load('A.txt');
B = load('B.txt');

% finding the row size and column size to use in the for loops
[rsize,csize] = size(A);
% disp(rsize);

% setting the hard-stop maximum error obtained when performing gauss
% seidel, select the desired maximum error value.
% maxerror = 0.01;
% maxerror = 0.001;
maxerror = 0.0001;

% setting a counter for the number of iterations performed
iterationnum = 0;

% initializing a current error counter that is greater than the max error
% so the while loop will run. it will be updated within the while loop
errorcurr = 1;

% creates a new matrix of all zeros that we can write to as a clean slate
new = zeros(1,rsize);

% creats a new matrix with the vector
AB = [A,B];

% diaganolize the matrix by finding what the element in the diaganol is,
% and divide each value in the row by that value. thus creating a diaganol
% of 1s
for i = 1:csize
    temp = (A(i,i));
    % create another for loop to run through all the elements in AB, while
    % taking the values from A
    for j = 1:rsize+1
        AB(i,j) = (AB(i,j)) / temp;
    end
end

% check to see if diaganolization worked
disp(AB);

% while loop to keep the program running until the current error is less
% than the max error
while (errorcurr > maxerror)
    % set the new value into old
    old = new;
    
    
    for i = 1:rsize
        % create a new variable we can write to as a clean slate
        sumval = 0;
        
        % calculate the sum of terms before the current value
        for j = 1:i-1
            sumval = sumval + A(i,j) * new(j);
        end
        
        % calculate the sum of terms after the current value
        for j = i+1:rsize
            sumval = sumval + A(i,j) * old(j);
        end
        
        % update the vector "new" with the new values and chop the values
        % to 5 significant digits.
        new(i) = round((1/A(i,i))*(B(i)-sumval),5);
    end
    
    % increase the iteration number for each run through the while loop
    iterationnum = iterationnum + 1;
    
    % set the new current error value to check if while loop condition is
    % still valid
    errorcurr = abs((new-old)/new);
end

% display the iteration number
disp("iteration number = ");
disp(iterationnum);

% display the finalized matrix
disp(new);
