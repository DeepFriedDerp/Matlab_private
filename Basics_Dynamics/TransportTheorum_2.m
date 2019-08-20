function [Addt_q_B] = TransportTheorum_2(vector_q_B,A_omega_B_B)
%TransportTheorum_1 performs a double time derivative in the A frame on the
%vector q, which is defined in the B frame
%   
%   FORMAT : [Addt_q_B] = TransportTheorum_1(vector_q_B, A_omega_B_B)
%
%   ARGUMENTS :
%       OUTPUT Addt_q_B : The symbolic column 3-vector representing the
%       A frame double time derivative of original 3-vector q.
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

fprintf('Transporting The Theorums of The Second Kind...\n')

%determine A_alpha_B
A_alpha_B = diff(A_omega_B_B);

%differentiate vector q one and two times, will plug into transport theorum
%later
Q_firstDiff = diff(vector_q_B);
Q_secondDiff = diff(vector_q_B);

%perform the cross-product of A_omega_B_B and vector q, the
%cross-product of A_omega_B_B and Q_firstDiff, and the cross product of 
%A_alpha_B and vector q. Will plug into transport theorum later
omegaCrossQ = cross(A_omega_B_B,vector_q_B);
omegaCrossDq = cross(A_omega_B_B,Q_firstDiff);
alphaCrossQ = cross(A_alpha_B,vector_q_B);

%actually perform the 2nd Transport Theorum
Addt_q_B = Q_secondDiff + alphaCrossQ + (2*omegaCrossDq) + cross(A_omega_B_B,omegaCrossQ);

fprintf('Theorums have been transported!\n')
end