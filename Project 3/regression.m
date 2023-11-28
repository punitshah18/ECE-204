% prompts user inpt for desired function representation
regressionmodel = input("Select the function to fit your data: \n 1.Polynomial: y = a0 + a1x + .. +amx^m \n 2.Exponential: y = ae^bx \n 3.Saturation: y = ax/b+x \n");

% loads text file, comment and uncomment as necessary
% A = load('test1.txt');
A = load('test2.txt');

% x values are clubbed together
xval = A(:,1);
% y values are clubbed together
yval = A(:,2);

% If 1 is entered, display Polynomial function
if regressionmodel == 1 
    builder(1, xval, yval);
% If 2 is entered, display Exponential function
elseif regressionmodel == 2 
    builder(2, xval, yval);
    
% If 3 is entered, display Saturation function    
elseif regressionmodel == 3 
    builder(3, xval, yval);
    
else
    disp("Please enter a number between 1 and 3");
    
end
