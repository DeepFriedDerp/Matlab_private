function [A_alpha_C] = AddAlpha(A_alpha_B,B_alpha_C,A_omega_B_A,B_omega_C_B)
%AddAlpha Adds two angular accelerations between frames and returns the
%result
%
%   Because angular accelerations between two frames cannot simply be added
%   together, this function attempts to simplify the process
%   
%   FORMAT : [A_alpha_C] = AddAlpha(A_alpha_B,B_alpha_C,A_omega_B,B_omega_C)
%
%   ARGUMENTS :
%       OUTPUT A_alpha_C : The added angular acceleration of C with respect
%       to A
%
%       INPUT A_alpha_B : The symbolic column 3-vector  representing the
%       angular acceleration of frame B with respect to frame A
%
%       INPUT B_alpha_C : The symbolic column 3-vector  representing the
%       angular acceleration of frame C with respect to frame B
%
%       INPUT A_omega_B_A : The symbolic column 3-vector representing the
%       angular velocity of frame B with respect to frame A, expressed in
%       the A frame
%
%       INPUT B_omega_C_B : The symbolic column 3-vector representing the
%       angular velocity of frame B with respect to frame A, expressed in
%       the B frame

%validate that the number of arguments is correct
nargoutchk(1,1);
narginchk(4,4);

%setup accepted input argument classes, and any required values and
%attributes for each argument
inputClass = {'sym'};
inputAttributes = {'column'};

%validate each argument for proper type and attributes
validateattributes(A_alpha_B,inputClass,inputAttributes);
validateattributes(B_alpha_C,inputClass,inputAttributes);
validateattributes(A_omega_B_A,inputClass,inputAttributes);
validateattributes(B_omega_C_B,inputClass,inputAttributes);

fprintf('Adding alphas\n')

A_alpha_C = simplify(A_alpha_B + B_alpha_C + cross(A_omega_B_A,B_omega_C_B));

fprintf('Alphas have been added!\n')
end