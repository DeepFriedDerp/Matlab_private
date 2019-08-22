%syms for euler angles 
syms theta(t) phi(t) psi(t);
%syms for the position vector of the CM
syms xB(t) yB(t) zB(t);
%syms for the velocity components of the CM
syms uB(t) vB(t) wB(t);
%syms for the angular velocity of the eraser (frame B)
syms pB(t) qB(t) rB(t);

%rotation sequence for frame O to frame B
rotation_sequence = ['z','y','x'];
%corresponding euler angles to use for rotation about each axis,
%respectivlely
euler_angles = [psi(t),phi(t),theta(t)];
%definition of linear velocity components
lin_vel_B = [uB;vB;wB];
%defintion of angular velocity components
ang_vel_B = [pB; qB; rB];



%sum of forces expressed in the O frame
sumF_O = [-0.002;0;-9.81];
%the dimension by which all other dimensions are described
d = 0.0318;
%the position vector for the body-fixed point P, defined in the B frame
B_r_PB = [-(3*d/2); d; (d/2)];

%position vector from O to B
B_r_BO = [xB(t); yB(t); zB(t)];

%the principle axis moment of inertia components for the rectangular prism
%of the eraser (no off-axis terms since body frame is aligned with
%principle axes)
Ixx_B =  ((5*(d^2))/24);
Iyy_B =  ((10*(d^2))/24);
Izz_B =  ((13*(d^2))/24);
%moment of inertia tensor in the B frame
I_B = [Ixx_B,0,0; 0,Iyy_B,0; 0,0,Izz_B];

%the rotation matrix from O to B
BcO = BcA_RotationMatrix(rotation_sequence,euler_angles);
OcB = transpose(BcO);

%the angular velocity of frame B with respect to frame O, expressed in the
%B frame
O_omega_B_B = A_omega_B(BcO,"BA",'B');

%velocity vector from O to B, expressed in B frame
[O_v_BO_B] = TransportTheorum_1(B_r_BO, O_omega_B_B);

%acceleration vector from O to B, expressed in B frame
O_a_BO_B = TransportTheorum_2(B_r_BO, O_omega_B_B);

%angular momentum of system B, about O, expressed in the B frame
O_O_h_B_B = (I_B * O_omega_B_B);

%O time-derivative of angular momentum, expressed in B
Odt_O_O_h_B_B = TransportTheorum_1(O_O_h_B_B, O_omega_B_B);

%retarding force, expressed in O
retF_O = dot(sumF_O,[1;0;0])*[1;0;0];
%now expressed in B
retF_B = BcO*retF_O;

%sum of forces in the B frame
sumF_B = BcO*sumF_O;

%torque about B(CM), expressed in B
torq_B_B = cross(B_r_PB,retF_B);

%Now we have to substitute expressions for each derivative
% x1 = xB   x3 = yB   x5 = zB
% x1_dot = x2   x2 = uB   x2_dot = uB_dot = xB_dubDot
% x3_dot = x4   x4 = vB   x4_dot = vB_dot = yB_dubDot
% x5_dot = x6   x6 = wB   x6_dot = wB_dot = zB_dubDot
% 
% x7 = theta   x9 = phi   x11 = psi
% x7_dot = x8     x8 = pB    x8_dot  = pB_dot = theta_dubDot
% x9_dot = x10    x10 = qB   x10_dot = qB_dot = phi_dubDot
% x11_dot = x12   x12 = rB   x12_dot = rB_dot = psi_dubDot
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12;
syms x1dot x2dot x3dot x4dot x5dot x6dot x7dot x8dot x9dot x10dot x11dot x12dot;

%generate subbing vectors
%   regular vars and ddt's of vars
regVect = [xB,yB,zB,str2sym('diff(xB(t), t)'), str2sym('diff(yB(t), t)'), str2sym('diff(zB(t), t)')];
regVect = [regVect, str2sym('diff(xB(t), t, t)'), str2sym('diff(yB(t), t, t)'), str2sym('diff(zB(t), t, t)')];
regVect = [regVect, theta,phi,psi,str2sym('diff(psi(t), t)'), str2sym('diff(phi(t), t)'), str2sym('diff(theta(t), t)')];
regVect = [regVect, str2sym('diff(psi(t), t, t)'), str2sym('diff(phi(t), t, t)'), str2sym('diff(theta(t), t, t)')];
%   replacement vars
subVect = [x1,x3,x5,x2,x4,x6,x2dot,x4dot,x6dot];
subVect = [subVect,x7,x9,x11,x8,x10,x12,x8dot,x10dot,x12dot]; 

%sub in the replacement vars
subbed_torq_B_B = subs(torq_B_B, regVect, subVect);
subbed_O_a_BO_B = subs(O_a_BO_B, regVect, subVect);
subbed_Odt_O_O_h_B_B = subs(Odt_O_O_h_B_B,regVect, subVect);

%solve for the xdots to get uBdot, vBdot, wBdot, pBdot, qBdot, rBdot
% derivatives of state, system of linear ODEs
[uBdot,vBdot,wBdot] = solve((subbed_O_a_BO_B == sumF_B),[x2dot,x4dot,x6dot]);
[pBdot,qBdot,rBdot] = solve((subbed_Odt_O_O_h_B_B == subbed_torq_B_B), [x8dot,x10dot,x12dot]);
