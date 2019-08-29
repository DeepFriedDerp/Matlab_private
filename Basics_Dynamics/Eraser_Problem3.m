clear all;
syms x(t) y(t) z(t) px py pz th(t) ph(t) ps(t) IxxB IyyB IzzB FrX FrY FrZ FgX FgY FgZ m g;
rot_seq = ['z' 'y' 'x'];
eul_ang = [ps(t) ph(t) th(t)];

%Rotation Matrices
BcO = BcA_RotationMatrix(rot_seq,eul_ang); % verified correct
OcB = transpose(BcO);

%Rotation Velocities and Accelerations between Frames
O_omega_B_B = A_omega_B(BcO,"BA",'B'); % verified correct
O_alpha_B = simplify(diff(O_omega_B_B,t));

%postion vectors
r_BO_B = [x(t);y(t);z(t)];
r_PB_B = [px;py;pz];

%acceleration vector
O_a_BO_B = TransportTheorum_2(r_BO_B,O_omega_B_B); % verified correct

%Angular Momentum and Oddt of Angular Momentum
I_B = [IxxB 0 0 ; 0 IyyB 0 ; 0 0 IzzB];
O_O_h_B_B = simplify(I_B * O_omega_B_B);
Oddt_O_O_h_B_B = simplify(TransportTheorum_1(O_O_h_B_B, O_omega_B_B)); % verified correct

%Forces
Fg_O = [FgX;FgY;FgZ];
Fp_O = [FrX;FrY;FrZ];
Fg_B = simplify(BcO * Fg_O);
Fp_B = simplify(BcO * Fp_O);

%Sum of Forces
Fs_B = Fg_B + Fp_B;

%Torques (and sum of torques)
tau_PB_B = simplify((cross(r_PB_B , Fp_B)));

%Sum of Forces = Mass * Acceleration
eqnSet1 = Fs_B == m * O_a_BO_B;

%Sum of Torques = Rate of Change of Angular Momentum
eqnSet2 = tau_PB_B == Oddt_O_O_h_B_B; % verified for B = CM

%verified to work via extensive set of test conditions
%subs works with x(t) if regVect lists as x, as long as the sym was
%originally specified 'syms x(t)'
%set of current symbolic variables
syms a b c u v w udot vdot wdot theta phi psi p q r pdot qdot rdot;
%regVect and subVect are coded identically line-by-line to reduce error
regVect = [x y z str2sym('diff(x(t), t)') str2sym('diff(y(t), t)') str2sym('diff(z(t), t)')];
regVect = [regVect str2sym('diff(x(t), t, t)') str2sym('diff(y(t), t, t)') str2sym('diff(z(t), t, t)')];
regVect = [regVect th ph ps str2sym('diff(th(t), t)') str2sym('diff(ph(t), t)') str2sym('diff(ps(t), t)')];
regVect = [regVect str2sym('diff(th(t), t, t)') str2sym('diff(ph(t), t, t)') str2sym('diff(ps(t), t, t)')];

subVect = [a b c u v w];
subVect = [subVect udot vdot wdot];
subVect = [subVect theta phi psi p q r];
subVect = [subVect pdot qdot rdot];

%sub in easier to solve and read variables
subbed_eqnSet1 = subs(eqnSet1,regVect,subVect);
subbed_eqnSet2 = subs(eqnSet2,regVect,subVect);

%assemble the final equation set to solve
subbed_finalEqSet = [subbed_eqnSet1 ; subbed_eqnSet2];

%solve for udot,vdot,wdot,pdot,qdot,rdot (state derivatives)
stateDeriv_eqns = solve(subbed_finalEqSet,[udot vdot wdot pdot qdot rdot]);

%substitution for building out the simulation code (state space)
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12;
subVect2 = [x1 x2 x3 x4 x5 x6];
subVect2 = [subVect2 udot vdot wdot];
subVect2 = [subVect2 x7 x8 x9 x10 x11 x12];
subVect2 = [subVect2 pdot qdot rdot];

%build out the equations of motion in state space
EOM(1) = x4;
EOM(2) = x5;
EOM(3) = x6;
EOM(4) = simplify((subs((stateDeriv_eqns.udot),subVect,subVect2)));
EOM(5) = simplify((subs((stateDeriv_eqns.vdot),subVect,subVect2)));
EOM(6) = simplify((subs((stateDeriv_eqns.wdot),subVect,subVect2)));
EOM(7) = x10;
EOM(8) = x11;
EOM(9) = x12;
EOM(10) = simplify((subs((stateDeriv_eqns.pdot),subVect,subVect2)));
EOM(11) = simplify((subs((stateDeriv_eqns.qdot),subVect,subVect2)));
EOM(12) = simplify((subs((stateDeriv_eqns.rdot),subVect,subVect2)));
EOM = transpose(EOM);

%build out the extra equations needed to define everything
EXTRA(1) = convertCharsToStrings('m = 0.5');
EXTRA(2) = convertCharsToStrings('g = -9.81');
EXTRA(3) = convertCharsToStrings('d = 0.0318');
EXTRA(4) = convertCharsToStrings('h = d');
EXTRA(5) = convertCharsToStrings('b = 2*d');
EXTRA(6) = convertCharsToStrings('L = 3*d');
EXTRA(7) = convertCharsToStrings('FgX = 0');
EXTRA(8) = convertCharsToStrings('FgY = 0');
EXTRA(9) = convertCharsToStrings('FgZ = m*g');
EXTRA(10) = convertCharsToStrings('FrX = -0.001');
EXTRA(11) = convertCharsToStrings('FrY = 0');
EXTRA(12) = convertCharsToStrings('FrZ = 0');
EXTRA(13) = convertCharsToStrings('px = -L/2');
EXTRA(14) = convertCharsToStrings('py = b/2');
EXTRA(15) = convertCharsToStrings('pz = h/2');
EXTRA(16) = convertCharsToStrings('IxxB = (m/12)*(b^2 + h^2)');
EXTRA(17) = convertCharsToStrings('IyyB = (m/12)*(h^2 + L^2)');
EXTRA(18) = convertCharsToStrings('IzzB = (m/12)*(b^2 + L^2)');
EXTRA = transpose(EXTRA);

% build the ode state derivative file
[~] = ODE_FuncGen(EOM,'testfile',EXTRA);

%simulate using ODE solver
[tsim,xsim] = ode45('testfile',[0 100],[0 0 0 1 1 1 0 0 0 0 0 0]);

%plot the results
subplot(2,2,1);
hold on;
plot(tsim,xsim(:,1))
plot(tsim,xsim(:,2))
plot(tsim,xsim(:,3))
hold off;
title('Displacement')
legend('xB','yB','zB')

subplot(2,2,2);
hold on;
plot(tsim,xsim(:,4))
plot(tsim,xsim(:,5))
plot(tsim,xsim(:,6))
hold off;
title('Velocity')
legend('uB','vB','wB')

subplot(2,2,3);
hold on;
plot(tsim,xsim(:,7))
plot(tsim,xsim(:,8))
plot(tsim,xsim(:,9))
hold off;
title('Euler Angles')
legend('theta','phi','psi')

subplot(2,2,4);
hold on;
plot(tsim,xsim(:,10))
plot(tsim,xsim(:,11))
plot(tsim,xsim(:,12))
hold off;
title('Angle Rates')
legend('pdot','pdot','rdot')