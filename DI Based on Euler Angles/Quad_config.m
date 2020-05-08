function BLDC_constant = Quad_config(km,l,b)
% This module determines the constant matrix for + configuration
% Matrix sequence - Thrust Roll Pitch Yaw

BLDC_constant = [ km     km     km     km 
                  km*l   0     -km*l   0
                  0      km*l   0    -km*l
                  b    -b     b    -b   ];