% code for stabilizing a quadrotor
% using dynamics inversion approach
        % Quad parameters and configuration functions
        % Note "+" configuration is choosen in this simulation to change it, just
        % modify the block corresponding to quad config
        % Desired vaules by the User is defined in User_input file and called in Initial_conditions section 
clear all;
close all;
clc;

global dt Track_d

% time information 
t0 = 0;
tf = 9; % seconds
dt = 0.01;% time step
N = floor((tf-t0)/dt) + 1;
t(1,:) = 0;
U = zeros(4,N-1);

Initial_conditions;

for k = 1:N-1

    % Desired trajectory information generation
     Track_d = Tracking(Xd(:,k),t(:,k));
      Xd(1:3,k) = Track_d(1:3,1);
      
    % Desired Control generation using DI   
    [U(:,k), Xd(:,k+1)]  = control (X(:,k) , Xd(:,k));
    
    TSP_data_state = [X(1:3,k)
                      X(7:9,k)];
                  
    % Desired_control_input = U(1:4,k);
    X(:,k+1) = state(X(:,k), U(:,k));
    
 
    t(:,k+1) = t(:,k) + dt;   
       
end
% Plotting 
simulation_debug_plots;
Plots_SI_units;
 save('MDI_workspace');