%% DESCRIPTION OF DERIVATION
    % O = INERTIAL FRAME, ORIGIN 0, X NORTH, Y OUT RHR, Z NORMAL TO GROUND
    %       SURFACE, POINTING UP 
    % B = BODY FRAME, ORIGIN CM, X FOWARD, Y UP ALONG WING, Z OUT RHR
    % Q = GEOMETRY FRAME, ORIGIN FRONT TIP OF BOOM, X BACK, Y UP ALONG ...
    %       WING, Z OUT RHR
    % S = STABILITY FRAME, ORIGIN n/a, NEGATIVE ALPHA ROTATION ABOUT Y_Q
    % W = WIND FRAME, ORIGIN n/a, POSITIVE BETA ROTATION ABOUT Z_S
    
    



clear all;
clc;

syms    rGO_x_O rGO_y_O rGO_z_O ...     % balloon position vector
        ...
        rBO_x_B(t) rBO_y_B(t) rBO_z_B(t) ...     % sail positions vectors
        ...
        ...
        vWO_x_O vWO_y_O vWO_z_O ...     % IRF wind velocity
        ...
        ...
        ...
        phi(t) theta(t) psi(t) ...      % angles for BcO
        alpha beta windspeed de...      % aeroforce stuff
        Sref Bref Cref ...              % more aeroforce stuff
        k_tether b_tether lo_tether ... % tether stuff
        mT g rho ...                        %other stuff
        xref_Q yref_Q zref_Q ...        % AVL stuff 
        xNP_Q yNP_Q zNP_Q...            % more AVL stuff
        ...
        ...
        ...
        Ixx Ixy Ixz Iyy Iyz Izz ...
        ...
        ...
        ...
        cL_a cL_b cL_de cL_p cL_q cL_r ...
        cD_tot...
        cY_a cY_b cY_de cY_p cY_q cY_r ...
        cl_a cl_b cl_de cl_p cl_q cl_r ...
        cm_a cm_b cm_de cm_p cm_q cm_r ...
        cn_a cn_b cn_de cn_p cn_q cn_r ...
        CL CD CY Cl Cm Cn...
        ...
        ...
        Tx Ty Tz ...
        ;
    
%% DERIVE BcO and OcB ( body-IRF, Y-Z-X, THETA-PSI-PHI ROTATION SEQUENCE)
Rx_phi = [
    1   0                   0
    0   cos(phi(t))         sin(phi(t))
    0   -sin(phi(t))        cos(phi(t))
    ];

Rz_psi = [
    cos(psi(t))       sin(psi(t))       0
    -sin(psi(t))      cos(psi(t))       0
    0                   0               1
    ];

Ry_theta = [
    cos(theta(t))     0   -sin(theta(t))
    0                 1   0
    sin(theta(t))     0   cos(theta(t))
    ];

BcO = simplify(Rx_phi * Rz_psi * Ry_theta);
OcB = transpose(BcO);  


%% Deriv QcB and BcQ (standard body to geometry frame 180 degree about Y axis)

Ry_oneEighty = [
    -1  0   0
    0   1   0
    0   0   -1
    ];

QcB = Ry_oneEighty;
BcQ = Ry_oneEighty;


%% Derive ScQ (standard body frame to stability frame, Ry(-alpha) 

Ry_negAlpha = [
    cos(alpha)     0   sin(alpha)
    0              1   0
    -sin(alpha)    0   cos(alpha)
    ];

ScQ = Ry_negAlpha;
QcS = transpose(ScQ);


%% Derive WcS (stability frame to wind frame, (Rz(beta)) 

Rz_beta = [
    cos(beta)       sin(beta)       0
    -sin(beta)      cos(beta)       0
    0                   0           1
    ];

WcS = Rz_beta;
ScW = transpose(WcS);

%% Derive all possible combos

%OcO *
%BcO
 QcO = simplify(QcB * BcO); 
 ScO = simplify(ScQ * QcO);
 WcO = simplify(WcS * ScO);
 
%OcB
%BcB *
%QcB
 ScB = simplify(ScQ * QcB);
 WcB = simplify(WcS * ScB);
 
 OcQ = transpose(QcO);
%BcQ
%QcQ *
%ScQ
 WcQ = simplify(WcS * ScQ);


 OcS = transpose(ScO); 
 BcS = transpose(ScB);
%QcS
%ScS *
%WcS
 
 OcW = transpose(WcO);
 BcW = transpose(WcB);
 QcW = transpose(WcQ);
%ScW
%WcW * 




%% DEBUG TO CHECK ROTATION STUFFS
% 
% BcO
% QcO
% ScO
% WcO
% 
% OcB
% QcB
% ScB
% WcB
% 
% OcQ
% BcQ
% ScQ
% WcQ
%  
% OcS
% BcS
% QcS
% WcS
% 
% OcW
% BcW
% QcW
% ScW
 



%% Derive some body vectors from AVL stuff

rCQ_Q = [xNP_Q yNP_Q zNP_Q];
rBQ_Q = [xref_Q yref_Q zref_Q];
rPQ_Q = [xref_Q 0 0];

rCB_Q = rCQ_Q - rBQ_Q;
rPB_Q = rPQ_Q - rBQ_Q;

rCB_B = simplify(transpose(BcQ * transpose(rCB_Q)));
rPB_B = simplify(transpose(BcQ * transpose(rPB_Q)));




%% Moment of inertia about the CG

Iyx = Ixy; % make certain elements equal to ensure symmetric matrix
Izx = Ixz;
Izy = Iyz;
    
I_CM_Q = [          % values are assigned from the geometric body frame Q
    Ixx Ixy Ixz
    Iyx Iyy Iyz
    Izx Izy Izz
    ];

I_CM_B = BcQ * I_CM_Q * QcB; % rotate the matrix from Q to B (standard body)




%% DERIVE THE TERMS FOR O_omega_B_B AND O_alpha_B

OcB_dot = simplify(diff(OcB,t));

omega_x_B = [0 0 1]*BcO*OcB_dot*[0;1;0];
omega_y_B = [1 0 0]*BcO*OcB_dot*[0;0;1];
omega_z_B = [0 1 0]*BcO*OcB_dot*[1;0;0];

% ***************** O_omega_B_B and O_alpha_B *****************************
O_omega_B_B = simplify([omega_x_B omega_y_B omega_z_B]);
O_alpha_B = simplify(diff(O_omega_B_B));
% *************************************************************************




%% DERIVE EXPRESSION FOR O_v_BO_B and O_a_BO_B

rBO_B = [rBO_x_B(t) rBO_y_B(t) rBO_z_B(t)];

% 1st transport theorem
% *************************** O_v_BO_B ************************************
O_v_BO_B = simplify( ...
    diff(rBO_B,t) + ...
    cross(O_omega_B_B ,rBO_B) ... 
    );
% *************************************************************************


% 2nd transport theorem
% *************************** O_a_BO_B ************************************
O_a_BO_B = simplify( ...
    diff(rBO_B,t,2) + ...
    (2 * cross(O_omega_B_B , diff(rBO_B,t))) + ...
    cross(O_alpha_B , rBO_B) + ...
    cross(O_omega_B_B , cross(O_omega_B_B , rBO_B)) ...
    );
% *************************************************************************

rBO_O = simplify(transpose(OcB * transpose(rBO_B)));
O_v_BO_O = simplify(transpose(OcB * transpose(O_v_BO_B)));

%% DERIVE EXPRESSION FOR O_O_h_B_B and its O_derivative

% *************************** O_O_h_B_B ***********************************
O_O_h_B_B = simplify(transpose((I_CM_B * transpose(O_omega_B_B))));
% *************************************************************************

% 1st transport theorem
% *********************** Oddt_O_O_h_B_B **********************************
Oddt_O_O_h_B_B = simplify( ...
    diff(O_O_h_B_B,t) + ...
    cross(O_omega_B_B , O_O_h_B_B) ...
    );
% *************************************************************************


%% DERIVE EXPRESSIONS FOR alpha AND beta AND vel (AERO)

O_v_WO_O = [vWO_x_O vWO_y_O vWO_z_O];

O_v_WO_B = transpose((BcO * transpose(O_v_WO_O)));


% ************************* O_v_WB_B **************************************
O_v_WB_B = (O_v_WO_B - O_v_BO_B);
O_v_WB_Q = transpose(QcB * transpose(O_v_WB_B));
% *************************************************************************

jQ_proj_O_v_WB_Q = [O_v_WB_Q(1) 0           O_v_WB_Q(3)];
kG_proj_O_v_WB_Q = [O_v_WB_Q(1) O_v_WB_Q(2) 0];

% *********************** alpha AND beta AND windspeed ********************
alpha_eq =  ...
    simplify(atan2( ...
    jQ_proj_O_v_WB_Q(3) ,  jQ_proj_O_v_WB_Q(1) ...
    ));

beta_eq = ...
    simplify(atan2( ...
    kG_proj_O_v_WB_Q(2) , kG_proj_O_v_WB_Q(1) ...
    ));

windspeed_EQ = (norm(O_v_WB_B));
% *************************************************************************




%% DERIVE EXPRESSIONS FOR AERO FORCE/MOMENT COEFFICIENTS

O_omega_B_Q = simplify(transpose(QcB * transpose(O_omega_B_B)));

% since the original stability derivs are applied in the stability frame,
%   the p,q,r values need to be rotated from the B (standard body) to the 
%   Q (geometric body) frame.

CL_S = ( ...
    (cL_a* alpha) + (cL_b * beta) + (cL_de * de) + (cL_p * O_omega_B_Q(1)) ...
    + (cL_q * O_omega_B_Q(2)) + (cL_r * O_omega_B_Q(3)) ...
    );

CD_S = cD_tot;

CY_S = ( ...
    (cY_a * alpha) + (cY_b * beta) + (cY_de * de) + (cY_p * O_omega_B_Q(1)) ...
    + (cY_q * O_omega_B_Q(2)) + (cY_r * O_omega_B_Q(3)) ...
    );

Cl_S = ( ...
    (cl_a* alpha) + (cl_b * beta) + (cl_de * de) + (cl_p * O_omega_B_Q(1)) ...
    + (cl_q * O_omega_B_Q(2)) + (cl_r * O_omega_B_Q(3)) ...
    );

Cm_S = ( ...
    (cm_a * alpha) + (cm_b * beta) + (cm_de * de) + (cm_p * O_omega_B_Q(1)) ...
    + (cm_q * O_omega_B_Q(2)) + (cm_r * O_omega_B_Q(3)) ...
    );

Cn_S = ( ...
    (cn_a * alpha) + (cn_b * beta) + (cn_de * de) + (cn_p * O_omega_B_Q(1)) ...
    + (cn_q * O_omega_B_Q(2)) + (cn_r * O_omega_B_Q(3)) ...
    );

% rotate stability derivatives into wind frame
CF_S = [CD CY CL];
CM_S = [Cl Cm Cn];

CF_W = transpose(WcS * transpose(CF_S)); %aero forces, wind frame
CM_W = transpose(WcS * transpose(CM_S)); %aero moments, wind frame

%% DERIVE EXPRESSION FOR Q

Q = (0.5 * rho * windspeed * windspeed);

%% DERIVE EXPRESSIONS FOR AERO FORCES AND MOMENTS

L_z_W = (CF_W(3) * Q * Sref);

D_x_W = (CF_W(1) * Q * Sref);

Y_y_W = (CF_W(2) * Q * Sref);
 
l_x_W = (CM_W(1) * Q * Sref * Bref);

m_y_W = (CM_W(2) * Q * Sref * Cref);

n_z_W = (CM_W(3) * Q * Sref * Bref);

AeroForces_W = [D_x_W Y_y_W L_z_W];   % AeroForces in wind frame
AeroMoments_W = [l_x_W m_y_W n_z_W];  % AeroMoments in wind frame

% AeroForces in standard body frame
AeroForces_B = simplify(transpose(BcW * transpose(AeroForces_W)));
AeroForces_O = simplify(transpose(OcB * transpose(AeroForces_B)));

% AeroMoments in standard body frame
AeroMoments_B = simplify(transpose(BcW * transpose(AeroMoments_W)));
AeroMoments_O = simplify(transpose(OcB * transpose(AeroMoments_B)));

% Moments due to AeroForces in standard body frame
aeroForces_tau_B = simplify(cross(AeroForces_B, rCB_B));
% *************************************************************************



%% DERIVE FORCE AND MOMENT VECTOR FOR TETHER

rGO_O = [rGO_x_O rGO_y_O rGO_z_O];

rGO_B = simplify(transpose(BcO*transpose(rGO_O)));
rGP_B = (rGO_B - rBO_B - rPB_B);

O_v_GP_B = ( ...
    diff(rGP_B,t) + ...
    cross(O_omega_B_B ,rGP_B) ... 
    );

lcurrent_tether = simplify(norm(rGP_B));
vcurrent_tether = simplify(diff(lcurrent_tether,t));
dl_tether = lcurrent_tether - lo_tether;
dl_tether_eq = dl_tether;

normT = simplify((k_tether * dl_tether) + (b_tether * vcurrent_tether));


T_eq = simplify(normT * (rGP_B / lcurrent_tether));

T_B = [Tx Ty Tz];

T_O = simplify(transpose(OcB * transpose(T_B)));

tau_T_B = simplify(cross(T_B , rPB_B));
% *************************************************************************



%% DERIVE GRAVITY VECTOR

Fg_z_O = mT * g;

Fg_O = [0 0 Fg_z_O];

Fg_B = simplify(transpose(BcO * transpose(Fg_O)));
% *************************************************************************

%% DERIVE EXPRESSIONS FOR F = MA AND ODDT(H) = TAU

F_over_M = ((Fg_B + T_B + AeroForces_B) / mT);

tauTot_B = (AeroMoments_B + ...
    aeroForces_tau_B + tau_T_B);

linEQ = O_a_BO_B == F_over_M;
angEQ = Oddt_O_O_h_B_B == tauTot_B;

EQ_unsolved = [linEQ , angEQ];

symvar(EQ_unsolved)
% *************************************************************************




%% SUBSTITUTE OUT TIME DERIVATIVES AND OTHER CONSTANTS
syms rBO_X rBO_Y rBO_Z ... 
    rBO_X_d rBO_Y_d rBO_Z_d ...
    rBO_X_d_d rBO_Y_d_d rBO_Z_d_d ...
    ...
    ...
    vWO_X vWO_Y vWO_Z ...
    ...
    ...
    ... % for the rotation matrices
    ph th ps ...
    ph_d th_d ps_d ...
    ph_d_d th_d_d ps_d_d ...
% *************************************************************************
% *************************************************************************
% *************************************************************************

regVect = [ ...
    str2sym('rGO_x_O') str2sym('rGO_y_O') str2sym('rGO_z_O') ...
    ...
    str2sym('rBO_x_B(t)') str2sym('rBO_y_B(t)') str2sym('rBO_z_B(t)') ...
    str2sym('diff(rBO_x_B(t), t)') str2sym('diff(rBO_y_B(t), t)') str2sym('diff(rBO_z_B(t), t)') ...
    str2sym('diff(rBO_x_B(t), t, t)') str2sym('diff(rBO_y_B(t), t, t)') str2sym('diff(rBO_z_B(t), t, t)') ...
    ...
    ...
    str2sym('vWO_x_O') str2sym('vWO_y_O') str2sym('vWO_z_O') ... %except this one, its a velocity
    ...
    ...
    ... % for the rotation matrices
    str2sym('phi(t)') str2sym('theta(t)') str2sym('psi(t)') ...
    str2sym('diff(phi(t), t)') str2sym('diff(theta(t), t)') str2sym('diff(psi(t), t)') ...
    str2sym('diff(phi(t), t, t)') str2sym('diff(theta(t), t, t)') str2sym('diff(psi(t), t, t)') ...
    ...
    str2sym('Sref') str2sym('Bref') str2sym('Cref') ...
    str2sym('k_tether') str2sym('b_tether') str2sym('lo_tether') ...
    str2sym('mT') str2sym('g') str2sym('rho') ...
    str2sym('xref_Q') str2sym('yref_Q') str2sym('zref_Q') ...       
    str2sym('xNP_Q') str2sym('yNP_Q') str2sym('zNP_Q') ... 
    ...
    ...
    ... % for moment of inertia
    str2sym('Ixx') str2sym('Ixy') ...
    str2sym('Ixz') str2sym('Iyy') ...
    str2sym('Iyz') str2sym('Izz') ...
    ...
    ...
    ... % lift and moment coefficients
    str2sym('cL_a') str2sym('cL_b') str2sym('cL_de') str2sym('cL_p') str2sym('cL_q') str2sym('cL_r') ...
    str2sym('cD_tot') ...
    str2sym('cY_a') str2sym('cY_b') str2sym('cY_de') str2sym('cY_p') str2sym('cY_q') str2sym('cY_r') ...
    str2sym('cl_a') str2sym('cl_b') str2sym('cl_de') str2sym('cl_p') str2sym('cl_q') str2sym('cl_r') ...
    str2sym('cm_a') str2sym('cm_b') str2sym('cm_de') str2sym('cm_p') str2sym('cm_q') str2sym('cm_r') ...
    str2sym('cn_a') str2sym('cn_b') str2sym('cn_de') str2sym('cn_p') str2sym('cn_q') str2sym('cn_r') ...
    ...
    ];
% *************************************************************************
% *************************************************************************
% *************************************************************************
subVect = [ ...
    0 0 152.4 ...
    ...
    str2sym('rBO_X') str2sym('rBO_Y') str2sym('rBO_Z') ...
    str2sym('rBO_X_d') str2sym('rBO_Y_d') str2sym('rBO_Z_d') ...
    str2sym('rBO_X_d_d') str2sym('rBO_Y_d_d') str2sym('rBO_Z_d_d') ...
    ...
    ...
    str2sym('vWO_X') str2sym('vWO_Y') str2sym('vWO_Z') ...
    ...
    ...
    ... % for the rotation matrices
    str2sym('ph') str2sym('th') str2sym('ps') ...
    str2sym('ph_d') str2sym('th_d') str2sym('ps_d') ...
    str2sym('ph_d_d') str2sym('th_d_d') str2sym('ps_d_d') ...
    ...
    0.4 1.4 0.3 ...                 %Sref Bref Cref
    37.5 0.3 75.6791544 ...         %k_tether, b_tether, lo_tether
    1.991 -9.81 1.225...            % mT g rho
    0.58123 -0.40236 0.00063 ...    % xref_Q yref_Q zref_Q
    str2sym('xNP_Q')  -.685 0 ...   % xNP_Q yNP_Q zNP_Q
    ...
    ...
    ... % for moment of inertia
    0.72156870707000009268483609048417 -0.12767543784999998979223789774551 ...
    -0.00083961430000000002258492282081193 0.39416475912999998643115873164788 ...
    0.0013643208799999999823737706350357 1.1133577976099999773396120872349 ...
    ...
    ...
    ... % lift and moment coefficients (doesn't sub, but yea
    str2sym('cL_a') str2sym('cL_b') str2sym('cL_de') str2sym('cL_p') str2sym('cL_q') str2sym('cL_r') ...
    str2sym('cD_tot') ...
    str2sym('cY_a') str2sym('cY_b') str2sym('cY_de') str2sym('cY_p') str2sym('cY_q') str2sym('cY_r') ...
    str2sym('cl_a') str2sym('cl_b') str2sym('cl_de') str2sym('cl_p') str2sym('cl_q') str2sym('cl_r') ...
    str2sym('cm_a') str2sym('cm_b') str2sym('cm_de') str2sym('cm_p') str2sym('cm_q') str2sym('cm_r') ...
    str2sym('cn_a') str2sym('cn_b') str2sym('cn_de') str2sym('cn_p') str2sym('cn_q') str2sym('cn_r') ...
    ...
    ];
% *************************************************************************

    EQ_unsolved_subbed_1 = subs(EQ_unsolved,regVect,subVect);
    alpha_subbed_1 = subs(alpha_eq,regVect,subVect);
    beta_subbed_1 = subs(beta_eq,regVect,subVect);
    PQR_subbed_1 = subs(O_omega_B_B,regVect,subVect);
    windspeed_subbed_1 = subs(windspeed_EQ,regVect,subVect);
    dl_tether_subbed_1 = subs(dl_tether_eq,regVect,subVect);
    T_subbed_1 = subs(T_eq,regVect,subVect);
    CL_subbed_1 = subs(CL_S,regVect,subVect);
    CD_subbed_1 = subs(CD_S,regVect,subVect);
    CY_subbed_1 = subs(CY_S,regVect,subVect);
    Cl_subbed_1 = subs(Cl_S,regVect,subVect);
    Cm_subbed_1 = subs(Cm_S,regVect,subVect);
    Cn_subbed_1 = subs(Cn_S,regVect,subVect);
    rBO_O_subbed_1 = subs(rBO_O,regVect,subVect);
    O_v_BO_O_subbed_1 = subs(O_v_BO_O,regVect,subVect);
    

% *************************************************************************
% *************************************************************************


%% now solve for state derivatives and extra stuff 

EQ_solved_unsimple_1 = solve(EQ_unsolved_subbed_1,[rBO_X_d_d,rBO_Y_d_d,rBO_Z_d_d,ph_d_d,th_d_d,ps_d_d]);

EQ_solve_simple_1(1) = simplify(EQ_solved_unsimple_1.rBO_X_d_d);
EQ_solve_simple_1(2) = simplify(EQ_solved_unsimple_1.rBO_Y_d_d);
EQ_solve_simple_1(3) = simplify(EQ_solved_unsimple_1.rBO_Z_d_d);
EQ_solve_simple_1(4) = simplify(EQ_solved_unsimple_1.ph_d_d);
EQ_solve_simple_1(5) = simplify(EQ_solved_unsimple_1.th_d_d);
EQ_solve_simple_1(6) = simplify(EQ_solved_unsimple_1.ps_d_d);

% *************************************************************************

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
rBO_O_simple_1 = simplify(rBO_O_subbed_1);
O_v_BO_O_simple_1 = simplify(O_v_BO_O_subbed_1);

% *************************************************************************

ExtraEQ_simple_1 = [ ...
    alpha_simple_1      beta_simple_1           windspeed_simple_1 ...
    PQR_simple_1        dl_tether_simple_1      T_simple_1...
    CL_simple_1         CD_simple_1             CY_simple_1 ...
    Cl_simple_1         Cm_simple_1             Cn_simple_1 ...
    rBO_O_simple_1      O_v_BO_O_simple_1 ...
    ];
% *************************************************************************
% *************************************************************************




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
    "rBO_x_O"
    "rBO_y_O"
    "rBO_z_O"
    "vBO_x_O"
    "vBO_y_O"
    "vBO_z_O"
    ];

EQ_solve_simple_1 = subs(EQ_solve_simple_1,regVect,subVect);
ExtraEQ_simple_1 = subs(ExtraEQ_simple_1,regVect,subVect);

EQ_solve_final_1 = [ ...
    str2sym('x(7)') str2sym('x(8)') str2sym('x(9)') ...
    str2sym('x(10)') str2sym('x(11)') str2sym('x(12)') ...
    EQ_solve_simple_1 ...
    ];
    
transpose(EqVect)
transpose(EQ_solve_final_1)

EQ_string_final_1 = append(string(transpose(EqVect))," = ",string( ...
    transpose(EQ_solve_final_1)));
ExtraEQ_string_final_1 = append(ExtaEqVect," = ",string( ...
    transpose(ExtraEQ_simple_1)));

% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************
%% WRITE THE M FILE

fileName = 'SailFunc.m';
FID = fopen(fileName,'w');

fprintf(FID,"function [xdot] = SailFunc(t,x)\n\n");

fprintf(FID,"\tglobal otherstuff derp herp aeroForces posVelo_O\n");
fprintf(FID,"\tpersistent currentConfig aeroTriggers aeroTriggersLast settings results ...\n");
fprintf(FID,"\tcL_a cL_b cL_de cL_p cL_q cL_r ...\n");
fprintf(FID,"\tcD_tot...\n");
fprintf(FID,"\tcY_a cY_b cY_de cY_p cY_q cY_r ...\n");
fprintf(FID,"\tcl_a cl_b cl_de cl_p cl_q cl_r ...\n");
fprintf(FID,"\tcm_a cm_b cm_de cm_p cm_q cm_r ...\n");
fprintf(FID,"\tcn_a cn_b cn_de cn_p cn_q cn_r ...\n");
fprintf(FID,"\tvWO_X vWO_Y vWO_Z xNP_Q de...\n");
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

fprintf(FID,"\tif alpha > pi()\n");
fprintf(FID,"\t\talpha = -1*((2*pi()) - alpha);\n");
fprintf(FID,"\tend\n\n");

fprintf(FID,"\tif beta > pi()\n");
fprintf(FID,"\t\tbeta = -1*((2*pi()) - beta);\n");
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

fprintf(FID,"%*********************************************************\n");
fprintf(FID,"\t\t\tcL_a = results(resultsCoords).cLa;\n");
fprintf(FID,"\t\t\tcL_b = results(resultsCoords).cLb;\n");
fprintf(FID,"\t\t\tcL_de = results(resultsCoords).cLde;\n");
fprintf(FID,"\t\t\tcL_p = results(resultsCoords).cLp;\n");
fprintf(FID,"\t\t\tcL_q = results(resultsCoords).cLq;\n");
fprintf(FID,"\t\t\tcL_r = results(resultsCoords).cLr;\n\n");

fprintf(FID,"\t\t\tcD_tot = results(resultsCoords).cDtot;\n\n");

fprintf(FID,"\t\t\tcY_a = results(resultsCoords).cYa;\n");
fprintf(FID,"\t\t\tcY_b = results(resultsCoords).cYb;\n");
fprintf(FID,"\t\t\tcY_de = results(resultsCoords).cYde;\n");
fprintf(FID,"\t\t\tcY_p = results(resultsCoords).cYp;\n");
fprintf(FID,"\t\t\tcY_q = results(resultsCoords).cYq;\n");
fprintf(FID,"\t\t\tcY_r = results(resultsCoords).cYr;\n\n");

fprintf(FID,"\t\t\tcl_a = results(resultsCoords).cla;\n");
fprintf(FID,"\t\t\tcl_b = results(resultsCoords).clb;\n");
fprintf(FID,"\t\t\tcl_de = results(resultsCoords).clde;\n");
fprintf(FID,"\t\t\tcl_p = results(resultsCoords).clp;\n");
fprintf(FID,"\t\t\tcl_q = results(resultsCoords).clq;\n");
fprintf(FID,"\t\t\tcl_r = results(resultsCoords).clr;\n\n");

fprintf(FID,"\t\t\tcm_a = results(resultsCoords).cma;\n");
fprintf(FID,"\t\t\tcm_b = results(resultsCoords).cmb;\n");
fprintf(FID,"\t\t\tcm_de = results(resultsCoords).cmde;\n");
fprintf(FID,"\t\t\tcm_p = results(resultsCoords).cmp;\n");
fprintf(FID,"\t\t\tcm_q = results(resultsCoords).cmq;\n");
fprintf(FID,"\t\t\tcm_r = results(resultsCoords).cmr;\n\n");

fprintf(FID,"\t\t\tcn_a = results(resultsCoords).cna;\n");
fprintf(FID,"\t\t\tcn_b = results(resultsCoords).cnb;\n");
fprintf(FID,"\t\t\tcn_de = results(resultsCoords).cnde;\n");
fprintf(FID,"\t\t\tcn_p = results(resultsCoords).cnp;\n");
fprintf(FID,"\t\t\tcn_q = results(resultsCoords).cnq;\n");
fprintf(FID,"\t\t\tcn_r = results(resultsCoords).cnr;\n");
fprintf(FID,"\t\t\txNP_Q = (results(resultsCoords).npX);\n\n");


fprintf(FID,"%*********************************************************\n");

fprintf(FID,"\t\t\tcL_a = 4.089139;\n");
fprintf(FID,"\t\t\tcL_b = 0;\n");
fprintf(FID,"\t\t\tcL_de = 0.011114;\n");
fprintf(FID,"\t\t\tcL_p = -1.470212;\n");
fprintf(FID,"\t\t\tcL_q = 6.066054;\n");
fprintf(FID,"\t\t\tcL_r = 0;\n\n");

fprintf(FID,"\t\t\tcD_tot = (1.96*(abs(alpha)/(pi()/2))) + 0.025;\n\n");

fprintf(FID,"\t\t\tcY_a = 0;\n");
fprintf(FID,"\t\t\tcY_b = -0.025;\n");
fprintf(FID,"\t\t\tcY_de = 0;\n");
fprintf(FID,"\t\t\tcY_p = 0;\n");
fprintf(FID,"\t\t\tcY_q = 0;\n");
fprintf(FID,"\t\t\tcY_r = 0;\n\n");

fprintf(FID,"\t\t\tcl_a = 0.709959;\n");
fprintf(FID,"\t\t\tcl_b = 0;\n");
fprintf(FID,"\t\t\tcl_de = -0.001162;\n");
fprintf(FID,"\t\t\tcl_p = -0.672059;\n");
fprintf(FID,"\t\t\tcl_q = 0.018717;\n");
fprintf(FID,"\t\t\tcl_r = 0;\n\n");

fprintf(FID,"\t\t\tcm_a = -0.397802;\n");
fprintf(FID,"\t\t\tcm_b = 0;\n");
fprintf(FID,"\t\t\tcm_de = -0.031231;\n");
fprintf(FID,"\t\t\tcm_p = -0.385274;\n");
fprintf(FID,"\t\t\tcm_q = -11.274178;\n");
fprintf(FID,"\t\t\tcm_r = 0;\n\n");

fprintf(FID,"\t\t\tcn_a = 0;\n");
fprintf(FID,"\t\t\tcn_b = 0;\n");
fprintf(FID,"\t\t\tcn_de = 0;\n");
fprintf(FID,"\t\t\tcn_p = 0;\n");
fprintf(FID,"\t\t\tcn_q = 0;\n");
fprintf(FID,"\t\t\tcn_r = 0;\n");

fprintf(FID,"\t\t\txNP_Q = 0.609185;\n\n");

fprintf(FID,"%*********************************************************\n");
fprintf(FID,"%*********************************************************\n");

fprintf(FID,"\t\telse\n\n"); % else

fprintf(FID,"\t\t\tstallFlag = 1;\n\n");

fprintf(FID,"\t\t\tcL_a = 0;\n");
fprintf(FID,"\t\t\tcL_b = 0;\n");
fprintf(FID,"\t\t\tcL_de = 0;\n");
fprintf(FID,"\t\t\tcL_p = 0;\n");
fprintf(FID,"\t\t\tcL_q = 0;\n");
fprintf(FID,"\t\t\tcL_r = 0;\n\n");

fprintf(FID,"\t\t\tcD_tot = (1.96*(abs(alpha)/(pi()/2))) + 0.025;\n\n");

fprintf(FID,"\t\t\tcY_a = 0;\n");
fprintf(FID,"\t\t\tcY_b = 0;\n");
fprintf(FID,"\t\t\tcY_de = 0;\n");
fprintf(FID,"\t\t\tcY_p = 0;\n");
fprintf(FID,"\t\t\tcY_q = 0;\n");
fprintf(FID,"\t\t\tcY_r = 0;\n\n");

fprintf(FID,"\t\t\tcl_a = 0;\n");
fprintf(FID,"\t\t\tcl_b = 0;\n");
fprintf(FID,"\t\t\tcl_de = 0;\n");
fprintf(FID,"\t\t\tcl_p = 0;\n");
fprintf(FID,"\t\t\tcl_q = 0;\n");
fprintf(FID,"\t\t\tcl_r = 0;\n\n");

fprintf(FID,"\t\t\tcm_a = 0;\n");
fprintf(FID,"\t\t\tcm_b = 0;\n");
fprintf(FID,"\t\t\tcm_de = 0;\n");
fprintf(FID,"\t\t\tcm_p = 0;\n");
fprintf(FID,"\t\t\tcm_q = 0;\n");
fprintf(FID,"\t\t\tcm_r = 0;\n\n");

fprintf(FID,"\t\t\tcn_a = 0;\n");
fprintf(FID,"\t\t\tcn_b = 0;\n");
fprintf(FID,"\t\t\tcn_de = 0;\n");
fprintf(FID,"\t\t\tcn_p = 0;\n");
fprintf(FID,"\t\t\tcn_q = 0;\n");
fprintf(FID,"\t\t\tcn_r = 0;\n");

fprintf(FID,"\t\t\txNP_Q =  0.609185;\n\n");

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
fprintf(FID,"\taeroForces(callNum,:) = [t CL CD CY Cl Cm Cn L D Y l m n];\n");
fprintf(FID,"\tposVelo_O(callNum,:) = [t rBO_x_O rBO_y_O rBO_z_O vBO_x_O vBO_y_O vBO_z_O];\n\n");
fprintf(FID,"\txdot=xdot';\n\n");


fprintf(FID,"end\n\n\n");

save sailModelCurrent_debug1.mat;