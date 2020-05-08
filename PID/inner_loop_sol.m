function LMN = inner_loop_sol(Att_ddot)
       
parameters; 

% Moment matrix determination
LMN = [Ixx*Att_ddot(1)
       Iyy*Att_ddot(2)
       Izz*Att_ddot(3)];