function [t, X] = rk4_m(fun, t0, tf, dt, X0)

N = ceil((tf - t0)/dt)+1;
X(:,1) = X0;
t(:,1) = t0;

for k = 1:N-1
    
    K1 = feval(fun, t(:,k), X(:,k));
    K2 = feval(fun, t(:,k) + dt/2, X(:,k) + (dt/2)*K1);
    K3 = feval(fun, t(:,k) + dt/2, X(:,k) + (dt/2)*K2);
    K4 = feval(fun, t(:,k) + dt, X(:,k) + dt*K3);
   
    X(:,k+1) = X(:,k) + dt*(K1/6 + K2/3 + K3/3 + K4/6);
    t(:,k+1) = t(:,k) + dt;
end            