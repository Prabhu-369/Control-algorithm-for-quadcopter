
% Initial declaration        
phid    = 0; 
thetad  = 0;
ud      = 0;
vd      = 0;
wd      = 0;
phi_dot_d      = 0;
theta_dot_d      = 0;
psi_dot_d      = 0;

% intial values
psid_dot   = 0;
thetad_dot = 0; 
phid_dot   = 0;
parameters;        

% Initial conditions 
X       = zeros(12,N);
Xd      = zeros(12,N);
xd_dot  = zeros(12,1);
       
% Desired_control_input = zeros(4,1);
Desired   = User_input();
Xdsd      = Desired(1); % Input by user
Ydsd      = Desired(2); % Input by user
Zdsd      = Desired(3); % Input by user
psid      = Desired(4);

% Desired state 
Xd(:,1)   = [Xdsd,Ydsd,Zdsd,phid,thetad,psid,ud,vd,wd,phi_dot_d,theta_dot_d,psi_dot_d];
Xd(1,1:N) = Xdsd;
Xd(2,1:N) = Ydsd;
Xd(3,1:N) = Zdsd;

% State
X(:,1)  = [1;1;1;50*pi/180;50*pi/180;10*pi/180;0;0;0;0;0;0]; % X = [x,y,z,phi,theta,psi,u,v,w,p,q,r]; Definition 
        
