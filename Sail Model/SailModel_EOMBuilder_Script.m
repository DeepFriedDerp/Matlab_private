%% Settings

clearErthang = 1; % clears all stuff

if clearErthang
    clear all;
end

%% Setup

syms rBO_x(t) rBO_y(t) rBO_z(t) ... % some position vectors
    rCB_x(t) rCB_y(t) rCB_z(t) ...
    rPB_x(t) rPB_y(t) rPB_z(t) ...
    vWO_x(t) vWO_y(t) vWO_z(t) ... %except this one, its a velocity
    rGO_x(t) rGO_y(t) rGO_z(t) ...
    ...
    ... % for the rotation matrices
    phi(t) theta(t) psi(t) ...
    ...
    ... % for moment of inertia
    Ixx(t) Ixy(t) Ixz(t) Iyy(t) Iyz(t) Izz(t) ...
    ...
    ... % lift,moment,and gravity force leftover vars, to make sure math works
    L_x(t) L_y(t) ...
    D_y(t) D_z(t) ...
    Y_x(t) Y_z(t) ...
    l_y(t) l_z(t) ...
    m_x(t) m_z(t) ...
    n_x(t) n_y(t) ...
    Fg_x(t) Fg_y(t) ...
    ...
    ... % some general constants
    k_tether(t) lo_tether(t) mT(t) g(t) rho(t)...
    Sref(t) Bref(t) Cref(t) ...
    ...
    ... % lift and moment coefficients
    cLa(t) cLb(t) cLde(t) cLp(t) cLq(t) cLr(t) ...
    cDtot(t) ...
    cYa(t) cYb(t) cYde(t) cYp(t) cYq(t) cYr(t) ...
    cla(t) clb(t) clde(t) clp(t) clq(t) clr(t) ...
    cma(t) cmb(t) cmde(t) cmp(t) cmq(t) cmr(t) ...
    cna(t) cnb(t) cnde(t) cnp(t) cnq(t) cnr(t) ...
    ...
    ... % de
    de ...
    ;

rBO_B = [rBO_x(t) rBO_y(t) rBO_z(t)];
rCB_B = [rCB_x(t) rCB_y(t) rCB_z(t)];
rPB_B = [rPB_x(t) rPB_y(t) rPB_z(t)];
O_v_WO_O = [vWO_x(t) vWO_y(t) vWO_z(t)];
rGO_O = [rGO_x(t) rGO_y(t) rGO_z(t)];

% C = [C_x C_y C_z];
% D = [D_x D_y D_z];
% Y = [Y_x Y_y Y_z];
% l = [l_x l_y l_z ];
% m = [m_x m_y m_z];
% n = [n_x n_y n_z];

I_B = [
    Ixx(t) Ixy(t) Ixz(t)
    Ixy(t) Iyy(t) Iyz(t)
    Ixz(t) Iyz(t) Izz(t)
    ];


%% DERIVE THE ROTATION MATRIX (Y-Z-X, THETA-PSI-PHI ROTATION SEQUENCE)
Rx_phi = [
    1   0               0
    0   cos(phi(t))     sin(phi(t))
    0   -sin(phi(t))    cos(phi(t))
    ];

Rz_psi = [
    cos(psi(t))     sin(phi(t))    0
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
alpha = ( ...
    acos( ...
    (jB_proj_O_v_WB_B * [1; 0; 0]) ...
    ) ...
    );

beta = ( ...
    acos( ...
    (kB_proj_O_v_WB_B * [1; 0; 0]) ...
    ) ...
    );

windspeed = (norm(O_v_WB_B));
% *************************************************************************

%% DERIVE EXPRESSIONS FOR AERO FORCE/MOMENT COEFFICIENTS

CL = ( ...
    (cLa(t)* alpha) + (cLb(t) * beta) + (cLde(t) * de) + (cLp(t) * O_omega_B_B(1)) ...
    + (cLq(t) * O_omega_B_B(2)) + (cLr(t) * O_omega_B_B(3)) ...
    );

CD = cDtot(t);

CY = ( ...
    (cYa(t) * alpha) + (cYb(t) * beta) + (cYde(t) * de) + (cYp(t) * O_omega_B_B(1)) ...
    + (cYq(t) * O_omega_B_B(2)) + (cYr(t) * O_omega_B_B(3)) ...
    );

Cl = ( ...
    (cla(t)* alpha) + (clb(t) * beta) + (clde(t) * de) + (clp(t) * O_omega_B_B(1)) ...
    + (clq(t) * O_omega_B_B(2)) + (clr(t) * O_omega_B_B(3)) ...
    );

Cm = ( ...
    (cma(t) * alpha) + (cmb(t) * beta) + (cmde(t) * de) + (cmp(t) * O_omega_B_B(1)) ...
    + (cmq(t) * O_omega_B_B(2)) + (cmr(t) * O_omega_B_B(3)) ...
    );

Cn = ( ...
    (cna(t) * alpha) + (cnb(t) * beta) + (cnde(t) * de) + (cnp(t) * O_omega_B_B(1)) ...
    + (cnq(t) * O_omega_B_B(2)) + (cnr(t) * O_omega_B_B(3)) ...
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
L = [L_x(t) L_y(t) L_z(t)];

D = [D_x(t) D_y(t) D_z(t)];

Y = [Y_x(t) Y_y(t) Y_z(t)];

l = [l_x(t) l_y(t) l_z(t)];

m = [m_x(t) m_y(t) m_z(t)];

n = [n_x(t) n_y(t) n_z(t)];

% Now for the last few torques
tau_L = (cross(L , rCB_B));

tau_D = (cross(D , rCB_B));

tau_Y = (cross(Y , rCB_B));

%% DERIVE FORCE AND MOMENT VECTOR FOR TETHER

rGO_B = transpose((BcO*transpose(rGO_O)));
rGP_B = (rGO_B - rBO_B - rPB_B);

lcurrent_tether = norm(rGP_B);
dl_tether = lcurrent_tether - lo_tether;
sigmoidFnc = exp(1000000*dl_tether) / (1 + exp(1000000*dl_tether));

normT = (sigmoidFnc(t) * (k_tether(t) * dl_tether(t)));

T = (normT * (rGP_B / norm(rGP_B)));

tau_T = (cross(T , rPB_B));

%% DERIVE GRAVITY VECTOR

Fg_z = mT * g;

Fg_O = [Fg_x(t) Fg_y(t) Fg_z(t)];

Fg_B = transpose((BcO * transpose(Fg_O)));

%% DERIVE EXPRESSIONS FOR F = MA AND ODDT(H) = TAU

F_over_M = ((Fg_B + T + L + D + Y) / mT(t));

tauTot = (l + m + n + tau_L + tau_D + tau_Y + tau_T);

linEQ = O_a_BO_B == F_over_M;
angEQ = Oddt_O_O_h_B_B == tauTot;

EQ_unsolved = [linEQ , angEQ];

symvar(EQ_unsolved)


