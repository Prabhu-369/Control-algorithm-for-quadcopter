function tracking = Tracking(Xd_traj,t)

global dt

Vel_Quad = 1;
w = 3*(pi/10);

xd_ddot = -w*(Vel_Quad * sin(w*t));
yd_ddot = w*(Vel_Quad * cos(w*t));
zd_ddot = w*(Vel_Quad * cos(w*t));

xd_dot = Vel_Quad*cos(w*t);
yd_dot = Vel_Quad*sin(w*t);
zd_dot = Vel_Quad*sin(w*t);

xd = Xd_traj(1,1)+xd_dot*dt;
yd = Xd_traj(2,1)+yd_dot*dt;
zd = Xd_traj(3,1)+zd_dot*dt;

tracking = [xd
            yd
            zd
            xd_dot
            yd_dot
            zd_dot
            xd_ddot
            yd_ddot
            zd_ddot];
        
       
end