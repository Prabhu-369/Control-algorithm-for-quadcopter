function X_dot = Quad_6dof(X, U)

parameters_6DOF;

% state 
% Inertial frame
x = X(1,:);
y = X(2,:);
z = X(3,:);
% Vehicle, Vehicle 1, Vehicle 2 frames
phi   = X(4,:);
theta = X(5,:);
psi   = X(6,:);
% Body frame 
u = X(7,:);
v = X(8,:);
w = X(9,:);
% Body frame
p = X(10,:);
q = X(11,:);
r = X(12,:);

% Control input 
% omega_square  = Pwm2rad(U);
% BLDC_constant = Quad_config(km,l,b);
% Quad_force    = BLDC_constant * omega_square;

Quad_force  = U; 
T = Quad_force(1);
L = Quad_force(2);
M = Quad_force(3);
N = Quad_force(4);

% Six degree of the freedom model 
% Kinematics 

% Translation 
Pos_dot = RotMat(phi, theta, psi, 5)*[u; v; w]; % Inertial frame

% Rotational 

Eul_dot = RotMat(phi, theta, psi, 7)*[p; q; r]; % Diff Vehicle frames

% Translation 

Vel_dot   =[r*v-q*w;
            p*w-r*u;
            q*u-p*v]+[0; 0; -T/m] + RotMat(phi, theta, psi, 4)*[0; 0; g];  % Body frame

% Rotation Dynamics

Att_dot = [ L/(Ixx) + ((Iyy - Izz)/(Ixx))*q*r;
            M/(Iyy) + ((Izz - Ixx)/(Iyy))*p*r;
            N/(Izz) + ((Ixx - Iyy)/(Izz))*p*r; ]; % Body frame
             
X_dot = [ Pos_dot
          Eul_dot
          Vel_dot
          Att_dot];