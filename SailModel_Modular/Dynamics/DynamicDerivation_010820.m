syms rBO_B_x(t) rBO_B_y(t) rBO_B_z(t) ...
    phi(t) theta(t) psi(t) ...
    rPB_B_y ... 
    rGO_O_y ...
    alpha beta ;

%% Define Frames
%% BcO (zyx,psi/theta/phi)

rZpsi = [
            cos(psi(t))    sin(psi(t))     0
            -sin(psi(t))   cos(psi(t))     0
            0              0               1
         ];
     
rYtheta = [
            cos(theta(t))   0       -sin(theta(t))
            0               1       0
            sin(theta(t))   0       cos(theta(t))
          ];
      
rXphi = [
            1               0               0
            0               cos(phi(t))     sin(phi(t))
            0               -sin(phi(t))    cos(phi(t))
        ];
    
BcO = simplify(rXphi*rYtheta*rZpsi);
OcB = transpose(BcO);

%% QcB
QcB = [
    -1  0   0
    0   1   0
    0   0   -1
    ];
BcQ = transpose(QcB);


    
%% ScQ

ScQ = [
        cos(alpha)  0   sin(alpha)
        0           1   0
        -sin(alpha) 0   cos(alpha)
      ];
QcS = transpose(ScQ);

%% WcS

WcS = [
        cos(beta)   sin(beta)   0
        -sin(beta)  cos(beta)   0
        0           0           1
      ];
ScW = transpose(WcS);

%%

%OcO
%OcB
OcQ = simplify(OcB * BcQ);
OcS = simplify(OcQ * QcS);
OcW = simplify(OcS * ScW);

%BcO
%BcB
%BcQ
BcS = simplify(BcQ * QcS);
BcW = simplify(BcS * ScW);

QcO = transpose(OcQ);
%QcB
%QcQ
%QcS
QcW = simplify(QcS * ScW);

ScO = transpose(OcS);
ScB = transpose(BcS);
%ScQ
%ScS
%ScW

WcO = transpose(OcW);
WcB = transpose(BcW);
WcQ = tranpose(QcW);
%WcS
%WcW

%% Define O_omega_B_B and O_alpha_B

% get OcB_dot
OcB_dot = diff(OcB,t);

OcB_temp = BcO * OcB_dot;

O_omega_B_B_x = [0 0 1] * OcB_temp * [0;1;0];
O_omega_B_B_y = [1 0 0] * OcB_temp * [0;0;1];
O_omega_B_B_z = [0 1 0] * OcB_temp * [1;0;0];

O_omega_B_B = simplify([O_omega_B_B_x O_omega_B_B_y O_omega_B_B_z]);

O_alpha_B = diff(O_omega_B_B,t);

%% define rBO_B, O_v_BO_B, and O_a_BO_B

rBO_B = [rBO_B_x(t) rBO_B_y(t) rBO_B_z(t)];
O_v_BO_B = simplify( diff(rBO_B,t) + cross(O_omega_B_B , rBO_B) );
O_a_BO_B = simplify( diff(rBO_B,2,t) + 2*cross(O_omega_B_B,diff(rBO_B,t)) ...
    + cross(O_alpha_B,rBO_B) + cross(O_omega_B_B,cross(O_omega_B_B,rBO_B)));

%% define Icm_Q and calc Icm_B
syms Ixx Ixy Ixz...
    Iyy Iyz...
    Izz;

Iyx = Ixy;
Izx = Ixz;
Izy = Iyz;

Icm_Q = [
            Ixx Ixy Ixz
            Iyx Iyy Iyz
            Izx Izy Izz
        ];

Icm_B = simplify(BcQ * Icm_Q * QcB);

%% define O_O_h_B_B and ddt(O_O_h_B_B)

O_O_h_B_B = Icm_B * O_omega_B_B;
ddt_O_O_h_B_B = simplify(diff(O_O_h_B_B,t) + cross(O_omega_B_B , O_O_h_B_B));

%% define sum of forces and moments

syms m g Tx Ty Tz D Y L

Fg_O = [0 m*g 0];
Fg_B = simplify(transpose(BcO * transpose(Fg_O)));

Ft_B = [Tx Ty Tz];

Fa_W = [D Y L];
Fa_B = simplify(transpose(BcW * transpose(Fa_W)));

sumF_B = Fg_B + Ft_B + Fa_B;

syms l m n

rPB_B = [0 rPB_B_y 0];

tau_T_B = cross(rPB_B , Ft_B);

tau_A_W = [l m n];
tau_A_B = simplify(tranpose(BcW * transpose(tau_A_W)));

sum_tau_B = tau_T_B + tau_A_B;

%% define system of equations

LHS_EQ = [transpose(sumF_B)/m ; transpose(sum_tau_B)];
RHS_EQ = [transpose(O_a_BO_B) ; transpose(ddt_O_O_h_B_B)];

%% Subs

syms xB yB zB ...
    dxB dyB dzB ...
    ddxB ddyB ddzB ...
    ...
    ph th ps...
    dph dth dps...
    ddph ddth ddps;

regVect = [str2sym('rBO_B_x(t)') str2sym('rBO_B_y(t)') str2sym('rBO_B_z(t)') ...
    str2sym('diff(rBO_B_x(t), t)') str2sym('diff(rBO_B_y(t), t)') str2sym('diff(rBO_B_z(t), t)') ...
    str2sym('diff(rBO_B_x(t), t, t)') str2sym('diff(rBO_B_y(t), t, t)') str2sym('diff(rBO_B_z(t), t, t)') ...
    ...
    str2sym('phi(t)') str2sym('theta(t)') str2sym('psi(t)') ...
    str2sym('diff(phi(t), t)') str2sym('diff(theta(t), t)') str2sym('psi(t), t)') ...
    str2sym('diff(phi(t), t, t)') str2sym('diff(theta(t), t, t)') str2sym('psi(t), t, t)') ...
    ...
    str2sym('rPB_B_y') ... 
    ...
    str2sym('Ixx') str2sym('Ixy') str2sym('Ixz') ...
    str2sym('Iyy') str2sym('Iyz') ...
    str2sym('Izz') ...
    ...
    str2sym('m') str2sym('g')...
    ];

subVect = [str2sym('xB') str2sym('yB') str2sym('zB') ...
    str2sym('dxB') str2sym('dyB') str2sym('dzB') ...
    str2sym('ddxB') str2sym('ddyB') str2sym('ddzB') ...
    ...
    str2sym('ph') str2sym('th') str2sym('ps') ...
    str2sym('dph') str2sym('dth') str2sym('dps') ...
    str2sym('ddph') str2sym('ddth') str2sym('ddps') ...
    ...
    0.40236 ... 
    ...
    0.72156870707000009268483609048417 -0.12767543784999998979223789774551 -0.00083961430000000002258492282081193 ...
    0.39416475912999998643115873164788 0.0013643208799999999823737706350357 ...
    1.1133577976099999773396120872349 ...
    ...
    1.991 -9.81...
    ];


LHS_EQ_Subbed = subs(LHS_EQ,regVect,subVect);
RHS_EQ_Subbed = subs(RHS_EQ,regVect,subVect);

EQ_final = simplify(LHS_EQ_Subbed == RHS_EQ_Subbed);
EQ_final_solved = solve(EQ_Final,[ddxB,ddyB,ddzB,ddph,ddth,ddps]);
EQ_final_solved_simple(1) = simplify(EQ_final_solved.ddxB);
EQ_final_solved_simple(2) = simplify(EQ_final_solved.ddyB);
EQ_final_solved_simple(3) = simplify(EQ_final_solved.ddzB);
EQ_final_solved_simple(4) = simplify(EQ_final_solved.ddph);
EQ_final_solved_simple(5) = simplify(EQ_final_solved.ddth);
EQ_final_solved_simple(6) = simplify(EQ_final_solved.ddps);

%% Sub again

regVect = [ ...
    str2sym('xB') str2sym('yB') str2sym('zB') ...
    str2sym('dxB') str2sym('dyB') str2sym('dzB') ...
    str2sym('ddxB') str2sym('ddyB') str2sym('ddzB') ...
    ...
    str2sym('ph') str2sym('th') str2sym('ps') ...
    str2sym('dph') str2sym('dth') str2sym('dps') ...
    str2sym('ddph') str2sym('ddth') str2sym('ddps') ...
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

EQ_solved_states = subs(EQ_final_solved_simple,regVect,subVect);
EQ_final_states = [ ...
    str2sym('x(7)') str2sym('x(8)') str2sym('x(9)') ...
    str2sym('x(10)') str2sym('x(11)') str2sym('x(12)') ...
    EQ_solve_simple_1 ...
    ];

%transpose(EqVect)
%transpose(EQ_final_states)

EQ_string_final_1 = append(string(transpose(EqVect))," = ",string( ...
    transpose(EQ_solve_final_1)));