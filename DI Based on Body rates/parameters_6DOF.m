% parameters_6DOF

% Parameter variation block
% variation in mass
    m_p = 0; % Provide in percentage
              % Critical parameter small variation reflects in changes
% variation in 0nertia
    I_p = 00; % Provide in percentage
             % 100 percentage variation in inertia is possible
% Variation in arm length
    l_p = 0; % Provide in percentage
             % Dont ve significant effect even with 300%

% parameteres
m      = .34;
Ixx    = 321862.60*10^-9;
Iyy    = 305825.42*10^-9;
Ixy    = 0;
Ixz    = 0;
Iyz    = 0;
Izz    = 576255.87*10^-9;
g      = 9.81;
l      = 0.088388;


% New parameters
m      = (m_p/100)*m + m;
Ixx    = (I_p/100)*Ixx + Ixx;
Iyy    = Ixx;
Izz    = (I_p/100)*Izz + Izz;
l      = (l_p/100)*l + l;

