function Derv_RotMat = RotMat_derv(ang_vel, Euler_angle)
% Derivative of rotational matrix 
% Euler angles
        phi       = Euler_angle(1);
        theta     = Euler_angle(2);
        psi       = Euler_angle(3);
% Euler dot computation from body rates
        eulerdot  = RotMat(phi, theta, psi, 7)*ang_vel;
        phi_dot   = eulerdot(1);
        theta_dot = eulerdot(2);
%       psi_dot   = eulerdot(3);

        Derv_RotMat =  [0      0                  -cos(theta)*theta_dot
                        0     -sin(phi)*phi_dot   -sin(phi)*sin(theta)*theta_dot + cos(phi)*cos(theta)*phi_dot
                        0     -cos(phi)*phi_dot   -sin(theta)*cos(phi)*theta_dot - sin(phi)*cos(theta)*phi_dot ];
end

