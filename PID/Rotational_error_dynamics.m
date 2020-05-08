function Att_ddot = Rotational_error_dynamics(X,Xd) 

% Rotational Dynamics
 Gain_module; 

 % Vehicle, Vehicle 1, Vehicle 2 frames
phi   = X(4,:);     phi_d   = Xd(4,:);   phid_dot   = 0;      phid_ddot = 0;
theta = X(5,:);     theta_d = Xd(5,:);   thetad_dot = 0;      thetad_ddot =0;
psi   = X(6,:);     psi_d   = Xd(6,:);   psid_dot   = 0;      psid_ddot = 0;

% Euler angle dot
 Euler_angle_dot = [X(10,:); X(11,:);X(12,:)];
 phi_dot   = Euler_angle_dot(1);
 theta_dot = Euler_angle_dot(2);
 psi_dot   = Euler_angle_dot(3);

Att_ddot   = [ phid_ddot   + 2*zitarxt*wnrxt*(phid_dot-phi_dot)     + wnrxt^2*(phi_d-phi)
               thetad_ddot + 2*zitaryt*wnryt*(thetad_dot-theta_dot) + wnryt^2*(theta_d-theta)
               psid_ddot   + 2*zitarzt*wnrzt*(psid_dot-psi_dot)     + wnrzt^2*(psi_d-psi)];            
