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

%% INPUT SECTION
outputFolderName = "SailDerivPack";
simFuncName = 'SailFunc.m';
simModel_Name = 'simModel.mat';
simScriptName = 'SailSimScript.m';
B2O_ScriptName = 'vectorConvert_BtoO';
Q2O_ScriptName = 'vectorConvert_QtoO';
S2O_ScriptName = 'vectorConvert_StoO';
W2O_ScriptName = 'vectorConvert_WtoO';
leftovers_ScriptName = 'GenerateLeftovers';


%% INIT SYMS CONSTRUCTION
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
        CL_s CD_s CY_s Cl_s Cm_s Cn_s...
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

%% Stuff them all into a single matrix

rotationMatrix_Matrix(1,:,:) = BcO;
rotationMatrix_Matrix(2,:,:) = QcO;
rotationMatrix_Matrix(3,:,:) = ScO;
rotationMatrix_Matrix(4,:,:) = WcO;

rotationMatrix_Matrix(5,:,:) = OcB;
rotationMatrix_Matrix(6,:,:) = QcB;
rotationMatrix_Matrix(7,:,:) = ScB;
rotationMatrix_Matrix(8,:,:) = WcB;

rotationMatrix_Matrix(9,:,:) = OcQ;
rotationMatrix_Matrix(10,:,:) = BcQ;
rotationMatrix_Matrix(11,:,:) = ScQ;
rotationMatrix_Matrix(12,:,:) = WcQ;

rotationMatrix_Matrix(13,:,:) = OcS;
rotationMatrix_Matrix(14,:,:) = BcS;
rotationMatrix_Matrix(15,:,:) = QcS;
rotationMatrix_Matrix(16,:,:) = WcS;

rotationMatrix_Matrix(17,:,:) = OcW;
rotationMatrix_Matrix(18,:,:) = BcW;
rotationMatrix_Matrix(19,:,:) = QcW;
rotationMatrix_Matrix(20,:,:) = ScW;

rotationMatrix_Names(1,:) = 'BcO';
rotationMatrix_Names(2,:) = 'QcO';
rotationMatrix_Names(3,:) = 'ScO';
rotationMatrix_Names(4,:) = 'WcO';

rotationMatrix_Names(5,:) = 'OcB';
rotationMatrix_Names(6,:) = 'QcB';
rotationMatrix_Names(7,:) = 'ScB';
rotationMatrix_Names(8,:) = 'WcB';

rotationMatrix_Names(9,:) = 'OcQ';
rotationMatrix_Names(10,:) = 'BcQ';
rotationMatrix_Names(11,:) = 'ScQ';
rotationMatrix_Names(12,:) = 'WcQ';

rotationMatrix_Names(13,:) = 'OcS';
rotationMatrix_Names(14,:) = 'BcS';
rotationMatrix_Names(15,:) = 'QcS';
rotationMatrix_Names(16,:) = 'WcS';

rotationMatrix_Names(17,:) = 'OcW';
rotationMatrix_Names(18,:) = 'BcW';
rotationMatrix_Names(19,:) = 'QcW';
rotationMatrix_Names(20,:) = 'ScW';


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
rBQ_B = simplify(transpose(BcQ * transpose(rBQ_Q)));
rPQ_B = simplify(transpose(BcQ * transpose(rPQ_Q)));

nonEssential_eqns = transpose(rCB_B);
nonEssential_names = ["rCB_x_B" ; "rCB_y_B" ; "rCB_z_B"];

leftover_EQ = transpose(rPB_B);
leftover_NAME = ["rPB_x_B" ; "rPB_y_B" ; "rPB_z_B"];

[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rBQ_B(1),"rBQ_x_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rBQ_B(2),"rBQ_y_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rBQ_B(3),"rBQ_z_B",leftover_EQ,leftover_NAME);

[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rPQ_B(1),"rPQ_x_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rPQ_B(2),"rPQ_y_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rPQ_B(3),"rPQ_z_B",leftover_EQ,leftover_NAME);





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

jQ_proj_O_v_WB_Q = [O_v_WB_Q(1) 0 O_v_WB_Q(3)];
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

other_Eqns = alpha_eq;
other_names = "alpha";

[other_Eqns, other_names] = addEquation_to_eqnVect(...
    beta_eq,"beta",other_Eqns, ...
    other_names);
[other_Eqns, other_names] = addEquation_to_eqnVect(...
    windspeed_EQ,"windspeed",other_Eqns, ...
    other_names);



%% DERIVE EXPRESSIONS FOR AERO FORCE/MOMENT COEFFICIENTS

O_omega_B_Q = simplify(transpose(QcB * transpose(O_omega_B_B)));

[other_Eqns, other_names] = addEquation_to_eqnVect(...
    O_omega_B_Q(1),"p",other_Eqns, ...
    other_names);
[other_Eqns, other_names] = addEquation_to_eqnVect(...
    O_omega_B_Q(2),"q",other_Eqns, ...
    other_names);
[other_Eqns, other_names] = addEquation_to_eqnVect(...
    O_omega_B_Q(3),"r",other_Eqns, ...
    other_names);

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

[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    CL_S,"CL_s",nonEssential_eqns, ...
    nonEssential_names);
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    CD_S,"CD_s",nonEssential_eqns, ...
    nonEssential_names);
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    CY_S,"CY_s",nonEssential_eqns, ...
    nonEssential_names);
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    Cl_S,"Cl_s",nonEssential_eqns, ...
    nonEssential_names);
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    Cm_S,"Cm_s",nonEssential_eqns, ...
    nonEssential_names);
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    Cn_S,"Cn_s",nonEssential_eqns, ...
    nonEssential_names);

% rotate stability derivatives into wind frame
CF_S = [CD_s CY_s CL_s];
CM_S = [Cl_s Cm_s Cn_s];

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


T_eq = simplify(normT * (rGP_B / norm(rGP_B)));

T_B = [Tx Ty Tz];

T_O = simplify(transpose(OcB * transpose(T_B)));

tau_T_B = simplify(cross(T_B , rPB_B));


[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    rGO_B(1),"rGO_x_B",nonEssential_eqns, ...
    nonEssential_names);
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    rGO_B(2),"rGO_y_B",nonEssential_eqns, ...
    nonEssential_names);
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    rGO_B(3),"rGO_z_B",nonEssential_eqns, ...
    nonEssential_names);
% 
% [nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
%     rBO_B(1),"rBO_x_B",nonEssential_eqns, ...
%     nonEssential_names);
% [nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
%     rBO_B(2),"rBO_y_B",nonEssential_eqns, ...
%     nonEssential_names);
% [nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
%     rBO_B(3),"rBO_z_B",nonEssential_eqns, ...
%     nonEssential_names);
% 
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    rGP_B(1),"rGP_x_B",nonEssential_eqns, ...
    nonEssential_names);
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    rGP_B(2),"rGP_y_B",nonEssential_eqns, ...
    nonEssential_names);
[nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
    rGP_B(3),"rGP_z_B",nonEssential_eqns, ...
    nonEssential_names);
% 
% [nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
%     T_eq(1),"T_x_B",nonEssential_eqns, ...
%     nonEssential_names);
% [nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
%     T_eq(2),"T_y_B",nonEssential_eqns, ...
%     nonEssential_names);
% [nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
%     T_eq(3),"T_z_B",nonEssential_eqns, ...
%     nonEssential_names);

[other_Eqns, other_names] = addEquation_to_eqnVect(...
    T_eq(1),"Tx",other_Eqns, ...
    other_names);
[other_Eqns, other_names] = addEquation_to_eqnVect(...
    T_eq(2),"Ty",other_Eqns, ...
    other_names);
[other_Eqns, other_names] = addEquation_to_eqnVect(...
    T_eq(3),"Tz",other_Eqns, ...
    other_names);

[other_Eqns, other_names] = addEquation_to_eqnVect(...
    dl_tether,"d_tether",other_Eqns, ...
    other_names);




% *************************************************************************



%% DERIVE GRAVITY VECTOR

Fg_z_O = mT * g;

Fg_O = [0 0 Fg_z_O];

Fg_B = simplify(transpose(BcO * transpose(Fg_O)));

% [nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
%     Fg_B(1),"Fg_x_B",nonEssential_eqns, ...
%     nonEssential_names);
% [nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
%     Fg_B(2),"Fg_y_B",nonEssential_eqns, ...
%     nonEssential_names);
% [nonEssential_eqns, nonEssential_names] = addEquation_to_eqnVect(...
%     Fg_B(3),"Fg_z_B",nonEssential_eqns, ...
%     nonEssential_names);
% *************************************************************************

%% DERIVE EXPRESSIONS FOR F = MA AND ODDT(H) = TAU

F_over_M = ((Fg_B + T_B + AeroForces_B) / mT);

tauTot_B = (AeroMoments_B + tau_T_B);

linEQ = O_a_BO_B == F_over_M;
angEQ = Oddt_O_O_h_B_B == tauTot_B;

EQ_unsolved = [linEQ , angEQ];

%symvar(EQ_unsolved)
% *************************************************************************


%% DERIVE SOME OTHER STUFF BECAUSE I NEED IT

%T_EQ_O
T_EQ_O = transpose(OcB * transpose(T_eq));
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    T_EQ_O(1),"T_x_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    T_EQ_O(2),"T_y_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    T_EQ_O(3),"T_z_O",leftover_EQ,leftover_NAME);


%rBO_O    already defined
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rBO_O(1),"rBO_x_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rBO_O(2),"rBO_y_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rBO_O(3),"rBO_z_O",leftover_EQ,leftover_NAME);

rPB_O = transpose(OcB * transpose(rPB_B));
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rPB_O(1),"rPB_x_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rPB_O(2),"rPB_y_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rPB_O(3),"rPB_z_O",leftover_EQ,leftover_NAME);


rGO_o = transpose(OcB * transpose(rGO_B));
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rGO_o(1),"rGO_x_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rGO_o(2),"rGO_y_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rGO_o(3),"rGO_z_O",leftover_EQ,leftover_NAME);

rGP_O = transpose(OcB * transpose(rGP_B));
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rGP_O(1),"rGP_x_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rGP_O(2),"rGP_y_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    rGP_O(3),"rGP_z_O",leftover_EQ,leftover_NAME);

%Fg_B     already defined
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    Fg_B(1),"Fg_x_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    Fg_B(2),"Fg_y_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    Fg_B(3),"Fg_z_B",leftover_EQ,leftover_NAME);

% CD_s 
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    CD_S,"CD_s",leftover_EQ,leftover_NAME);

% CY_s 
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    CY_S,"CY_s",leftover_EQ,leftover_NAME);

% CL_s
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    CL_S,"CL_s",leftover_EQ,leftover_NAME);

% Cl_s 
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    Cl_S,"Cl_s",leftover_EQ,leftover_NAME);

% Cm_s 
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    Cm_S,"Cm_s",leftover_EQ,leftover_NAME);

% Cn_s
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    Cn_S,"Cn_s",leftover_EQ,leftover_NAME);

%AeroForces_O
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroForces_O(1),"D_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroForces_O(2),"Y_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroForces_O(3),"L_O",leftover_EQ,leftover_NAME);

%AeroMoments_O
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroMoments_O(1),"l_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroMoments_O(2),"m_O",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroMoments_O(3),"n_O",leftover_EQ,leftover_NAME);

%AeroForces_B
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroForces_B(1),"D_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroForces_B(2),"Y_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroForces_B(3),"L_B",leftover_EQ,leftover_NAME);

%AeroMoments_B
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroMoments_B(1),"l_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroMoments_B(2),"m_B",leftover_EQ,leftover_NAME);
[leftover_EQ, leftover_NAME] = addEquation_to_eqnVect(...
    AeroMoments_B(3),"n_B",leftover_EQ,leftover_NAME);



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
    37.5 25 75.6791544 ...         %k_tether, b_tether, lo_tether
    1.991 -9.81 1.225...            % mT g rho
    0.58123 -0.40236 0.00063 ...    % xref_Q yref_Q zref_Q
    0.58123 -0.40236 0.00063 ...   % xNP_Q yNP_Q zNP_Q
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

    EQ_unsolved_subbed = subs(EQ_unsolved,regVect,subVect);
    other_Eqns_subbed = subs(other_Eqns,regVect,subVect);
    nonEssential_eqns_subbed = subs(nonEssential_eqns,regVect,subVect);
    rotationMatrix_Matrix = subs(rotationMatrix_Matrix,regVect,subVect);
    leftover_EQ = subs(leftover_EQ,regVect,subVect);
% *************************************************************************
% *************************************************************************


%% now solve for state derivatives and extra stuff 

EQ_solved_unsimple = solve(EQ_unsolved_subbed,[rBO_X_d_d,rBO_Y_d_d,rBO_Z_d_d,ph_d_d,th_d_d,ps_d_d]);

EQ_solve_simple(1) = simplify(EQ_solved_unsimple.rBO_X_d_d);
EQ_solve_simple(2) = simplify(EQ_solved_unsimple.rBO_Y_d_d);
EQ_solve_simple(3) = simplify(EQ_solved_unsimple.rBO_Z_d_d);
EQ_solve_simple(4) = simplify(EQ_solved_unsimple.ph_d_d);
EQ_solve_simple(5) = simplify(EQ_solved_unsimple.th_d_d);
EQ_solve_simple(6) = simplify(EQ_solved_unsimple.ps_d_d);

% *************************************************************************

other_Eqns_simplified = simplify(other_Eqns_subbed);
nonEssential_eqns_simplified = simplify(nonEssential_eqns_subbed);
rotationMatrix_Matrix = simplify(rotationMatrix_Matrix);
leftover_EQ = simplify(leftover_EQ);
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

EQ_solve_simple = subs(EQ_solve_simple,regVect,subVect);
other_Eqns_simplified = subs(other_Eqns_simplified,regVect,subVect);
nonEssential_eqns_simplified = subs(nonEssential_eqns_simplified,regVect,subVect);
%rotationMatrix_Matrix = subs(rotationMatrix_Matrix,regVect,subVect);
leftover_EQ = subs(leftover_EQ,regVect,subVect);

EQ_solve_final = [ ...
    str2sym('x(7)') str2sym('x(8)') str2sym('x(9)') ...
    str2sym('x(10)') str2sym('x(11)') str2sym('x(12)') ...
    EQ_solve_simple ...
    ];

EQ_string_final = append(string(transpose(EqVect))," = ",string( ...
    transpose(EQ_solve_final)));
other_Eqns_string_final = append(other_names," = ",string( ...
    other_Eqns_simplified));
nonEssential_eqns_string_final = append(nonEssential_names," = ",string( ...
    nonEssential_eqns_simplified));
leftover_EQ_string_final = append(leftover_NAME," = ",string(leftover_EQ));



% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************
% *************************************************************************

%% MOVE INTO A UNIQUE FOLDER

folderCheck = 1;
folderIter = 0;

while folderCheck > 0 && folderIter < 100
    folderIter = folderIter + 1;
    
    if folderIter < 10
        iterString = append('0',string(folderIter));
    else
        iterString = string(folderIter);
    end
    
    folder_name = append(outputFolderName,iterString);
    
    if ~exist(folder_name,'dir')
        folderCheck = 0;
    end
end

if folderCheck < 1
    
    mkdir(folder_name);
    cd(folder_name);
    
else
    
    error("unique folder not found");
    
end


%% WRITE THE SIMULATION RUN FILE (M-FILE)

FID = fopen(simScriptName,'w');

fprintf(FID,"%% INPUT\n\n");

fprintf(FID,"clear all;\n\n");

fprintf(FID,"de =    0;\n\n");

fprintf(FID,"x1_0 =  0;\n");
fprintf(FID,"x2_0 =  -76.2;\n");
fprintf(FID,"x3_0 =  0;\n");
fprintf(FID,"x4_0 =  -pi()/2;\n");
fprintf(FID,"x5_0 =  0;\n");
fprintf(FID,"x6_0 =  0;\n");
fprintf(FID,"x7_0 =  0;\n");
fprintf(FID,"x8_0 =  0;\n");
fprintf(FID,"x9_0 =  0;\n");
fprintf(FID,"x10_0 = 0;\n");
fprintf(FID,"x11_0 = 0;\n");
fprintf(FID,"x12_0 = 0;\n\n");

fprintf(FID,"vWO_X =     -5;\n");
fprintf(FID,"vWO_Y =     0;\n");
fprintf(FID,"vWO_Z =     0; \n\n");

fprintf(FID,"tspan_min = 0;\n");
fprintf(FID,"tspan_max = 1;\n\n");

fprintf(FID,"%% GO TO A UNIQUE FOLDER\n\n");

fprintf(FID,'load res9.mat;\n');
fprintf(FID,"results = resultsNew;\n\n");

fprintf(FID,"folderbase = 'SIM_OUTPUT';\n\n");

fprintf(FID,"folderCheck = 1;\n");
fprintf(FID,"folderIter = 0;\n\n");

fprintf(FID,"while folderCheck > 0 && folderIter < 100\n");
fprintf(FID,"\tfolderIter = folderIter + 1;\n\n");
    
fprintf(FID,"\tif folderIter < 10\n");
fprintf(FID,"\t\titerString = append('0',string(folderIter));\n");
fprintf(FID,"\telse\n");
fprintf(FID,"\t\titerString = string(folderIter);\n");
fprintf(FID,"\tend\n\n");
    
fprintf(FID,"\tfolder_name = append(folderbase,iterString);\n\n");
    
fprintf(FID,"\tif ~exist(folder_name,'dir')\n");
fprintf(FID,"\t\tfolderCheck = 0;\n");
fprintf(FID,"\tend\n");
fprintf(FID,"end\n\n");

fprintf(FID,"if folderCheck < 1\n\n");
    
fprintf(FID,"\tmkdir(folder_name);\n\n");

    
fprintf(FID,"else\n\n");
    
fprintf(FID,"\terror('unique folder not found');\n\n");
    
fprintf(FID,"end\n\n");

fprintf(FID,"%% setup stuff\n\n");



fprintf(FID,'x_names = ["xB";"yB";"zB";"phi";"theta";"psi";"vxB";"vyB";"vzB";"phidot";"thetadot";"psidot"];\n');
fprintf(FID,"x_0 = [x1_0 x2_0 x3_0 x4_0 x5_0 x6_0 x7_0 x8_0 x9_0 x10_0 x11_0 x12_0];\n\n");

fprintf(FID,"settings.alpha_max = deg2rad(settings.alpha_max);\n");
fprintf(FID,"settings.alpha_min = deg2rad(settings.alpha_min);\n");
fprintf(FID,"settings.beta_max = deg2rad(settings.beta_max);\n");
fprintf(FID,"settings.beta_min = deg2rad(settings.beta_min);\n\n");

fprintf(FID,"global otherstuff\n");
fprintf(FID,"otherstuff.settings = settings;\n");
fprintf(FID,"otherstuff.results = results;\n");
fprintf(FID,"otherstuff.de = de;\n");
fprintf(FID,"otherstuff.vWO_X = vWO_X;\n");
fprintf(FID,"otherstuff.vWO_Y = vWO_Y;\n");
fprintf(FID,"otherstuff.vWO_Z = vWO_Z;\n\n");

funcNameInd = strfind(simFuncName,".m");
funcName = extractBefore(simFuncName,funcNameInd);

fprintf(FID,"[t,x] = ode45(@%s,[tspan_min tspan_max],x_0);\n\n",funcName);


fprintf(FID,"figure\n");
fprintf(FID,"for i = 1 : size(x,2)\n");
fprintf(FID,"\tsubplot(4,3,i);\n");
fprintf(FID,"\tplot(t,x(:,i));\n");
fprintf(FID,"\ttitle(x_names(i));\n");
fprintf(FID,"end\n\n");

fprintf(FID,"\tcd(folder_name);\n");
fprintf(FID,"save 'simResults.mat'\n");
fprintf(FID,"cd ..\n\n");

fprintf(FID,"GenerateLeftovers(folder_name,'simResults.mat','res9.mat');\n\n");


fclose(FID);
    
    
%% WRITE THE simFunction M-FILE


FID = fopen(simFuncName,'w');

fprintf(FID,"function [xdot] = SailFunc(t,x)\n\n");

fprintf(FID,"\tglobal otherstuff\n");
fprintf(FID,"\tpersistent currentConfig aeroTriggers aeroTriggersLast settings results ...\n");
fprintf(FID,"\tcL_a cL_b cL_de cL_p cL_q cL_r ...\n");
fprintf(FID,"\tcD_tot...\n");
fprintf(FID,"\tcY_a cY_b cY_de cY_p cY_q cY_r ...\n");
fprintf(FID,"\tcl_a cl_b cl_de cl_p cl_q cl_r ...\n");
fprintf(FID,"\tcm_a cm_b cm_de cm_p cm_q cm_r ...\n");
fprintf(FID,"\tcn_a cn_b cn_de cn_p cn_q cn_r ...\n");
fprintf(FID,"\tvWO_X vWO_Y vWO_Z de...\n");
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

for i = 1:size(other_Eqns_string_final,1)
    fprintf(FID,"\t%s;\n",other_Eqns_string_final(i,:));
end
fprintf(FID,"\n");

%fprintf(FID,"x\n\n");

fprintf(FID,"\tif d_tether <= 0\n");
fprintf(FID,"\t\tTx = 0;\n");
fprintf(FID,"\t\tTy = 0;\n");
fprintf(FID,"\t\tTz = 0;\n");
fprintf(FID,"\tend\n\n");

% fprintf(FID,"\tif alpha > pi()\n");
% fprintf(FID,"\t\talpha = -1*((2*pi()) - alpha);\n");
% fprintf(FID,"\tend\n\n");
% 
% fprintf(FID,"\tif beta > pi()\n");
% fprintf(FID,"\t\tbeta = -1*((2*pi()) - beta);\n");
% fprintf(FID,"\tend\n\n");

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
fprintf(FID,"\t\t\tcn_r = results(resultsCoords).cnr;\n\n");

fprintf(FID,"\t\telse\n\n"); % else

% fprintf(FID,"\t\t\tcL_a = results(resultsCoords).cLa;\n");
% fprintf(FID,"\t\t\tcL_b = results(resultsCoords).cLb;\n");
% fprintf(FID,"\t\t\tcL_de = results(resultsCoords).cLde;\n");
% fprintf(FID,"\t\t\tcL_p = results(resultsCoords).cLp;\n");
% fprintf(FID,"\t\t\tcL_q = results(resultsCoords).cLq;\n");
% fprintf(FID,"\t\t\tcL_r = results(resultsCoords).cLr;\n\n");
% 
% fprintf(FID,"\t\t\tcD_tot = results(resultsCoords).cDtot;\n\n");
% 
% fprintf(FID,"\t\t\tcY_a = results(resultsCoords).cYa;\n");
% fprintf(FID,"\t\t\tcY_b = results(resultsCoords).cYb;\n");
% fprintf(FID,"\t\t\tcY_de = results(resultsCoords).cYde;\n");
% fprintf(FID,"\t\t\tcY_p = results(resultsCoords).cYp;\n");
% fprintf(FID,"\t\t\tcY_q = results(resultsCoords).cYq;\n");
% fprintf(FID,"\t\t\tcY_r = results(resultsCoords).cYr;\n\n");
% 
% fprintf(FID,"\t\t\tcl_a = results(resultsCoords).cla;\n");
% fprintf(FID,"\t\t\tcl_b = results(resultsCoords).clb;\n");
% fprintf(FID,"\t\t\tcl_de = results(resultsCoords).clde;\n");
% fprintf(FID,"\t\t\tcl_p = results(resultsCoords).clp;\n");
% fprintf(FID,"\t\t\tcl_q = results(resultsCoords).clq;\n");
% fprintf(FID,"\t\t\tcl_r = results(resultsCoords).clr;\n\n");
% 
% fprintf(FID,"\t\t\tcm_a = results(resultsCoords).cma;\n");
% fprintf(FID,"\t\t\tcm_b = results(resultsCoords).cmb;\n");
% fprintf(FID,"\t\t\tcm_de = results(resultsCoords).cmde;\n");
% fprintf(FID,"\t\t\tcm_p = results(resultsCoords).cmp;\n");
% fprintf(FID,"\t\t\tcm_q = results(resultsCoords).cmq;\n");
% fprintf(FID,"\t\t\tcm_r = results(resultsCoords).cmr;\n\n");
% 
% fprintf(FID,"\t\t\tcn_a = results(resultsCoords).cna;\n");
% fprintf(FID,"\t\t\tcn_b = results(resultsCoords).cnb;\n");
% fprintf(FID,"\t\t\tcn_de = results(resultsCoords).cnde;\n");
% fprintf(FID,"\t\t\tcn_p = results(resultsCoords).cnp;\n");
% fprintf(FID,"\t\t\tcn_q = results(resultsCoords).cnq;\n");
% fprintf(FID,"\t\t\tcn_r = results(resultsCoords).cnr;\n");
% fprintf(FID,"\t\t\txNP_Q = 0;\n");
% fprintf(FID,"\t\t\tyNP_Q = 0;\n\n");

fprintf(FID,"\t\t\tstallFlag = 1;\n\n");

fprintf(FID,"\t\tend\n");
fprintf(FID,"\tend\n\n");

% fprintf(FID,"\t\t\tcL_a = 0;\n");
% fprintf(FID,"\t\t\tcL_b = 0;\n");
% fprintf(FID,"\t\t\tcL_de = 0;\n");
% fprintf(FID,"\t\t\tcL_p = 0;\n");
% fprintf(FID,"\t\t\tcL_q = 0;\n");
% fprintf(FID,"\t\t\tcL_r = 0;\n\n");
% 
% fprintf(FID,"\t\t\tcD_tot = 0.2;\n\n");
% 
% fprintf(FID,"\t\t\tcY_a = 0;\n");
% fprintf(FID,"\t\t\tcY_b = 0;\n");
% fprintf(FID,"\t\t\tcY_de = 0;\n");
% fprintf(FID,"\t\t\tcY_p = 0;\n");
% fprintf(FID,"\t\t\tcY_q = 0;\n");
% fprintf(FID,"\t\t\tcY_r = 0;\n\n");
% 
% fprintf(FID,"\t\t\tcl_a = 0;\n");
% fprintf(FID,"\t\t\tcl_b = 0;\n");
% fprintf(FID,"\t\t\tcl_de = 0;\n");
% fprintf(FID,"\t\t\tcl_p = 0;\n");
% fprintf(FID,"\t\t\tcl_q = 0;\n");
% fprintf(FID,"\t\t\tcl_r = 0;\n\n");
% 
% fprintf(FID,"\t\t\tcm_a = 0;\n");
% fprintf(FID,"\t\t\tcm_b = 0;\n");
% fprintf(FID,"\t\t\tcm_de = 0;\n");
% fprintf(FID,"\t\t\tcm_p = 0;\n");
% fprintf(FID,"\t\t\tcm_q = 0;\n");
% fprintf(FID,"\t\t\tcm_r = 0;\n\n");
% 
% fprintf(FID,"\t\t\tcn_a = 0;\n");
% fprintf(FID,"\t\t\tcn_b = 0;\n");
% fprintf(FID,"\t\t\tcn_de = 0;\n");
% fprintf(FID,"\t\t\tcn_p = 0;\n");
% fprintf(FID,"\t\t\tcn_q = 0;\n");
% fprintf(FID,"\t\t\tcn_r = 0;\n");
% fprintf(FID,"\t\t\txNP_Q =  0.609185;\n");
% fprintf(FID,"\t\t\tyNP_Q =  -.685;\n\n");
% 
% fprintf(FID,"\t\tend\n");
% fprintf(FID,"\tend\n\n");

for i = 1:size(nonEssential_eqns_string_final,1)
    fprintf(FID,"\t%s;\n",nonEssential_eqns_string_final(i,:));
end
fprintf(FID,"\n");

fprintf(FID,"\tQ = 0.5 * 1.225 * windspeed * windspeed;\n\n");
    
fprintf(FID,"\tL_S = CL_s * Q * 0.4;\n");
fprintf(FID,"\tD_S = CD_s * Q * 0.4;\n");
fprintf(FID,"\tY_S = CY_s * Q * 0.4;\n");
fprintf(FID,"\tl_S = Cl_s * Q * 0.4 * 1.4;\n");
fprintf(FID,"\tm_S = Cm_s * Q * 0.4 * 0.3;\n");
fprintf(FID,"\tn_S = Cn_s * Q * 0.4 * 1.4;\n\n");

for i = 1:size(EQ_string_final,1)
    fprintf(FID,"\t%s;\n",EQ_string_final(i,:));
end
fprintf(FID,"\n");

fprintf(FID,"\txdot=xdot';\n\n");


fprintf(FID,"end\n\n\n");

save sailModelCurrent.mat;

fclose(FID);

%% WRITE THE B2O SCRIPT

FID = fopen(append(B2O_ScriptName,".m"),'w');

isFound = 0;
iter = 0;
while isFound < 1 && iter <= size(rotationMatrix_Names,1)
    iter = iter + 1;
    current_name(:) = rotationMatrix_Names(iter,:);
    if strcmp('OcB',current_name)
        isFound = 1;
    end
end

if isFound < 1
    error("OcB matrix index not found");
end

matrix_OcB(:,:) = rotationMatrix_Matrix(iter,:,:);

matrix_string = matrix2string(matrix_OcB,current_name);

fprintf(FID,"function [O_vector] = %s(B_vector,Eul_vector)\n\n",B2O_ScriptName);

fprintf(FID,"ph = Eul_vector(1);\n"); 
fprintf(FID,"th = Eul_vector(2);\n");
fprintf(FID,"ps = Eul_vector(3);\n\n");

fprintf(FID,"\t%s\n\n",matrix_string);

fprintf(FID,"\tO_vector = transpose(%s * transpose(B_vector));\n\n",current_name);

fprintf(FID,"end");

fclose(FID);

%% WRITE THE Q2O SCRIPT

FID = fopen(append(Q2O_ScriptName,".m"),'w');

isFound = 0;
iter = 0;
while isFound < 1 && iter <= size(rotationMatrix_Names,1)
    iter = iter + 1;
    current_name(1,:) = rotationMatrix_Names(iter,:);
    if strcmp('OcQ',current_name)
        isFound = 1;
    end
end

if isFound < 1
    error("OcQ matrix index not found");
end

matrix_OcQ(:,:) = rotationMatrix_Matrix(iter,:,:);

matrix_string = matrix2string(matrix_OcQ,current_name);


fprintf(FID,"function [O_vector] = %s(Q_vector,Eul_vector)\n\n",Q2O_ScriptName);

fprintf(FID,"ph = Eul_vector(1);\n"); 
fprintf(FID,"th = Eul_vector(2);\n");
fprintf(FID,"ps = Eul_vector(3);\n\n");

fprintf(FID,"\t%s\n\n",matrix_string);

fprintf(FID,"\tO_vector = transpose(%s * transpose(Q_vector));\n\n",current_name);

fprintf(FID,"end");

fclose(FID);

%% WRITE THE S2O SCRIPT

FID = fopen(append(S2O_ScriptName,".m"),'w');

isFound = 0;
iter = 0;
while isFound < 1 && iter <= size(rotationMatrix_Names,1)
    iter = iter + 1;
    current_name(1,:) = rotationMatrix_Names(iter,:);
    if strcmp('OcS',current_name)
        isFound = 1;
    end
end

if isFound < 1
    error("OcS matrix index not found");
end

matrix_OcS(:,:) = rotationMatrix_Matrix(iter,:,:);

matrix_string = matrix2string(matrix_OcS,current_name);

fprintf(FID,"function [O_vector] = %s(S_vector,Eul_vector,alpha)\n\n",S2O_ScriptName);

fprintf(FID,"ph = Eul_vector(1);\n"); 
fprintf(FID,"th = Eul_vector(2);\n");
fprintf(FID,"ps = Eul_vector(3);\n\n");

fprintf(FID,"\t%s\n\n",matrix_string);

fprintf(FID,"\tO_vector = transpose(%s * transpose(S_vector));\n\n",current_name);

fprintf(FID,"end");

fclose(FID);

%% WRITE THE W2O SCRIPT

FID = fopen(append(W2O_ScriptName,".m"),'w');

isFound = 0;
iter = 0;
while isFound < 1 && iter <= size(rotationMatrix_Names,1)
    iter = iter + 1;
    current_name(1,:) = rotationMatrix_Names(iter,:);
    if strcmp('OcW',current_name)
        isFound = 1;
    end
end

if isFound < 1
    error("OcW matrix index not found");
end

matrix_OcW(:,:) = rotationMatrix_Matrix(iter,:,:);

matrix_string = matrix2string(matrix_OcW,current_name);

fprintf(FID,"function [O_vector] = %s(W_vector,Eul_vector,alpha,beta)\n\n",W2O_ScriptName);

fprintf(FID,"ph = Eul_vector(1);\n"); 
fprintf(FID,"th = Eul_vector(2);\n");
fprintf(FID,"ps = Eul_vector(3);\n\n");

fprintf(FID,"\t%s\n\n",matrix_string);

fprintf(FID,"\tO_vector = transpose(%s * transpose(W_vector));\n\n",current_name);

fprintf(FID,"end");

fclose(FID);

%% WRITE THE LEFTOVERS

regVect = [str2sym('x(1)') str2sym('x(2)') str2sym('x(3)') str2sym('x(4)')...
    str2sym('x(5)') str2sym('x(6)') str2sym('x(7)') str2sym('x(8)') ...
    str2sym('x(9)') str2sym('x(10)') str2sym('x(11)') str2sym('x(12)')];

subVect = [str2sym('xderp(1)') str2sym('xderp(2)') str2sym('xderp(3)')...
    str2sym('xderp(4)') str2sym('xderp(5)') str2sym('xderp(6)') ...
    str2sym('xderp(7)') str2sym('xderp(8)') str2sym('xderp(9)') ...
    str2sym('xderp(10)') str2sym('xderp(11)') str2sym('xderp(12)')];

eqns1 = subs(other_Eqns_simplified,regVect,subVect);
eqns2 = subs(nonEssential_eqns_simplified,regVect,subVect);
eqns3 = subs(leftover_EQ,regVect,subVect);

eqns1_string = append(other_names," = ",string(eqns1));
eqns2_string = append(nonEssential_names," = ",string(eqns2));
eqns3_string = append(leftover_NAME," = ",string(eqns3));



FID = fopen(append(leftovers_ScriptName,".m"),'w');

fprintf(FID,"function %s(solutionsFolder,solutionsMatFile,resMatFile)\n\n",leftovers_ScriptName);

fprintf(FID,"\tload(resMatFile);\n");
fprintf(FID,"\tcd(solutionsFolder);\n");
fprintf(FID,"\tload(solutionsMatFile);\n");
fprintf(FID,"\tcd ..;\n");

fprintf(FID,"\titer_max = size(t);\n\n");

fprintf(FID,"\tglobal otherstuff \n");
fprintf(FID,"\tpersistent currentConfig aeroTriggers aeroTriggersLast ...\n");
fprintf(FID,"\tcL_a cL_b cL_de cL_p cL_q cL_r ...\n");
fprintf(FID,"\tcD_tot...\n");
fprintf(FID,"\tcY_a cY_b cY_de cY_p cY_q cY_r ...\n");
fprintf(FID,"\tcl_a cl_b cl_de cl_p cl_q cl_r ...\n");
fprintf(FID,"\tcm_a cm_b cm_de cm_p cm_q cm_r ...\n");
fprintf(FID,"\tcn_a cn_b cn_de cn_p cn_q cn_r ...\n");
fprintf(FID,"\tstallFlag ...\n");
fprintf(FID,"\t;\n\n");

fprintf(FID,"\tresults = resultsNew;\n\n");

fprintf(FID,"\tfindAeroFlag = 1;\n");
fprintf(FID,"\t\tif t == 0\n");
fprintf(FID,"\t\tstallFlag = 0;\n");
fprintf(FID,"\t\tcallNum = 0;\n");
fprintf(FID,"\t\tsettings = otherstuff.settings;\n");
fprintf(FID,"\t\tresults = otherstuff.results;\n");
fprintf(FID,"\t\tde = otherstuff.de;\n");
fprintf(FID,"\t\tvWO_X = otherstuff.vWO_X;\n");
fprintf(FID,"\t\tvWO_Y = otherstuff.vWO_Y;\n");
fprintf(FID,"\t\tvWO_Z = otherstuff.vWO_Z;\n");
fprintf(FID,"\tend\n\n");

fprintf(FID,"\tfor i = 1:iter_max\n");
fprintf(FID,"\t\txderp(:) = x(i,:);\n");
fprintf(FID,"\t\ttderp = t(i);\n\n");

for i = 1:size(eqns1_string,1)
    fprintf(FID,"\t\t%s;\n",eqns1_string(i,:));
end
fprintf(FID,"\n");

fprintf(FID,"\t\tif d_tether <= 0\n");
fprintf(FID,"\t\t\tTx = 0;\n");
fprintf(FID,"\t\t\tTy = 0;\n");
fprintf(FID,"\t\t\tTz = 0;\n");
fprintf(FID,"\t\tend\n\n");

fprintf(FID,"\t\tcurrentConfig.alpha = alpha;\n");
fprintf(FID,"\t\tcurrentConfig.beta = beta;\n");
fprintf(FID,"\t\tcurrentConfig.de = de;\n");
fprintf(FID,"\t\tcurrentConfig.windspeed = windspeed;\n");
fprintf(FID,"\t\tcurrentConfig.p = p;\n");
fprintf(FID,"\t\tcurrentConfig.q = q;\n");
fprintf(FID,"\t\tcurrentConfig.r = r;\n\n");

fprintf(FID,"\t\tif tderp == 0\n");
fprintf(FID,"\t\t\tfindAeroFlag = 1;\n");
fprintf(FID,"\t\telseif ~stallFlag\n");
fprintf(FID,"\t\t\t[findAeroFlag] = checkForAeroLimits(currentConfig,aeroTriggersLast);\n");
fprintf(FID,"\t\tend\n\n");

fprintf(FID,"\t\tif findAeroFlag || stallFlag\n");
fprintf(FID,"\t\t\t[successFindAero, resultsCoords ,aeroTriggers] = findAeroConfig(settings,currentConfig);\n");
fprintf(FID,"\t\t\tif successFindAero\n");
fprintf(FID,"\t\t\t\taeroTriggersLast = aeroTriggers;\n");
fprintf(FID,"\t\t\t\tstallFlag = 0;\n\n");

fprintf(FID,"\t\t\t\tcL_a = results(resultsCoords).cLa;\n");
fprintf(FID,"\t\t\t\tcL_b = results(resultsCoords).cLb;\n");
fprintf(FID,"\t\t\t\tcL_de = results(resultsCoords).cLde;\n");
fprintf(FID,"\t\t\t\tcL_p = results(resultsCoords).cLp;\n");
fprintf(FID,"\t\t\t\tcL_q = results(resultsCoords).cLq;\n");
fprintf(FID,"\t\t\t\tcL_r = results(resultsCoords).cLr;\n\n");

fprintf(FID,"\t\t\t\tcD_tot = results(resultsCoords).cDtot;\n\n");

fprintf(FID,"\t\t\t\tcY_a = results(resultsCoords).cYa;\n");
fprintf(FID,"\t\t\t\tcY_b = results(resultsCoords).cYb;\n");
fprintf(FID,"\t\t\t\tcY_de = results(resultsCoords).cYde;\n");
fprintf(FID,"\t\t\t\tcY_p = results(resultsCoords).cYp;\n");
fprintf(FID,"\t\t\t\tcY_q = results(resultsCoords).cYq;\n");
fprintf(FID,"\t\t\t\tcY_r = results(resultsCoords).cYr;\n");

fprintf(FID,"\t\t\t\tcl_a = results(resultsCoords).cla;\n");
fprintf(FID,"\t\t\t\tcl_b = results(resultsCoords).clb;\n");
fprintf(FID,"\t\t\t\tcl_de = results(resultsCoords).clde;\n");
fprintf(FID,"\t\t\t\tcl_p = results(resultsCoords).clp;\n");
fprintf(FID,"\t\t\t\tcl_q = results(resultsCoords).clq;\n");
fprintf(FID,"\t\t\t\tcl_r = results(resultsCoords).clr;\n\n");

fprintf(FID,"\t\t\t\tcm_a = results(resultsCoords).cma;\n");
fprintf(FID,"\t\t\t\tcm_b = results(resultsCoords).cmb;\n");
fprintf(FID,"\t\t\t\tcm_de = results(resultsCoords).cmde;\n");
fprintf(FID,"\t\t\t\tcm_p = results(resultsCoords).cmp;\n");
fprintf(FID,"\t\t\t\tcm_q = results(resultsCoords).cmq;\n");
fprintf(FID,"\t\t\t\tcm_r = results(resultsCoords).cmr;\n\n");

fprintf(FID,"\t\t\t\tcn_a = results(resultsCoords).cna;\n");
fprintf(FID,"\t\t\t\tcn_b = results(resultsCoords).cnb;\n");
fprintf(FID,"\t\t\t\tcn_de = results(resultsCoords).cnde;\n");
fprintf(FID,"\t\t\t\tcn_p = results(resultsCoords).cnp;\n");
fprintf(FID,"\t\t\t\tcn_q = results(resultsCoords).cnq;\n");
fprintf(FID,"\t\t\t\tcn_r = results(resultsCoords).cnr;\n\n");

fprintf(FID,"\t\t\telse\n\n");

fprintf(FID,"\t\t\t\tstallFlag = 1;\n\n");

fprintf(FID,"\t\t\tend\n");
fprintf(FID,"\t\tend\n\n");

for i = 1:size(eqns2_string,1)
    fprintf(FID,"\t\t%s;\n",eqns2_string(i,:));
end
fprintf(FID,"\n");

fprintf(FID,"\t\tQ = 0.5 * 1.225 * windspeed * windspeed;\n\n");

fprintf(FID,"\t\tL_S = CL_s * Q * 0.4;\n");
fprintf(FID,"\t\tD_S = CD_s * Q * 0.4;\n");
fprintf(FID,"\t\tY_S = CY_s * Q * 0.4;\n");
fprintf(FID,"\t\tl_S = Cl_s * Q * 0.4 * 1.4;\n");
fprintf(FID,"\t\tm_S = Cm_s * Q * 0.4 * 0.3;\n");
fprintf(FID,"\t\tn_S = Cn_s * Q * 0.4 * 1.4;\n\n");

for i = 1:size(eqns3_string,1)
    fprintf(FID,"\t\t%s;\n",eqns3_string(i,:));
end
fprintf(FID,"\n");

fprintf(FID,"\t\twindStates(i,:) = [tderp alpha beta windspeed p q r];\n");
fprintf(FID,"\t\tT_B(i,:) = [tderp Tx Ty Tz];\n");
fprintf(FID,"\t\tT_O(i,:) = [tderp T_x_O T_y_O T_z_O];\n");
fprintf(FID,"\t\trGP_B(i,:) = [tderp rGP_x_B rGP_y_B rGP_z_B];\n");
fprintf(FID,"\t\trGP_O(i,:) = [tderp rGP_x_O rGP_y_O rGP_z_O];\n");
fprintf(FID,"\t\trPB_O(i,:) = [tderp rPB_x_O rPB_y_O rPB_z_O];\n");
fprintf(FID,"\t\trBO_O(i,:) = [tderp rBO_x_O rBO_y_O rBO_z_O];\n");
fprintf(FID,"\t\trGO_B(i,:) = [tderp rGO_x_B rGO_y_B rGO_z_B];\n");
fprintf(FID,"\t\trPQ_B(i,:) = [tderp rPQ_x_B rPQ_y_B rPQ_z_B];\n");
fprintf(FID,"\t\trBQ_B(i,:) = [tderp rBQ_x_B rBQ_y_B rBQ_z_B];\n");
fprintf(FID,"\t\trPB_B(i,:) = [tderp rPB_x_B rPB_y_B rPB_z_B];\n");
fprintf(FID,"\t\tFg_B(i,:) = [tderp Fg_x_B Fg_y_B Fg_z_B];\n");
fprintf(FID,"\t\taeroCoeffs_S(i,:) = [tderp CD_s CY_s CL_s Cl_s Cm_s Cn_s];\n");
fprintf(FID,"\t\taeroForces_S(i,:) = [tderp D_S Y_S L_S];\n");
fprintf(FID,"\t\taeroMoments_S(i,:) = [tderp l_S m_S n_S];\n");
fprintf(FID,"\t\taeroForces_O(i,:) = [tderp D_O Y_O L_O];\n");
fprintf(FID,"\t\taeroMoments_O(i,:) = [tderp l_O m_O n_O];\n");
fprintf(FID,"\t\taeroForces_B(i,:) = [tderp D_B Y_B L_B];\n");
fprintf(FID,"\t\taeroMoments_O(i,:) = [tderp l_B m_B n_B];\n\n");

fprintf(FID,"\tend\n\n");

fprintf(FID,"\tcd(solutionsFolder);\n");
fprintf(FID,"\tsave leftovers.mat;\n");
fprintf(FID,"\tcd ..;\n\n");

fprintf(FID,"end");


%% BACK OUT INTO ORIGINAL DIRECTORY AND COPY NECESSARY FILES INTO SIM FOLDER
cd ..;
status = copyfile('checkForAeroLimits.m', folder_name, 'f');
status = copyfile('findAeroConfig.m', folder_name, 'f');
status = copyfile('outsideBoundsCheck.m', folder_name, 'f');
status = copyfile('res9.mat', folder_name, 'f');
status = copyfile('SailModel_EOMBuilder_Script_Final.m', folder_name, 'f');

%*************************************************************************
%*************************************************************************
%********************* SUPPORT FUNCTIONS BELOW ***************************
%*************************************************************************
%*************************************************************************

%% SUPPORT FUNCTION addEquation_to_eqnVect
%*************************************************************************
%********************* addEquation_to_eqnVect ****************************
% DESC : Adds a vector of symbolic equations to a target vector of
% equations, Adds an accompanying vector of equation labels to an
% accompanying target vector of equation labels
%
%
% ARGS: 
%   - equation2add          : equation vector to be added to target (row or
%                               column vector)
%   - equation_NameString   : label vector to be added to target (column
%                               vector only)
%   - targetEqn             : target for equation vector (column vector
%                               only!)
%   - targetNames           : target for label vector (column vector only!)
%
% RETURNS:
%   - new_target_eqnsVect   : modified target eqn vector (column)
%   - new_target_eqnsVect   : modified target lable vector (column)
%
%*************************************************************************
function [new_target_eqnsVect, new_target_namesVect] = ...
    addEquation_to_eqnVect(equation2add,equation_NameString,targetEqn, ...
    targetNames)
    if size(equation2add,2) > 1 && size(equation2add,1) > 1
        error("addEuation_to_eqnVect : equation is not a row or column vector!");
    end
    
    if size(equation2add,2) > 1
        equation2add = transpose(equation2add);
    end
    
    if size(equation_NameString,1) ~= size(equation2add,1)
        error("addEuation_to_eqnVect : equation is not the same size as equation_NameString");
    end
    
    targetEqn_OldRows = size(targetEqn,1);
    targetNames_OldRows = size(targetNames,1);
    Equation_Rows = size(equation2add,1);
    
    for i = 1:Equation_Rows
        targetNames(i + targetNames_OldRows, 1) = equation_NameString(i,1);
        targetEqn(i + targetEqn_OldRows, 1) = equation2add(i,1);
    end
    
    new_target_eqnsVect = targetEqn;
    new_target_namesVect = targetNames;   
end
%*************************************************************************
%*************************************************************************

%% SUPPORT FUNCTION matrix2string
%*************************************************************************
%**************************** matrix2string ******************************
% DESC : Converts a symbolic matrix into a string that can be written to
% an M-file and be parsed correctly during execution.
%
%
% ARGS: 
%   - matrixTarget  : input symbolic matrix to be converted (2D only!)
%   - labelTarget   : label variable (string or char array) this will be
%                       the variable name assigned the matrix in the M-file
%
% RETURNS:
%   - matrixString  : an m-file compatible string to assign the matrix
%                       equations to the label variable
%
%*************************************************************************
function [matrixString] = ...
    matrix2string(matrixTarget,labelTarget)

    dimensions = size(matrixTarget);
    
    if size(dimensions) > 2
        error("matrix2string : This function can only handle 2 dimensional matrices");
    end
    
    rows = dimensions(1);
    cols = dimensions(2);
    
    matrixString = append(labelTarget," = [");
    
    for i = 1:rows
        for j = 1:cols
            matrixString = append(matrixString,string(matrixTarget(i,j)));
            
            if j < cols
                matrixString = append(matrixString," ");
            elseif j == cols
                if i == rows
                   matrixString = append(matrixString,"];");
                else
                   matrixString = append(matrixString," ; ");
                end
            end
        end
    end         
end
%*************************************************************************
%*************************************************************************