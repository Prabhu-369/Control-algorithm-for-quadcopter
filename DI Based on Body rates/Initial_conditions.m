
% Initial declaration        
phid    = 0; 
thetad  = 0;
ud      = 0;
vd      = 0;
wd      = 0;
pd      = 0;
qd      = 0;
rd      = 0;

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
Xd(:,1)   = [Xdsd,Ydsd,Zdsd,phid,thetad,psid,ud,vd,wd,pd,qd,rd];
Xd(1,1:N) = Xdsd;
Xd(2,1:N) = Ydsd;
Xd(3,1:N) = Zdsd;        

% Initial pertrbation 
% State
pertubation = Initial_pertubation();
X(:,1)  = pertubation;
        
