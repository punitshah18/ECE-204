%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 204 Simulation Assignment 1%
% Punit Shah and Dylan Nogueira  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = load('A.txt');
B = load('B.txt');

% disp(AB);

% disp(AB);

% create a new matrix with the vector
AB = [A,B];
% finding the row size and column size to use in the for loops
[rsize, csize] = size(A);

%forward elimination section
iterationnum = 0;
for i = 1:csize
    
    % set the current maxval to the diaganol values within AB
    maxval = AB(i,i);
    % absolute value the current maximum value
    maxval = abs(maxval);
    row = i;
    col = i;
    
    % iterate through the rest of the matrix to find if there is a new max
    % value
    for p = i:rsize
        for d = i:i
            if abs(AB(p,d)) > maxval
                maxval = abs(AB(p,d));
                
                % if there is a new maxval, set the row and col values to
                % p and d respectively, else leave them as i and i
                row = p;
                col = d;
            end
        end
    end
    
    % disp(row);
    
    % if i is not the "row" value, swap the rows
    if i ~= row
        AB([i,row],:) = AB([row,i],:);
        % disp(AB);
    end
    
    % set the new value of AB(i,:) to a new value divided by AB(i,i)
    AB(i,:) = AB(i,:)/AB(i,i);
    
    % disp(AB);
    
    % 
    for j = i+1:rsize
       % stores the value of AB(j,i) into the variable del, that will be
       % used as the factor to delete the other value in the matrix
       del = AB(j,i); 
       % deletes the values within the matrix, and updates the values
       % within the row using the del factor
       AB(j,:) = (AB(j,:) - del* AB(i,:));
       % round the value to 5 decimal places
       AB(j,:) = round(AB(j,:),5);
       iterationnum = iterationnum + 1;
       % display(iterationnum);
       % disp(AB);
    end
end

disp("iteration number = ");
disp(iterationnum);
disp('final');
disp(AB);

% back substitution section

% creates a new matrix of all zeros that we can write to as a clean state
empty = zeros(csize,1);

% start the for loop from csize up to 1
for i = csize:-1:1
    % set empty(i) as the last element in the row, or the element in the
    % vector with the same row number thereby storing a known value
    empty(i) = AB(i, end);
    
    for j = i+1:csize
        % subtract the coefficient of the values in AB(i,j) multiplied by
        % empty(j) from the current known values stored in empty(i),
        % thereby performing back substitution
        empty(i) = empty(i) - AB(i,j) * empty(j);
        % round the values in empty to 5 decimal places
        empty(i) = round(empty(i),5);
    end
end

% display the solved values
disp(empty)