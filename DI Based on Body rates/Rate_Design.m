function Body_rate_desired = Rate_Design(X,Xd) 

Gain_module; 
 
% Vehicle, Vehicle 1, Vehicle 2 frames
phi   = X(4,:);     phi_d   = Xd(4,:); 
theta = X(5,:);     theta_d = Xd(5,:);
psi   = X(6,:);     psi_d   = Xd(6,:);

% Body frame 
p = X(10,:);         
q = X(11,:);         
r = X(12,:);  

Att_Error = [phi-phi_d
             theta-theta_d
             psi-psi_d];
         
Body_rate_desired = RotMat(phi, theta, psi, 6)*-[K_phi   0        0 
                                                 0      K_theta   0
                                                 0       0      K_psi ]*(Att_Error);


