function Desired = User_input()
% Desired value
% position 
        X_desired      = 0; % Input by user
        Y_desired      = 0; % Input by user
        Z_desired      = 0; %0; % Input by user
% heading 
        psi_desired    = deg2rad(0); % Input by user - Provide in radians or use deg2rad function when declared in degree
        Desired = [X_desired
                   Y_desired
                   Z_desired
                   psi_desired];
end