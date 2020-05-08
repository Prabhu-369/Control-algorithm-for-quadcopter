function [U, Xd] = control(X, Xd)
% Control calculation using dynamic inversion approach
% X = [x,y,z,phi,theta,psi,u,v,w,p,q,r]; State Definition

psi_d   = Xd(6,:);
       
% Body frame
p = X(10,:);        
q = X(11,:);        
r = X(12,:);        

% Outer loop design - Translation Dynamics 
Pos_ddot = Translational_error_dynamics (X, Xd);
 
Outer_loop_solution = outer_loop_sol(Pos_ddot, Xd);
Thrust_d            = Outer_loop_solution (1);
phi_d               = Outer_loop_solution (2);
theta_d             = Outer_loop_solution (3);
Att_d               = [phi_d; theta_d; psi_d];

% Limiter block : Angles
Att_d(Att_d >  (deg2rad(75))) =  deg2rad(75);
Att_d(Att_d < -(deg2rad(75))) = -deg2rad(75);

% Desired values of moments are computed from the inner loop block to drive the motors
Xd(4:6)  = Att_d;

body_rates_d = Rate_Design(X, Xd);
      

% Vector sequence Thrust derired, phi desired and theta desired
body_rates     = [ p;
                   q; 
                   r];

% Required moments are calculated in inner loop 
LMN_d = Rate_inner_loop_sol(body_rates_d, body_rates); 

% Limiter block : Moments and thrust 
LMN_d(LMN_d >  .102*4) =  .102*4;
LMN_d(LMN_d < -.102*4) = -.102*4;
Thrust_d(Thrust_d > 8.3385) = 8.3385;
Thrust_d(Thrust_d < 0)  =  0;

% Rolling Pitching and yawing moments
L_d = LMN_d(1);
M_d = LMN_d(2);
N_d = LMN_d(3);

% Force acting on quadrotor
Quad_req = [ Thrust_d ;
             L_d      ;
             M_d      ;
             N_d     ];
         
U        = Quad_req;

