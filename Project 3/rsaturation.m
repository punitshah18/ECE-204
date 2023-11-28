function r2 = rsaturation(yacc, ypred)
    meany = mean(yacc);
    ST = sum((yacc - meany).^2);
    SR = sum((yacc - ypred).^2);
    r2 = (ST-SR)/ST;
end

