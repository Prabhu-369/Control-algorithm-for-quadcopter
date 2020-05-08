function [U, Xd] = control(X, Xd)

% control calculation using dynamic inversion approach
% X = [x,y,z,phi,theta,psi,u,v,w,p,q,r]; State Definition

phi   = X(4,:);     
theta = X(5,:);    
psi   = X(6,:);    
psi_d   = Xd(6,:);
        
% Body frame
phi_dot = X(10,:);        
theta_dot = X(11,:);        
psi_dot = X(12,:);        

% Outer loop design - Translation Dynamics 
 Pos_ddot = Translational_error_dynamics (X, Xd);

Outer_loop_solution = outer_loop_sol(Pos_ddot);
Thrust_d = Outer_loop_solution (1);
phi_d    = Outer_loop_solution (2);
theta_d  = Outer_loop_solution (3);
Att_d  = [phi_d; theta_d; psi_d];

% Limiter block : Angles
Att_d(Att_d >  (deg2rad(75))) =  deg2rad(75);
Att_d(Att_d < -(deg2rad(75))) = -deg2rad(75);

 
% Desired values of moments are computed from the inner loop block to drive the motors
Xd(4:6)  = Att_d;
 
Att_ddot = Rotational_error_dynamics(X, Xd);


% Required moments are calculated in inner loop 
LMN_d = inner_loop_sol(Att_ddot); 

% Limiter block : Moments and thrust 
LMN_d(LMN_d >  .102*4) =  .102*4;
LMN_d(LMN_d < -.102*4) = -.102*4;
Thrust_d(Thrust_d > 8.3385) = 8.3385;
Thrust_d(Thrust_d < 0)  =  0;

% Force acting on quadrotor
Quad_req = [ Thrust_d ;
             LMN_d ];
U = Quad_req;
