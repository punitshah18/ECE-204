%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Punit Shah and Dylan Nogueira %
%     Group 5 - Section 205     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A, B and C values to be used
A = 3.9083e-3;
B = -5.775e-7;
C = -4.183e-12;

% Input resistance
R = input("Please input resistance value: ");

% Use syms so we can utilize T universally
syms T
% Used for bisection method
fx = 100 * (1 + A * T + B * T^2 + C * (T - 100) * T^3) - R;
gx = 100 * (1 + A * T + B * T^2) - R;

% Used for Newton - Raphson (used diff to find the derivative of the
% original equations)
diffx = diff(100 * (1 + A * T + B * T^2 +C * (T - 100) * T^3) - R);
diffgx = diff(100 * (1 + A * T + B * T^2) - R);

% Used for fixed point iteration
fnew = ((R/100)- 1 -B*T^2 + 100*C*T^3 - C*T^4)/A;
gnew = ((R/100)- 1 - B*T^2)/A;

% Choose which equations to use depending on resistance entered
if(R <= 100)
    left = -200;
    right = 0;
    % Call the bisection, onepoint and raphson method and their [return
    % values]
    [bitemp ,biiter ,bierror] = bisection(fx, left, right, T);
    [raptemp, rapiter, raperror] = raphson(fx, diffx, -100, T);
    [fixtemp, fixiter, fixerror] = fixed(fnew, -100, T);
    
else
    left = 0;
    right = 850;
    % call the bisection, onepoint and raphson method and their [return
    % values]
    [bitemp ,biiter ,bierror] = bisection(gx, left, right, T);
    [raptemp, rapiter, raperror] = raphson(gx, diffgx, 425, T);
    [fixtemp, fixiter, fixerror] = fixed(gnew, 300, T);
end

% display all the values
disp(["The temperature obtained by bisection is " num2str(bitemp) "C"]);
disp(["The temperature obtained by fixed point is " num2str(fixtemp) "C"]);
disp(["The temperature obtained by NR is " num2str(raptemp) "C"]);
disp(" ");
disp(["The number of required iterations for bisection is " num2str(biiter)]);
disp(["The number of required iterations for fixed point is " num2str(fixiter)]);
disp(["The number of required iterations for NR is " num2str(rapiter)]);
disp(" ");
disp(["The absolute relative approximate error % for bisection is " num2str(bierror) "%"]);
disp(["The absolute relative approximate error % fixed point is " num2str(fixerror) "%"]);
disp(["The absolute relative approximate error % NR is " num2str(raperror) "%"]);
