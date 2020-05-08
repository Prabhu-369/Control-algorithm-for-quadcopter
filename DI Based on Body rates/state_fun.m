function XX_dot = state_fun(t, XX)

X = XX(1:12,:);
U = XX(13:16,:);


X_dot = Quad_6dof(X,U);         

XX_dot = [ X_dot
           zeros(4,1) ];%zeros(4,1)
end