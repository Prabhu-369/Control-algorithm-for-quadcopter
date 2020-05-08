function Pertubation = Initial_pertubation()

% Initial pertubation in states can be provided in this block
% State definition [x,y,z,phi,theta,psi,u,v,w,p,q,r]; Definition

% Pertubation in Position in meters
x = 1;       
y = 1;
z = 1;

% Pertubation in Euler angles in degree
phi = 50;
theta = 50;
psi = 10;

% Pertubation in Velocity in m/s
u = 0;
v = 0;
w = 0;

% Pertubation in Body rates rad/s
p = 0;
q = 0;
r = 0;

Pertubation  = [x,y,z,phi*pi/180,theta*pi/180,psi*pi/180,u,v,w,p,q,r]; 

end