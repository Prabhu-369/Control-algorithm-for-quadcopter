function Pos_ddot_inertial = Translational_error_dynamics (X, Xd)
% X = [x,y,z,phi,theta,psi,u,v,w,p,q,r]; State Definition 
  Gain_module;
  global Track_d
  % Inertial frame
    x = X(1,:);         xd = Track_d(1,1);%Xd(1,:);
    y = X(2,:);         yd = Track_d(2,1);%Xd(2,:);
    z = X(3,:);         zd = Track_d(3,1);%Xd(3,:);
   % Desired acceleration and velocity are assumed to be zero
   xd_ddot = Track_d(7,1);  xd_dot = Track_d(4,1); %
   yd_ddot = Track_d(8,1);  yd_dot = Track_d(5,1); % 
   zd_ddot = Track_d(9,1);  zd_dot = Track_d(6,1); % 
% Body frame 
    u = X(7,:);
    v = X(8,:);
    w = X(9,:);
% Vehicle, Vehicle 1, Vehicle 2 frames
    phi   = X(4,:);
    theta = X(5,:);
    psi   = X(6,:);
% Current velocity and position
   Pos_dot_outer =  RotMat(phi, theta, psi, 5)*[u; v; w];
   x_dot = Pos_dot_outer (1);
   y_dot = Pos_dot_outer (2);
   z_dot = Pos_dot_outer (3);
   
    Pos_ddot_inertial = [ xd_ddot + 2*zitaxt*wnxt*(xd_dot-x_dot) + wnxt^2*(xd-x)
                          yd_ddot + 2*zitayt*wnyt*(yd_dot-y_dot) + wnyt^2*(yd-y)
                          zd_ddot + 2*zitazt*wnzt*(zd_dot-z_dot) + wnzt^2*(zd-z) ];        
    

