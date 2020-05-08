function LMN = Rate_inner_loop_sol(body_rates_d, body_rates)

parameters; 
Gain_module;
p = body_rates(1);
q = body_rates(2);
r = body_rates(3);


Body_rate_dot = -[K_p   0    0 
                  0    K_q   0
                  0    0    K_r ]*(body_rates-body_rates_d);

% Moment matrix determination
LMN = [Ixx*Body_rate_dot(1)+(Izz-Iyy)*q*r
       Iyy*Body_rate_dot(2)+(Ixx-Izz)*p*r
       Izz*Body_rate_dot(3)+(Iyy-Ixx)*p*q];

end

