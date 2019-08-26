syms xB(t) yB(t) zB(t); 
syms theta(t) phi(t) psi(t);
syms FgX FgY FgZ;
syms FrX FrY FrZ;
syms FsX FsY FsZ;
syms rPBx rPBy rPBz;
syms Ixx_B Iyy_B Izz_B
syms b l h d m g;
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12;
syms x4dot x5dot x6dot x10dot x11dot x12dot;

Fg_O = [FgX;FgY;FgZ];
Fr_O = [FrX;FrY;FrZ];

r_BO_B = [xB(t);yB(t);zB(t)];
r_PB_B = [rPBx; rPBy; rPBz];

eulerAngles = [psi(t);phi(t);theta(t)];
rotationSequence = ['z' 'y' 'x'];

Rx = elementalRotationMatrix('x',theta,3);
Ry = elementalRotationMatrix('y',phi,3);
Rz = elementalRotationMatrix('z',psi,3);

BcO = (Rz * Ry * Rx);
% BcO = BcA_RotationMatrix(rotationSequence,eulerAngles);
OcB = transpose(BcO);
OcB_dot = simplify(diff(OcB,t));

%r_BO_B = (BcO*r_BO_O);
%r_PB_B = (BcO*r_PB_O);
Fg_B = simplify(BcO*Fg_O);
Fr_B = simplify(BcO*Fr_O);

Fs_B = Fg_B + Fr_B;

torq_B = simplify(cross(r_PB_B , Fr_B));

I_B = [Ixx_B 0 0 ; 0 Iyy_B 0 ; 0 0 Izz_B];

owb_X = simplify(BcO * OcB_dot);
owbx = owb_X * [0 ; 1 ; 0];
owby = owb_X * [0 ; 0 ; 1];
owbz = owb_X * [1 ; 0 ; 0];
owbx = [0 0 1] * owbx;
owby = [1 0 0] * owby;
owbz = [0 1 0] * owbz;
O_omega_B_B = [owbx;owby;owbz];
O_alpha_B_B = simplify(diff(O_omega_B_B , t));


O_h_O_B_B = (I_B * O_omega_B_B);
Oddt_O_h_O_B_B = simplify(diff(O_h_O_B_B , t) + cross(O_omega_B_B , r_BO_B));
O_a_BO_B = simplify(diff(r_BO_B,t,2) + (cross(O_alpha_B_B , r_BO_B)) + 2*cross(O_omega_B_B , diff(r_BO_B,t)) + cross(O_omega_B_B , cross(O_omega_B_B , r_BO_B)));

expression = [O_a_BO_B - (Fs_B/m) == zeros(3,1) ; Oddt_O_h_O_B_B - torq_B == zeros(3,1)];

regVect = [xB(t) yB(t) zB(t) str2sym('diff(xB(t), t)') str2sym('diff(yB(t), t)') str2sym('diff(zB(t), t)')];
regVect = [regVect theta(t) phi(t) psi(t) str2sym('diff(theta(t), t)') str2sym('diff(phi(t), t)') str2sym('diff(psi(t), t)')];
regVect = [regVect str2sym('diff(xB(t), t, t)') str2sym('diff(yB(t), t, t)') str2sym('diff(zB(t), t, t)') str2sym('diff(theta(t), t, t)') str2sym('diff(phi(t), t, t)') str2sym('diff(psi(t), t, t)')];

subVect = [x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x4dot x5dot x6dot x10dot x11dot x12dot];

subbed_expression = subs(expression , regVect , subVect);

stateDerivs = [x4dot ; x5dot ; x6dot ; x10dot ; x11dot ; x12dot];

solved_stateDerivs = solve(subbed_expression , stateDerivs);

EOM(1) = x4;
EOM(2) = x5;
EOM(3) = x6;
EOM(4) = simplify(solved_stateDerivs.x4dot);
EOM(5) = simplify(solved_stateDerivs.x5dot);
EOM(6) = simplify(solved_stateDerivs.x6dot);
EOM(7) = x10;
EOM(8) = x11;
EOM(9) = x12;
EOM(10) = simplify(solved_stateDerivs.x10dot);
EOM(11) = simplify(solved_stateDerivs.x11dot);
EOM(12) = simplify(solved_stateDerivs.x12dot);

EXTRA(1) = convertCharsToStrings('FrX = -0.001');
EXTRA(2) = convertCharsToStrings('FrY = 0');
EXTRA(3) = convertCharsToStrings('FrZ = 0');
EXTRA(4) = convertCharsToStrings('FgX = 0');
EXTRA(5) = convertCharsToStrings('FgY = 0');
EXTRA(6) = convertCharsToStrings('m = 0.5');
EXTRA(7) = convertCharsToStrings('g = -9.81');
EXTRA(8) = convertCharsToStrings('FgZ = m*g');
EXTRA(9) = convertCharsToStrings('d = 0.0318');
EXTRA(10) = convertCharsToStrings('b = 2*d');
EXTRA(11) = convertCharsToStrings('l = 3*d');
EXTRA(12) = convertCharsToStrings('h = d');
EXTRA(13) = convertCharsToStrings('Ixx_B = (m*(b^2 + h^2))/12');
EXTRA(14) = convertCharsToStrings('Iyy_B = (m*(h^2 + l^2))/12');
EXTRA(15) = convertCharsToStrings('Izz_B = (m*(b^2 + l^2))/12');
EXTRA(16) = convertCharsToStrings('rPBx = ((-3*d)/2)');
EXTRA(17) = convertCharsToStrings('rPBy = d');
EXTRA(18) = convertCharsToStrings('rPBz = d/2');

[~] = ODE_FuncGen(transpose(EOM),'testfile',transpose(EXTRA));
[tsim,xsim] = ode45('testfile',[0 3],[0 0 0 1 1 1 0 0 0 0 0 0]);