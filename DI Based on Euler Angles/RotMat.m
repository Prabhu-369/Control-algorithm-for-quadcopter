%#codegen

function rm = RotMat(phi, theta, psi, int)
 rm = zeros(3,3);
% Module for transforming the p vector from one frame to another frame
% Possible transformations
        % 1 - Transformation from the inertial frame (i - North, j - East, k - Towards earth center) to vehicle frame 1
        % 2 - Transformation from the vehicle frame 1 to vehicle frame 2
        % 3 - Transformation from the vehicle frame 2 to body frame
        % 4 - Transformation from the vehicle frame (inertial frame) to body frame
        % 5 - Transformation from the body frame to vehicle frame (inertial frame)
        % 6 - Transformation from the derivative of (phi theta psi) to body rates (p q r)
        % 7 - Transformation from the body rates (p q r) to derivative of (phi theta psi)

switch int
    
    case 1                                                                 % Transformation from vehicle frame (i - North, j - East, k - Towards earth center) to vehicle frame 1
        
        rm = [ cos(psi)     sin(psi)       0  ;
              -sin(psi)     cos(psi)       0  ; 
                 0             0           1 ];
                 
    case 2                                                                 % Transformation from vehicle frame 1 to vehicle frame 2
        
        rm = [ cos(theta)    0       -sin(theta)  ;
                   0          1            0       ;
                sin(theta)    0        cos(theta) ];
                
    case 3                                                                 % Transformation from vehicle frame 2 to body frame
        rm = [ 1              0             0      ;
               0            cos(phi)     sin(phi)  ;
               0           -sin(phi)     cos(phi) ];
                
    case 4                                                                 % Transformation from vehicle frame to body frame
        rm = [                  cos(psi)*cos(theta)                                 cos(theta)*sin(psi)                    -sin(theta);
               cos(psi)*sin(phi)*sin(theta) - cos(phi)*sin(psi)    cos(phi)*cos(psi) + sin(phi)*sin(psi)*sin(theta)    cos(theta)*sin(phi);
               sin(phi)*sin(psi) + cos(phi)*cos(psi)*sin(theta)    cos(phi)*sin(psi)*sin(theta) - cos(psi)*sin(phi)    cos(phi)*cos(theta)]; 
               
    case 5                                                                 % Transformation from body frame to vehicle frame
        % inverse of rm4
        rm = [ (cos(psi)*cos(theta))/(cos(psi)^2*cos(theta)^2 + cos(psi)^2*sin(theta)^2 + cos(theta)^2*sin(psi)^2 + sin(psi)^2*sin(theta)^2)       -(cos(phi)*cos(theta)^2*sin(psi) + cos(phi)*sin(psi)*sin(theta)^2 - cos(psi)*sin(phi)*sin(theta))/(cos(phi)^2*cos(psi)^2*cos(theta)^2 + cos(phi)^2*cos(psi)^2*sin(theta)^2 + cos(phi)^2*cos(theta)^2*sin(psi)^2 + cos(phi)^2*sin(psi)^2*sin(theta)^2 + cos(psi)^2*cos(theta)^2*sin(phi)^2 + cos(psi)^2*sin(phi)^2*sin(theta)^2 + cos(theta)^2*sin(phi)^2*sin(psi)^2 + sin(phi)^2*sin(psi)^2*sin(theta)^2)     (sin(phi)*sin(psi)*cos(theta)^2 + sin(phi)*sin(psi)*sin(theta)^2 + cos(phi)*cos(psi)*sin(theta))/(cos(phi)^2*cos(psi)^2*cos(theta)^2 + cos(phi)^2*cos(psi)^2*sin(theta)^2 + cos(phi)^2*cos(theta)^2*sin(psi)^2 + cos(phi)^2*sin(psi)^2*sin(theta)^2 + cos(psi)^2*cos(theta)^2*sin(phi)^2 + cos(psi)^2*sin(phi)^2*sin(theta)^2 + cos(theta)^2*sin(phi)^2*sin(psi)^2 + sin(phi)^2*sin(psi)^2*sin(theta)^2)  ;
               (cos(theta)*sin(psi))/(cos(psi)^2*cos(theta)^2 + cos(psi)^2*sin(theta)^2 + cos(theta)^2*sin(psi)^2 + sin(psi)^2*sin(theta)^2)        (cos(phi)*cos(psi)*cos(theta)^2 + cos(phi)*cos(psi)*sin(theta)^2 + sin(phi)*sin(psi)*sin(theta))/(cos(phi)^2*cos(psi)^2*cos(theta)^2 + cos(phi)^2*cos(psi)^2*sin(theta)^2 + cos(phi)^2*cos(theta)^2*sin(psi)^2 + cos(phi)^2*sin(psi)^2*sin(theta)^2 + cos(psi)^2*cos(theta)^2*sin(phi)^2 + cos(psi)^2*sin(phi)^2*sin(theta)^2 + cos(theta)^2*sin(phi)^2*sin(psi)^2 + sin(phi)^2*sin(psi)^2*sin(theta)^2)    -(cos(psi)*cos(theta)^2*sin(phi) + cos(psi)*sin(phi)*sin(theta)^2 - cos(phi)*sin(psi)*sin(theta))/(cos(phi)^2*cos(psi)^2*cos(theta)^2 + cos(phi)^2*cos(psi)^2*sin(theta)^2 + cos(phi)^2*cos(theta)^2*sin(psi)^2 + cos(phi)^2*sin(psi)^2*sin(theta)^2 + cos(psi)^2*cos(theta)^2*sin(phi)^2 + cos(psi)^2*sin(phi)^2*sin(theta)^2 + cos(theta)^2*sin(phi)^2*sin(psi)^2 + sin(phi)^2*sin(psi)^2*sin(theta)^2)  ;
                                                                                                   -sin(theta)/(cos(theta)^2 + sin(theta)^2)                                                                                                                                                                                                                                                                             (cos(theta)*sin(phi))/(cos(phi)^2*cos(theta)^2 + cos(phi)^2*sin(theta)^2 + cos(theta)^2*sin(phi)^2 + sin(phi)^2*sin(theta)^2)                                                                                                                                                                                                                                                                             (cos(phi)*cos(theta))/(cos(phi)^2*cos(theta)^2 + cos(phi)^2*sin(theta)^2 + cos(theta)^2*sin(phi)^2 + sin(phi)^2*sin(theta)^2)          ];    
              
    case 6                                                                 % Transformation from derivative of (phi theta psi) to body rates (p q r)
        rm = [ 1        0              -sin(theta)      ;
               0      cos(phi)     sin(phi)*cos(theta)  ;
               0     -sin(phi)     cos(phi)*cos(theta) ];
                 
    case 7                                                                 % Transformation from body rates (p q r) to derivative of (phi theta psi) 
        rm = [ 1                        (sin(phi)*sin(theta))/(cos(theta)*cos(phi)^2 + cos(theta)*sin(phi)^2)    (cos(phi)*sin(theta))/(cos(theta)*cos(phi)^2 + cos(theta)*sin(phi)^2) ;
               0                         cos(phi)/(cos(phi)^2 + sin(phi)^2)                                      -sin(phi)/(cos(phi)^2 + sin(phi)^2)                                   ;
               0                         sin(phi)/(cos(theta)*cos(phi)^2 + cos(theta)*sin(phi)^2)                 cos(phi)/(cos(theta)*cos(phi)^2 + cos(theta)*sin(phi)^2)            ];
       
end

end

