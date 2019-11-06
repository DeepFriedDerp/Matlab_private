%% Settings

clearErthang = 1; % clears all stuff

if clearErthang
    clear all;
end

%% Setup

syms rBO_x(t) rBO_y(t) rBO_z(t) ... % some position vectors
    rCB_x rCB_y rCB_z ...
    rPB_x rPB_y rPB_z ...
    vWO_x vWO_y vWO_z ... %except this one, its a velocity
    rGO_x rGO_y rGO_z ...
    ...
    ... % for the rotation matrices
    phi(t) theta(t) psi(t) ...
    ...
    ... % for moment of inertia
    Ixx Ixy Ixz Iyy Iyz Izz ...
    ...
    ... % lift,moment,and gravity force leftover vars, to make sure math works
    L_x L_y ...
    D_y D_z ...
    Y_x Y_z ...
    l_y l_z ...
    m_x m_z ...
    n_x n_y ...
    Fg_x Fg_y ...
    Tx Ty Tz ...
    ...
    ... % some general constants
    k_tether lo_tether mT g rho...
    Sref Bref Cref ...
    ...
    ... % lift and moment coefficients
    cLa cLb cLde cLp cLq cLr ...
    cDtot ...
    cYa cYb cYde cYp cYq cYr ...
    cla clb clde clp clq clr ...
    cma cmb cmde cmp cmq cmr ...
    cna cnb cnde cnp cnq cnr ...
    ...
    CL CD CY Cl Cm Cn...
    ...
    ... % de
    de ...
    alpha beta windspeed...
    ;

rBO_B = [rBO_x(t) rBO_y(t) rBO_z(t)];
rCB_B = [rCB_x rCB_y rCB_z];
rPB_B = [rPB_x rPB_y rPB_z];
O_v_WO_O = [vWO_x vWO_y vWO_z];
rGO_O = [rGO_x rGO_y rGO_z];

% C = [C_x C_y C_z];
% D = [D_x D_y D_z];
% Y = [Y_x Y_y Y_z];
% l = [l_x l_y l_z ];
% m = [m_x m_y m_z];
% n = [n_x n_y n_z];

I_B = [
    Ixx Ixy Ixz
    Ixy Iyy Iyz
    Ixz Iyz Izz
    ];


%% DERIVE THE ROTATION MATRIX (Y-Z-X, THETA-PSI-PHI ROTATION SEQUENCE)
Rx_phi = [
    1   0               0
    0   cos(phi(t))     sin(phi(t))
    0   -sin(phi(t))    cos(phi(t))
    ];

Rz_psi = [
    cos(psi(t))     sin(psi(t))    0
    -sin(psi(t))    cos(psi(t))    0
    0               0               1
    ];

Ry_theta = [
    cos(theta(t))   0   -sin(theta(t))
    0               1   0
    sin(theta(t))   0   cos(theta(t))
    ];

% *********************** BcO and OcB *************************************
BcO = (Rx_phi * Rz_psi * Ry_theta);
OcB = transpose(BcO);
% *************************************************************************

%% DERIVE THE TERMS FOR O_omega_B_B AND O_alpha_B

OcB_dot = (diff(OcB));

omega_x_B = [0 0 1]*BcO*OcB_dot*[0;1;0];
omega_y_B = [1 0 0]*BcO*OcB_dot*[0;0;1];
omega_z_B = [0 1 0]*BcO*OcB_dot*[1;0;0];

% ***************** O_omega_B_B and O_alpha_B *****************************
O_omega_B_B = [omega_x_B omega_y_B omega_z_B];
O_alpha_B = (diff(O_omega_B_B));
% *************************************************************************

%% DERIVE EXPRESSION FOR O_v_BO_B

% 1st transport theorem
% *************************** O_v_BO_B ************************************
O_v_BO_B = ( ...
    diff(rBO_B) + ...
    cross(O_omega_B_B ,rBO_B) ... 
    );
% *************************************************************************

%% DERIVE EXPRESSION FOR O_a_BO_B

% 2nd transport theorem
% *************************** O_a_BO_B ************************************
O_a_BO_B = ( ...
    diff(diff(rBO_B)) + ...
    (2 * cross(O_omega_B_B , diff(rBO_B))) + ...
    cross(O_alpha_B , rBO_B) + ...
    cross(O_omega_B_B , cross(O_omega_B_B , rBO_B)) ...
    );
% *************************************************************************

%% DERIVE EXPRESSION FOR O_O_h_B_B and its O_derivative

% *************************** O_O_h_B_B ***********************************
O_O_h_B_B = transpose((I_B * transpose(O_omega_B_B)));
% *************************************************************************

% 1st transport theorem
% *********************** Oddt_O_O_h_B_B **********************************
Oddt_O_O_h_B_B = ( ...
    diff(O_O_h_B_B) + ...
    cross(O_omega_B_B , O_O_h_B_B) ...
    );
% *************************************************************************


%% DERIVE EXPRESSIONS FOR alpha AND beta AND vel (AERO)

O_v_WO_B = transpose((BcO * transpose(O_v_WO_O)));
O_v_OB_B = -O_v_BO_B;

% ************************* O_v_WB_B **************************************
O_v_WB_B = (O_v_WO_B + O_v_OB_B);
% *************************************************************************

jB_proj_O_v_WB_B = O_v_WB_B - (O_v_WB_B * [0; 1; 0]);
kB_proj_O_v_WB_B = O_v_WB_B - (O_v_WB_B * [0; 0; 1]);

% *********************** alpha AND beta AND windspeed ********************
alpha_eq = ( ...
    acos( ...
    (-((jB_proj_O_v_WB_B)/norm(jB_proj_O_v_WB_B)) * [(1); 0; 0]) ...
    ) ...
    );

beta_eq = ( ...
    acos( ...
    (-((kB_proj_O_v_WB_B)/norm(kB_proj_O_v_WB_B)) * [(1); 0; 0]) ...
    ) ...
    );

windspeed_EQ = (norm(O_v_WB_B));
% *************************************************************************

%% Rotation for aeroForces
WcB = [
    cos(alpha) 0 sin(alpha)
    0 1 0 
    -sin(alpha) 0 cos(alpha)
    ];
BcW = transpose(WcB);

%% DERIVE EXPRESSIONS FOR AERO FORCE/MOMENT COEFFICIENTS

CL_eq = ( ...
    (cLa* alpha) + (cLb * beta) + (cLde * de) + (cLp * O_omega_B_B(1)) ...
    + (cLq * O_omega_B_B(2)) + (cLr * O_omega_B_B(3)) ...
    );

CD_eq = cDtot;

CY_eq = ( ...
    (cYa * alpha) + (cYb * beta) + (cYde * de) + (cYp * O_omega_B_B(1)) ...
    + (cYq * O_omega_B_B(2)) + (cYr * O_omega_B_B(3)) ...
    );

Cl_eq = ( ...
    (cla* alpha) + (clb * beta) + (clde * de) + (clp * O_omega_B_B(1)) ...
    + (clq * O_omega_B_B(2)) + (clr * O_omega_B_B(3)) ...
    );

Cm_eq = ( ...
    (cma * alpha) + (cmb * beta) + (cmde * de) + (cmp * O_omega_B_B(1)) ...
    + (cmq * O_omega_B_B(2)) + (cmr * O_omega_B_B(3)) ...
    );

Cn_eq = ( ...
    (cna * alpha) + (cnb * beta) + (cnde * de) + (cnp * O_omega_B_B(1)) ...
    + (cnq * O_omega_B_B(2)) + (cnr * O_omega_B_B(3)) ...
    );

%% DERIVE EXPRESSION FOR Q

Q = (0.5 * rho * windspeed * windspeed);

%% DERIVE EXPRESSIONS FOR AERO FORCES AND MOMENTS

L_z = (CL * Q * Sref);

D_x = (CD * Q * Sref);

Y_y = (CY * Q * Sref);
 
l_x = (Cl * Q * Sref * Bref);

m_y = (Cm * Q * Sref * Cref);

n_z = (Cn * Q * Sref * Bref);

% assign them to their vectors
L = simplify(transpose(BcW*transpose([L_x L_y L_z])));

D = simplify(transpose(BcW*transpose([D_x D_y D_z])));

Y = simplify(transpose(BcW*transpose([Y_x Y_y Y_z])));

l = simplify(transpose(BcW*transpose([l_x l_y l_z])));

m = simplify(transpose(BcW*transpose([m_x m_y m_z])));

n = simplify(transpose(BcW*transpose([n_x n_y n_z])));

% Now for the last few torques
tau_L = (cross(L , rCB_B));

tau_D = (cross(D , rCB_B));

tau_Y = (cross(Y , rCB_B));

%% DERIVE FORCE AND MOMENT VECTOR FOR TETHER

rGO_B = transpose((BcO*transpose(rGO_O)));
rGP_B = (rGO_B - rBO_B - rPB_B);

lcurrent_tether = norm(rGP_B);
dl_tether = lcurrent_tether - lo_tether;
dl_tether_eq = dl_tether;
%sigmoidFnc = exp(1000000*dl_tether) / (1 + exp(1000000*dl_tether));

normT = ((k_tether * dl_tether));

T_eq = (normT * (rGP_B / norm(rGP_B)));

T = [Tx Ty Tz];

tau_T = (cross(T , rPB_B));

%% DERIVE GRAVITY VECTOR

Fg_z = mT * g;

Fg_O = [Fg_x Fg_y Fg_z];

Fg_B = transpose((BcO * transpose(Fg_O)));

%% DERIVE EXPRESSIONS FOR F = MA AND ODDT(H) = TAU

F_over_M = ((Fg_B + T + L + D + Y) / mT);

tauTot = (l + m + n + tau_L + tau_D + tau_Y + tau_T);

linEQ = O_a_BO_B == F_over_M;
angEQ = Oddt_O_O_h_B_B == tauTot;

EQ_unsolved = [linEQ , angEQ];

symvar(EQ_unsolved)

%% SUBSTITUTE STUFF INTO OTHER STUFF

syms rBO_X rBO_Y rBO_Z ... 
    rBO_X_d rBO_Y_d rBO_Z_d ...
    rBO_X_d_d rBO_Y_d_d rBO_Z_d_d ...
    ...   
    ...
    rCB_X...
    ...
    ...
    vWO_X vWO_Y vWO_Z ...
    ...
    ...
    ... % for the rotation matrices
    ph th ps ...
    ph_d th_d ps_d ...
    ph_d_d th_d_d ps_d_d ...
    ...
    ...
    CLa CLb CLde CLp CLq CLr ...
    CDtot ...
    CYa CYb CYde CYp CYq CYr ...
    Cla Clb Clde Clp Clq Clr ...
    Cma Cmb Cmde Cmp Cmq Cmr ...
    Cna Cnb Cnde Cnp Cnq Cnr ...
    ;

regVect = [ ...
    str2sym('rBO_x(t)') str2sym('rBO_y(t)') str2sym('rBO_z(t)') ...
    str2sym('diff(rBO_x(t), t)') str2sym('diff(rBO_y(t), t)') str2sym('diff(rBO_z(t), t)') ...
    str2sym('diff(rBO_x(t), t, t)') str2sym('diff(rBO_y(t), t, t)') str2sym('diff(rBO_z(t), t, t)') ...
    ...
    str2sym('rCB_x') str2sym('rCB_y') str2sym('rCB_z') ...
    ...   
    str2sym('rPB_x') str2sym('rPB_y') str2sym('rPB_z') ...
    ...
    str2sym('vWO_x') str2sym('vWO_y') str2sym('vWO_z') ... %except this one, its a velocity
    ...
    str2sym('rGO_x') str2sym('rGO_y') str2sym('rGO_z') ...
    ...
    ... % for the rotation matrices
    str2sym('phi(t)') str2sym('theta(t)') str2sym('psi(t)') ...
    str2sym('diff(phi(t), t)') str2sym('diff(theta(t), t)') str2sym('diff(psi(t), t)') ...
    str2sym('diff(phi(t), t, t)') str2sym('diff(theta(t), t, t)') str2sym('diff(psi(t), t, t)') ...
    ...
    ...
    ... % for moment of inertia
    str2sym('Ixx') str2sym('Ixy') str2sym('Ixz') str2sym('Iyy') str2sym('Iyz') str2sym('Izz') ...
    ...
    ...
    ... % lift,moment,and gravity force leftover vars, to make sure math works
    str2sym('L_x') str2sym('L_y') ...
    str2sym('D_y') str2sym('D_z') ...
    str2sym('Y_x') str2sym('Y_z') ...
    str2sym('l_y') str2sym('l_z') ...
    str2sym('m_x') str2sym('m_z') ...
    str2sym('n_x') str2sym('n_y') ...
    str2sym('Fg_x') str2sym('Fg_y') ...
    ...
    ... % some general constants
    str2sym('k_tether') str2sym('lo_tether') str2sym('mT') str2sym('g') str2sym('rho') ...
    str2sym('Sref') str2sym('Bref') str2sym('Cref') ...
    ...
    ... % lift and moment coefficients
    str2sym('cLa') str2sym('cLb') str2sym('cLde') str2sym('cLp') str2sym('cLq') str2sym('cLr') ...
    str2sym('cDtot') ...
    str2sym('cYa') str2sym('cYb') str2sym('cYde') str2sym('cYp') str2sym('cYq') str2sym('cYr') ...
    str2sym('cla') str2sym('clb') str2sym('clde') str2sym('clp') str2sym('clq') str2sym('clr') ...
    str2sym('cma') str2sym('cmb') str2sym('cmde') str2sym('cmp') str2sym('cmq') str2sym('cmr') ...
    str2sym('cna') str2sym('cnb') str2sym('cnde') str2sym('cnp') str2sym('cnq') str2sym('cnr') ...
    ...
    ... % de
    %de ...
    ];

subVect = [ ...
    str2sym('rBO_X') str2sym('rBO_Y') str2sym('rBO_Z') ...
    str2sym('rBO_X_d') str2sym('rBO_Y_d') str2sym('rBO_Z_d') ...
    str2sym('rBO_X_d_d') str2sym('rBO_Y_d_d') str2sym('rBO_Z_d_d') ...
    ...
    str2sym('rCB_X') -.27 0 ...
    ...   
    0 0.2107 0 ...
    ...
    str2sym('vWO_X') str2sym('vWO_Y') str2sym('vWO_Z') ... %except this one, its a velocity
    ...
    0 0 152.4 ...
    ...
    ...
    ... % for the rotation matrices
    str2sym('ph') str2sym('th') str2sym('ps') ...
    str2sym('ph_d') str2sym('th_d') str2sym('ps_d') ...
    str2sym('ph_d_d') str2sym('th_d_d') str2sym('ps_d_d') ...
    ...
    ...
    ... % for moment of inertia
    0.2119 0.0281 0 0.1473 0 0.0904 ...
    ...
    ...
    ... % lift,moment,and gravity force leftover vars, to make sure math works
    0 0 ...
    0 0 ...
    0 0 ...
    0 0 ...
    0 0 ...
    0 0 ...
    0 0 ...
    ...
    ... % some general constants
    37.5 75.914856 1.0862 -9.81 1.225...
    0.4 1.4 0.3 ...
    ...
    ... % lift and moment coefficients
    str2sym('CLa') str2sym('CLb') str2sym('CLde') str2sym('CLp') str2sym('CLq') str2sym('CLr') ...
    str2sym('CDtot') ...
    str2sym('CYa') str2sym('CYb') str2sym('CYde') str2sym('CYp') str2sym('CYq') str2sym('CYr') ...
    str2sym('Cla') str2sym('Clb') str2sym('Clde') str2sym('Clp') str2sym('Clq') str2sym('Clr') ...
    str2sym('Cma') str2sym('Cmb') str2sym('Cmde') str2sym('Cmp') str2sym('Cmq') str2sym('Cmr') ...
    str2sym('Cna') str2sym('Cnb') str2sym('Cnde') str2sym('Cnp') str2sym('Cnq') str2sym('Cnr') ...
    ...
    ... % de
    %str2sym('de') ...
    ];

    EQ_unsolved_subbed_1 = subs(EQ_unsolved,regVect,subVect);
    %%
    alpha_subbed_1 = subs(alpha_eq,regVect,subVect);
    beta_subbed_1 = subs(beta_eq,regVect,subVect);
    PQR_subbed_1 = subs(O_omega_B_B,regVect,subVect);
    windspeed_subbed_1 = subs(windspeed_EQ,regVect,subVect);
    dl_tether_subbed_1 = subs(dl_tether_eq,regVect,subVect);
    T_subbed_1 = subs(T_eq,regVect,subVect);
    CL_subbed_1 = subs(CL_eq,regVect,subVect);
    CD_subbed_1 = subs(CD_eq,regVect,subVect);
    CY_subbed_1 = subs(CY_eq,regVect,subVect);
    Cl_subbed_1 = subs(Cl_eq,regVect,subVect);
    Cm_subbed_1 = subs(Cm_eq,regVect,subVect);
    Cn_subbed_1 = subs(Cn_eq,regVect,subVect);

%% now solve for state derivatives and extra stuff 

EQ_solved_unsimple_1 = solve(EQ_unsolved_subbed_1,[rBO_X_d_d,rBO_Y_d_d,rBO_Z_d_d,ph_d_d,th_d_d,ps_d_d]);

EQ_solve_simple_1(1) = simplify(EQ_solved_unsimple_1.rBO_X_d_d);
EQ_solve_simple_1(2) = simplify(EQ_solved_unsimple_1.rBO_Y_d_d);
EQ_solve_simple_1(3) = simplify(EQ_solved_unsimple_1.rBO_Z_d_d);
EQ_solve_simple_1(4) = simplify(EQ_solved_unsimple_1.ph_d_d);
EQ_solve_simple_1(5) = simplify(EQ_solved_unsimple_1.th_d_d);
EQ_solve_simple_1(6) = simplify(EQ_solved_unsimple_1.ps_d_d);
%%

alpha_simple_1 = simplify(alpha_subbed_1);
beta_simple_1 = simplify(beta_subbed_1);
PQR_simple_1 = simplify(PQR_subbed_1);
windspeed_simple_1 = simplify(windspeed_subbed_1);
dl_tether_simple_1= simplify(dl_tether_subbed_1);
T_simple_1 = simplify(T_subbed_1);
CL_simple_1 = simplify(CL_subbed_1);
CD_simple_1 = simplify(CD_subbed_1);
CY_simple_1 = simplify(CY_subbed_1);
Cl_simple_1 = simplify(Cl_subbed_1);
Cm_simple_1 = simplify(Cm_subbed_1);
Cn_simple_1 = simplify(Cn_subbed_1);

ExtraEQ_simple_1 = [ ...
    alpha_simple_1      beta_simple_1           windspeed_simple_1 ...
    PQR_simple_1        dl_tether_simple_1      T_simple_1...
    CL_simple_1         CD_simple_1             CY_simple_1 ...
    Cl_simple_1         Cm_simple_1             Cn_simple_1 ...
    ];

%% SUB IN THE X VALUES
% x(1) = rBO_X      x(7) = rBO_X_d     xdot(1) = x(7)       xdot(7) = EQ(1)
% x(2) = rBO_X      x(8) = rBO_Y_d     xdot(2) = x(8)       xdot(8) = EQ(2)
% x(3) = rBO_Z      x(9) = rBO_Z_d     xdot(3) = x(9)       xdot(9) = EQ(3)
% x(4) = ph         x(10) = ph_d       xdot(4) = x(10)      xdot(10) = EQ(4)
% x(5) = th         x(11) = th_d       xdot(5) = x(11)      xdot(11) = EQ(5)
% x(6) = ps         x(12) = ps_d       xdot(6) = x(12)      xdot(12) = EQ(6)



regVect = [ ...
    rBO_X rBO_Y rBO_Z ...
    rBO_X_d rBO_Y_d rBO_Z_d ...
    ph th ps ...
    ph_d th_d ps_d ...
    ];

subVect = [ ...
    str2sym('x(1)') str2sym('x(2)') str2sym('x(3)') ...
    str2sym('x(7)') str2sym('x(8)') str2sym('x(9)') ...
    str2sym('x(4)') str2sym('x(5)') str2sym('x(6)') ...
    str2sym('x(10)') str2sym('x(11)') str2sym('x(12)') ...
    ]; 

EqVect = [ ...
    str2sym('xdot(1)') str2sym('xdot(2)') str2sym('xdot(3)') ...
    str2sym('xdot(4)') str2sym('xdot(5)') str2sym('xdot(6)') ...
    str2sym('xdot(7)') str2sym('xdot(8)') str2sym('xdot(9)') ...
    str2sym('xdot(10)') str2sym('xdot(11)') str2sym('xdot(12)') ...
    ];

ExtaEqVect = [
    "alpha"
    "beta"
    "windspeed"
    "p"
    "q"
    "r"
    "d_tether"
    "Tx"
    "Ty"
    "Tz"
    "CL"
    "CD"
    "CY"
    "Cl"
    "Cm"
    "Cn"
    ];
    

EQ_solve_simple_1 = subs(EQ_solve_simple_1,regVect,subVect);
ExtraEQ_simple_1 = subs(ExtraEQ_simple_1,regVect,subVect);

EQ_solve_final_1 = [ ...
    str2sym('x(7)') str2sym('x(8)') str2sym('x(9)') ...
    str2sym('x(10)') str2sym('x(11)') str2sym('x(12)') ...
    EQ_solve_simple_1 ...
    ];
    

EQ_string_final_1 = append(string(transpose(EqVect))," = ",string( ...
    transpose(EQ_solve_final_1)));
ExtraEQ_string_final_1 = append(ExtaEqVect," = ",string( ...
    transpose(ExtraEQ_simple_1)));


    




%% WRITE THE M FILE

fileName = 'SailFunc.m';
FID = fopen(fileName,'w');

fprintf(FID,"function [xdot] = SailFunc(t,x)\n\n");

fprintf(FID,"\tglobal otherstuff derp herp aeroForces\n");
fprintf(FID,"\tpersistent currentConfig aeroTriggers aeroTriggersLast settings results ...\n");
fprintf(FID,"\t CLa CLb CLde CLp CLq CLr ...\n");
fprintf(FID,"\tCDtot ...\n");
fprintf(FID,"\tCYa CYb CYde CYp CYq CYr ...\n");
fprintf(FID,"\tCla Clb Clde Clp Clq Clr ...\n");
fprintf(FID,"\tCma Cmb Cmde Cmp Cmq Cmr ...\n");
fprintf(FID,"\tCna Cnb Cnde Cnp Cnq Cnr ...\n");
fprintf(FID,"\tvWO_X vWO_Y vWO_Z rCB_X de...\n");
fprintf(FID,"\tcallNum stallFlag ...\n\t;\n\n");

fprintf(FID,"\tfindAeroFlag = 1;\n");
fprintf(FID,"\tif t == 0\n");
fprintf(FID,"\t\tstallFlag = 0;\n");
fprintf(FID,"\t\tcallNum = 0;\n");
fprintf(FID,"\t\tsettings = otherstuff.settings;\n");
fprintf(FID,"\t\tresults = otherstuff.results;\n");
fprintf(FID,"\t\tde = otherstuff.de;\n");
fprintf(FID,"\t\tvWO_X = otherstuff.vWO_X;\n");
fprintf(FID,"\t\tvWO_Y = otherstuff.vWO_Y;\n");
fprintf(FID,"\t\tvWO_Z = otherstuff.vWO_Z;\n");
fprintf(FID,"\tend\n\n");

fprintf(FID,"\tcallNum = callNum + 1;\n\n");

for i = 1:10
    fprintf(FID,"\t%s;\n",ExtraEQ_string_final_1(i,:));
end
fprintf(FID,"\n");

%fprintf(FID,"x\n\n");

fprintf(FID,"\tif d_tether <= 0\n");
fprintf(FID,"\t\tTx = 0;\n");
fprintf(FID,"\t\tTy = 0;\n");
fprintf(FID,"\t\tTz = 0;\n");
fprintf(FID,"\tend\n\n");

fprintf(FID,"\tcurrentConfig.alpha = alpha;\n");
fprintf(FID,"\tcurrentConfig.beta = beta;\n");
fprintf(FID,"\tcurrentConfig.de = de;\n");
fprintf(FID,"\tcurrentConfig.windspeed = windspeed;\n");
fprintf(FID,"\tcurrentConfig.p = p;\n");
fprintf(FID,"\tcurrentConfig.q = q;\n");
fprintf(FID,"\tcurrentConfig.r = r;\n\n");

% fprintf(FID,"\tcurrentConfig.alpha = 0
% fprintf(FID,"\tcurrentConfig.beta = 0;
% fprintf(FID,"\tcurrentConfig.de = 0;
% fprintf(FID,"\tcurrentConfig.windspeed = 5;
% fprintf(FID,"\tcurrentConfig.p = 0
% fprintf(FID,"\tcurrentConfig.q = 0;
% fprintf(FID,"\tcurrentConfig.r = 0;

fprintf(FID,"\tif t == 0\n");
fprintf(FID,"\t\tfindAeroFlag = 1;\n");
fprintf(FID,"\telseif ~stallFlag\n");
fprintf(FID,"\t\t[findAeroFlag] = checkForAeroLimits(currentConfig,aeroTriggersLast);\n");
fprintf(FID,"\tend\n\n");

fprintf(FID,"\tif findAeroFlag || stallFlag\n");
fprintf(FID,"\t\t[successFindAero, resultsCoords ,aeroTriggers] = findAeroConfig( ...\n");
fprintf(FID,"\t\t\tsettings,currentConfig);\n");
fprintf(FID,"\t\tif successFindAero\n");
fprintf(FID,"\t\t\taeroTriggersLast = aeroTriggers;\n");
fprintf(FID,"\t\t\tstallFlag = 0;\n\n");

fprintf(FID,"\t\t\tCLa = results(resultsCoords).cLa;\n");
fprintf(FID,"\t\t\tCLb = results(resultsCoords).cLb;\n");
fprintf(FID,"\t\t\tCLde = results(resultsCoords).cLde;\n");
fprintf(FID,"\t\t\tCLp = results(resultsCoords).cLp;\n");
fprintf(FID,"\t\t\tCLq = results(resultsCoords).cLq;\n");
fprintf(FID,"\t\t\tCLr = results(resultsCoords).cLr;\n\n");

fprintf(FID,"\t\t\tCDtot = results(resultsCoords).cDtot;\n\n");

fprintf(FID,"\t\t\tCYa = results(resultsCoords).cYa;\n");
fprintf(FID,"\t\t\tCYb = results(resultsCoords).cYb;\n");
fprintf(FID,"\t\t\tCYde = results(resultsCoords).cYde;\n");
fprintf(FID,"\t\t\tCYp = results(resultsCoords).cYp;\n");
fprintf(FID,"\t\t\tCYq = results(resultsCoords).cYq;\n");
fprintf(FID,"\t\t\tCYr = results(resultsCoords).cYr;\n\n");

fprintf(FID,"\t\t\tCla = results(resultsCoords).cla;\n");
fprintf(FID,"\t\t\tClb = results(resultsCoords).clb;\n");
fprintf(FID,"\t\t\tClde = results(resultsCoords).clde;\n");
fprintf(FID,"\t\t\tClp = results(resultsCoords).clp;\n");
fprintf(FID,"\t\t\tClq = results(resultsCoords).clq;\n");
fprintf(FID,"\t\t\tClr = results(resultsCoords).clr;\n\n");

fprintf(FID,"\t\t\tCma = results(resultsCoords).cma;\n");
fprintf(FID,"\t\t\tCmb = results(resultsCoords).cmb;\n");
fprintf(FID,"\t\t\tCmde = results(resultsCoords).cmde;\n");
fprintf(FID,"\t\t\tCmp = results(resultsCoords).cmp;\n");
fprintf(FID,"\t\t\tCmq = results(resultsCoords).cmq;\n");
fprintf(FID,"\t\t\tCmr = results(resultsCoords).cmr;\n\n");

fprintf(FID,"\t\t\tCna = results(resultsCoords).cna;\n");
fprintf(FID,"\t\t\tCnb = results(resultsCoords).cnb;\n");
fprintf(FID,"\t\t\tCnde = results(resultsCoords).cnde;\n");
fprintf(FID,"\t\t\tCnp = results(resultsCoords).cnp;\n");
fprintf(FID,"\t\t\tCnq = results(resultsCoords).cnq;\n");
fprintf(FID,"\t\t\tCnr = results(resultsCoords).cnr;\n");
fprintf(FID,"\t\t\trCB_X = (results(resultsCoords).npX);\n");
fprintf(FID,"\t\t\trCB_X = 0.48 - rCB_X;\n\n");


fprintf(FID,"\t\telse\n\n"); % else


fprintf(FID,"\t\t\tstallFlag = 1;\n\n");

fprintf(FID,"\t\t\tCLa = 0;\n");
fprintf(FID,"\t\t\tCLb = 0;\n");
fprintf(FID,"\t\t\tCLde = 0;\n");
fprintf(FID,"\t\t\tCLp = 0;\n");
fprintf(FID,"\t\t\tCLq = 0;\n");
fprintf(FID,"\t\t\tCLr = 0;\n\n");

fprintf(FID,"\t\t\tCYa = 0;\n");
fprintf(FID,"\t\t\tCYb = 0;\n");
fprintf(FID,"\t\t\tCYde = 0;\n");
fprintf(FID,"\t\t\tCYp = 0;\n");
fprintf(FID,"\t\t\tCYq = 0;\n");
fprintf(FID,"\t\t\tCYr = 0;\n\n");

fprintf(FID,"\t\t\tCla = 0;\n");
fprintf(FID,"\t\t\tClb = 0;\n");
fprintf(FID,"\t\t\tClde = 0;\n");
fprintf(FID,"\t\t\tClp = 0;\n");
fprintf(FID,"\t\t\tClq = 0;\n");
fprintf(FID,"\t\t\tClr = 0;\n\n");

fprintf(FID,"\t\t\tCma = 0;\n");
fprintf(FID,"\t\t\tCmb = 0;\n");
fprintf(FID,"\t\t\tCmde = 0;\n");
fprintf(FID,"\t\t\tCmp = 0;\n");
fprintf(FID,"\t\t\tCmq = 0;\n");
fprintf(FID,"\t\t\tCmr = 0;\n\n");

fprintf(FID,"\t\t\tCna = 0;\n");
fprintf(FID,"\t\t\tCnb = 0;\n");
fprintf(FID,"\t\t\tCnde = 0;\n");
fprintf(FID,"\t\t\tCnp = 0;\n");
fprintf(FID,"\t\t\tCnq = 0;\n");
fprintf(FID,"\t\t\tCnr = 0;\n\n");

fprintf(FID,"\t\tend\n");
fprintf(FID,"\tend\n\n");

for i = 11:size(ExtraEQ_string_final_1,1)
    fprintf(FID,"\t%s;\n",ExtraEQ_string_final_1(i,:));
end
fprintf(FID,"\n");

fprintf(FID,"\tQ = 0.5 * 1.225 * windspeed * windspeed;\n\n");
    
fprintf(FID,"\tL = CL * Q * 0.4;\n");
fprintf(FID,"\tD = CD * Q * 0.4;\n");
fprintf(FID,"\tY = CY * Q * 0.4;\n");
fprintf(FID,"\tl = Cl * Q * 0.4 * 1.4;\n");
fprintf(FID,"\tm = Cm * Q * 0.4 * 0.3;\n");
fprintf(FID,"\tn = Cn * Q * 0.4 * 1.4;\n\n");

for i = 1:size(EQ_string_final_1,1)
    fprintf(FID,"\t%s;\n",EQ_string_final_1(i,:));
end
fprintf(FID,"\n");

fprintf(FID,"\tderp(callNum,:) = [t xdot];\n");
fprintf(FID,"\therp(callNum,:) = [t alpha beta windspeed p q r d_tether Tx Ty Tz];\n");
fprintf(FID,"\taeroForces(callNum,:) = [t CL CD CY Cl Cm Cn L D Y l m n];\n\n");

fprintf(FID,"\txdot=xdot';\n\n");
%fprintf(FID,"xdot\nsize(xdot)\n\n");



fprintf(FID,"end\n\n\n");

save sailModelCurrent_debug1.mat;