function Outer_loop_solution = outer_loop_sol(Pos_ddot)

parameters;
           
x_ddot = Pos_ddot(1);
y_ddot = Pos_ddot(2);
z_ddot = Pos_ddot(3);
    
T_d = (g-z_ddot)*m; 
phi_d    = y_ddot/g;
theta_d  = -x_ddot/g;

% Solution from outer loop

Outer_loop_solution = [ T_d 
                        phi_d 
                        theta_d ];

end 