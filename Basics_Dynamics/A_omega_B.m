function [omegaFinal] = A_omega_B(rotationMatrix,rotationDirection,outputFramedesired)
%A_omega_B Constructs a frame2frame rotational velocity of frame B with respect
%to frame A
%
%   DEPENDENCIES : none
%
%   FORMAT : [omegaFinal] = A_omega_B(rotationMatrix,rotationDirection,outputFramedesired)
%
%   ARGUMENTS :
%       OUTPUT omegaFinal : The final column 3-vector containing the expression
%       for the rotational velocity of frame B w.r.t frame A. 
%
%       INPUT rotationMatrix : a rotation matrix representing either A[c]B
%       or B[c]A
%
%       INPUT rotationDirection : an argument used to determine whether
%       rotationMatrix is A[c]B or B[c]A. 
%           ACCEPTED VALUES: 'AB','ab','Ab','aB' to represent A[c]B
%                            'BA','ba','Ba','bA' to represent B[c]A
%       
%       INPUT outputFramedesired : an argument used to control the frame
%       (A or B) in which the final output is expressed.
%           ACCEPTED VALUES: 'A','a','B','b'

% validate that the number of arguments is correct
nargoutchk(1,1);
narginchk(3,3);

%setup accepted input argument classes, and any required values and
%attributes for each argument
inputClasses = {'sym','string','char'};
rotationDirection_acceptedVals = {'AB','Ab','aB','ab','BA','Ba','bA','ba'};
outputFramedesired_acceptedVals = {'A','B','a','b'};

%validate the rotationMatrix input argument (sym)
validateattributes(rotationMatrix,inputClasses(1),{'nonempty'});

%validate the rotationDirection input argument (string)
validateattributes(rotationDirection,inputClasses(2),{'nonempty'});
rotationDirection = validatestring(rotationDirection,rotationDirection_acceptedVals);

%validate the outputFramedesired input argument (char)
validateattributes(outputFramedesired,inputClasses(3),{'nonempty'});
outputFramedesired = validatestring(outputFramedesired,outputFramedesired_acceptedVals);

%find the direction of the rotationMatrix
BcA = sym(eye(3));
AcB = sym(eye(3));
if(strncmpi(rotationDirection,'A',1))
    AcB = rotationMatrix;
    BcA = transpose(AcB);
else
    BcA = rotationMatrix;
    AcB = transpose(BcA);
end

%determine the 1st derivative of the AcB rotation matrix
AcB_dot = simplify(diff(AcB));

%determine the x,y,z components of the A_omega_B 3-vector, expressed in the
%B frame
omega_x_B = [0 0 1]*BcA*AcB_dot*[0;1;0];
omega_y_B = [1 0 0]*BcA*AcB_dot*[0;0;1];
omega_z_B = [0 1 0]*BcA*AcB_dot*[1;0;0];

%determine output based on outputFramedesired
if(strcmpi(outputFramedesired,'B'))
    omegaFinal = [omega_x_B;omega_y_B;omega_z_B];
else
    omegaFinal = simplify(AcB*[omega_x_B;omega_y_B;omega_z_B]);
end
end

