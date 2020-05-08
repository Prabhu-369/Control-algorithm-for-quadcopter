function coriolis = Omega( ang_vel )
% Determines the coriolis matrix
coriolis = [ 0           -ang_vel(3)   ang_vel(2) ;
             ang_vel(3)   0           -ang_vel(1) ;
            -ang_vel(2)   ang_vel(3)   0         ];
end

