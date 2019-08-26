function [Adt_q_B] = TransportTheorum_1(vector_q_B, A_omega_B_B)
%TransportTheorum_1 performs a single time derivative in the A frame on the
%vector q, which is defined in the B frame
%   
%   FORMAT : [Adt_q_B] = TransportTheorum_1(vector_q_B, A_omega_B_B)
%
%   ARGUMENTS :
%       OUTPUT Adt_q_B : The symbolic column 3-vector representing the
%       A frame time derivative of original 3-vector q.
%
%       INPUT vector_q_B : The symbolic column 3-vector q (defined in the B
%       frame) to be differentiated
%
%       INPUT A_omega_B_B : The symbolic column 3-vector representing the
%       angular velocity of frame B with respect to frame A, expressed in
%       the B frame

%validate that the number of arguments is correct
nargoutchk(1,1);
narginchk(2,2);

%setup accepted input argument classes, and any required values and
%attributes for each argument
inputClass = {'sym'};
inputAttributes = {'column'};

%validate each argument for proper type and attributes
validateattributes(vector_q_B,inputClass,inputAttributes);
validateattributes(A_omega_B_B,inputClass,inputAttributes);

fprintf('Transporting The Theorums all over the place...\n')

% Actually perform the 1st Transport Theorum
Adt_q_B = simplify(diff(vector_q_B) + cross(A_omega_B_B,vector_q_B));

fprintf('Theorums have been transported!\n')

end