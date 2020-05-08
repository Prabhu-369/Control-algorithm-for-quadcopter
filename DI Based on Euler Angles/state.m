function Xn = state(X, U)

global dt

XX = [X
      U ];

[t, XXn] = rk4_m('state_fun', 0, dt, dt, XX);



Xn = XXn(1:12,2);


