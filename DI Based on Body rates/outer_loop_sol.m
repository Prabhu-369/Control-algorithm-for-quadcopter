function Outer_loop_solution = outer_loop_sol(Pos_ddot, Xd)

parameters;

% From the translational error dynamics
x_ddot = Pos_ddot(1);
y_ddot = Pos_ddot(2);
z_ddot = Pos_ddot(3);
psi_d   = Xd(6,:);
     
T_d = m*sqrt(x_ddot^2+y_ddot^2+(z_ddot-g)^2); 
      
ux = -m*x_ddot/T_d; 
uy = -m*y_ddot/T_d; 

phi_d    = asin(ux*sin(psi_d)-uy*cos(psi_d));                    
theta_d  = asin((ux*cos(psi_d)+uy*sin(psi_d))/cos(phi_d));        

% Solution from outer loop

Outer_loop_solution = [ T_d 
                        phi_d 
                        theta_d ];
