function builder(number, xval, yval)

% POLYNOMIAL
if (number == 1)
    degree = input("Please input the degree of polynomial you would like ");
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % DEGREE 1
    if (degree == 1)
        % summing all x values
        sumx = double(sum(xval));
        % summing all y values
        sumy = double(sum(yval));
        % summing all x * y values
        xy = double(sum(xval.* yval));
        % summing all x squared values
        xsq = double(sum(xval.^2));

        % finding number of elements in 1 column
        n = size(xval, 1);
        
        % finding a1 value
        a1 = (n * xy - sumx * sumy) / (n * xsq - (sumx)^2);
        % finding a0 value
        a0 = sumy / n - a1 * (sumx / n);

        % finding St and Sr values
        St = sum((yval - sumy / n).^2);
        Sr = sum((yval - a0 - a1.* xval).^2);
        
        % calculating R^2
        r2 = (St-Sr)/St;

        % define symbolic function
        syms f(x)
        % allocate function to symbol using a1 and a0
        f(x) = a0 + a1 * x;
        % plot function
        fplot(f)
        hold on
        title("Polynomial Degree 1: y = " + a0 + "+" + a1 + "x" + '   ' + "R^2 = " + r2);
        xlabel("X values")
        ylabel("Y values")
        % scatter plot of raw data
        scatter(xval, yval);
        legend("Estimated Function", "Raw Data");
        hold off

        % desired values
        disp("R^2 = " + r2);
        disp("y = " + a0 + "+" + a1 + "x");
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % DEGREE 2
    elseif(degree == 2)
        
        % sum x values
        sumx = double(sum(xval));
        % sum x squared values
        xsq = double(sum(xval.^2));
        % sum x cubed values
        xcu = double(sum(xval.^3));
        % sum x^4 values
        xfo = double(sum(xval.^4));
        
        % sum y values
        sumy = double(sum(yval));
        % sum x*y values
        xy = double(sum(xval.*yval));
        % sum y*x^2 values
        x2y = double(sum(yval.*(xval.^2)));
        
        % finding number of elements in 1 column
        n = size(xval,1);
        
        % make coefficient matrix 
        matA = [n sumx xsq;
                sumx xsq, xcu;
                xsq xcu xfo];
        
        % make constant matrix
        matB = [sumy;
                xy;
                x2y];
            
        % use matrix division and solve
        sol = matA\matB;
        
        % transpose and obtain column vector
        solmat = (sol.');
        
        % attribute each variable to elements in solution matrix
        a0 = solmat(1);
        a1 = solmat(2);
        a2 = solmat(3);
       
        % find St and Sr
        St = sum((yval - sumy / n).^2);
        Sr = sum((yval - a0 - a1.* xval - a2.*xval.^2).^2);
        
        % find R^2 value
        r2 = (St-Sr)/St;
        
        % define symbolic function
        syms f(x)
        % allocate function to symbol
        f(x) = a0 + a1*x + a2*x^2;
        % plot function
        fplot(f)
        hold on
        title("Polynomial Degree 1: y = " + a0 + "+" + a1 + "x" + a2 + 'x^2' + '   ' + "R^2 = " + r2);
        xlabel("X values")
        ylabel("Y values")
        % scatter plot of raw data
        scatter(xval, yval);
        legend("Estimated Function", "Raw Data");
        
        hold off
        
        % desired values
        disp("R^2 = " + r2);
        disp("y = " + a0 + " + " + a1 + "x + " + a2 + 'x^2');
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    % DEGREE 3
    elseif(degree == 3)
       % sum x values
        sumx = double(sum(xval));
        % sum x squared values
        xsq = double(sum(xval.^2));
        % sum x cubed values
        xcu = double(sum(xval.^3));
        % sum x^4 values
        xfo = double(sum(xval.^4));
        % sum x^5 values
        xqu = double(sum(xval.^5));
        % sum x^6 values
        xsi = double(sum(xval.^6));
        
        % sum y values
        sumy = double(sum(yval));
        % sum x*y values
        xy = double(sum(xval.*yval));
        % sum y*x^2 values
        x2y = double(sum(yval.*(xval.^2)));
        % sum y*x^3 values
        x3y = double(sum(yval.*(xval.^3)));
        
        % finding number of elements in 1 column
        n = size(xval,1);
        
        % create coefficient matrix
        matA = [n sumx xsq xcu;
                sumx xsq xcu xfo;
                xsq xcu xfo xqu;
                xcu xfo xqu xsi];
        
        % create solution matrix
        matB = [sumy;
                xy;
                x2y;
                x3y];
        
        % solve using matrix division    
        sol = matA\matB;
        
        % transpose and obtain column vector
        solmat = (sol.');
        
        % attribute variables to elements in solution matrix
        a0 = solmat(1);
        a1 = solmat(2);
        a2 = solmat(3);
        a3 = solmat(4);
        
        % find St and Sr values
        St = sum((yval - sumy / n).^2);
        Sr = sum((yval - a0 - a1.* xval - a2.*xval.^2 - a3.*xval.^3).^2);
        r2 = (St-Sr)/St;
        
        % define symbolic function
        syms f(x)
        % attribute function to symbol
        f(x) = a0 + a1*x + a2*x^2 + a3*x^3;
        % plot function
        fplot(f)
        hold on
        title("Polynomial Degree 1: y = " + a0 + "+" + a1 + "x" + a2 + 'x^2' + a3 + "x^3" + '   ' + "R^2 = " + r2);
        xlabel("X values")
        ylabel("Y values")
        % scatter plot of raw data
        scatter(xval, yval);
        legend("Simulated Function", "Points");
        hold off
        
        % desired values
        disp("R^2 = " + r2);
        disp("y = " + a0 + " + " + a1 + "x + " + a2 + 'x^2 + ' + a3 + 'x^3');
        
    end
end

% SATURATION
if(number == 3)
    
    % sum 1/x values
    suminversex = double(sum(1./xval));
    % sum 1/y values
    suminversey = double(sum(1./yval));
    % sum x^2 values
    squareval = double(sum((1./xval).^2));
    % sum 1/x * 1/y values
    xsys = double(sum((1./xval).*(1./yval)));
    
    % find number of elemtns in 1 column
    n = size(xval,1);
    
    % find a1
    a1 = ((n * xsys) - (suminversex*suminversey))/(n * squareval - (suminversex^2));
    % find a0
    a0 = (suminversey / n) - a1*(suminversex / n);
    
    % rearrage coefficients
    A = 1/a0;
    B = A*a1;
    
    % find St and Sr
    % St = sum((yval - sumy/n).^2);
    % Sr = sum(((yval - A.*xval/(B+sumx/n))).^2);
    
    % temporary function
    tempfunc = A.*xval ./ (B+xval);
    % r2 value obtained from function
    r2 = rsaturation(yval, tempfunc);
    
    % define symbolic function
    syms f(x)
    % attribute function to symbol
    f(x) = (A*x)/(B+x);
    % plot function
    fplot(f)
    hold on
    title("Saturation, y = (" + A + "*" + "x)/" + B + "+ x" + '    ' + "R^2 = " + r2);
    % scatter plot of raw data
    scatter(xval,yval);
    legend('Simulated Function', 'Points');
    xlabel("X Values")
    ylabel("Y Values")
    hold off
    
    % desired values
    disp("R^2 = " + r2);
    disp("y = (" + A + " * " + "x)/(" + B + " + x)");
end
    
% EXPONENTIAL
if(number == 2)
    % sum x values 
    sumx = sum(xval);
    % sum y values
    sumy = sum(yval);

    % sum logy values
    logyval = sum(log(yval));
    % sum x*logy values
    xlogyval = sum(xval.* log(yval));
    % sum x^2 values
    squareval = sum(xval.^2);
    
    % find number of elements in 1 column
    n = size(xval,1);
    
    % find a1
    a1 = (n * xlogyval - logyval * sumx) / (n * squareval - sumx^2);
    % find a0
    a0 = logyval / n - a1 * (sumx / n);
    
    % find St and Sr
    St = sum((yval - sumy / n).^2);
    Sr = sum((yval - (exp(a0)) * exp((a1.* xval))).^2);
    % find R^2 value
    r2 = (St - Sr) / St;  
    
    % define symbolic function
    syms f(x)
    % attribute function to symbol
    f(x) = exp(a0) *exp(a1*x);
    % plot function
    fplot(f)
    hold on
    title("Exponential, y = " + exp(a0) + "*" + "e" + "\^" + a1 + "x   R^2 = " + r2);
    % scatter plot of raw data
    scatter(xval,yval);
    hold off
    legend('Simulated Function', 'Points');
    xlabel('X Values');
    ylabel("y = " + exp(a0) + "*" + "e" + "\^" + a1 + "x");
    disp("R^2 = " + r2);
    disp("Y = " + exp(a0) + " * " + "e" + "^" + a1 + "x");
    
end
    


    