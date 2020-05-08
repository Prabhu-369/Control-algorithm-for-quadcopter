function LMN = inner_loop_sol(Att_ddot, body_rates, Euler_angle)

parameters; 

% Euler angles
phi       = Euler_angle(1);
theta     = Euler_angle(2);
psi       = Euler_angle(3);    

% Euler dot computation from body rates
eulerdot  = RotMat(phi, theta, psi, 7)*body_rates;

% Body angular rate determination
body_rates_dot = RotMat(phi, theta, psi, 6)*Att_ddot + RotMat_derv(body_rates,Euler_angle)*eulerdot;  

p = body_rates(1);
q = body_rates(2);
r = body_rates(3);

% Moment matrix determination
LMN = [Ixx*body_rates_dot(1)+(Izz-Iyy)*q*r
       Iyy*body_rates_dot(2)+(Ixx-Izz)*p*r
       Izz*body_rates_dot(3)+(Iyy-Ixx)*p*q];