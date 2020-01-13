function xd  = statesFile_testforMatlab(t, x0, outflag)
% [xd] = statesFile(t, x0, runfile, EQNS, OCBm, outflag) returns the 
% state derivatives xd for a given time t, state vector x0, and parameters 
% when outflag == 0. When outflag == 1, statesFile returns parameters
% calculated during the integration process. 

global eqnsfile runfile derivefile

if t == 0
    [EQNS,OCBm,OvBO_B] = eqnsFileInit('inputFile_test.m',0);
else
    [EQNS,OCBm,OvBO_B] = eqnsFileInit('inputFile_test.m',1);
end

% error handle
if isnumeric(outflag) ~= 1
    error('outflag needs to be numeric.');
elseif abs(outflag) > 1
    error('outflag needs to be either 0 or 1.');
end

% load parameters
eval(runfile);

% load 
% ---------------------------------------------------------------
xBO = x0(1);    % ICS(1) = xBO m, sail position
yBO = x0(2);    % ICS(2) = yBO m, r_B/O_B 
zBO = x0(3);    % ICS(3) = zBO m, 
uBO = x0(4);    % ICS(4) = uBO m/s, 
vBO = x0(5);    % ICS(5) = vBO m/s, 
wBO = x0(6);    % ICS(6) = wBO m/s, 
tta = x0(7);    % ICS(7) = tta rad, roll angle
phi = x0(8);    % ICS(8) = phi rad, pitch angle
pzi = x0(9);    % ICS(9) = psi rad, yaw angle
p = x0(10);      % ICS(10) = p rad/s, roll rate
q = x0(11);      % ICS(11) = q rad/s, pitch rate
r = x0(12);      % ICS(12) = r rad/s, yaw rate

% load rotation matrices
% ---------------------------------------------------------------
% MATLAB uses single index notation for matrices by
% going down the first column, then second column, etc. Thus, the
% indices would be (for a 4x3 matrix):
% [1, 5, 9]
% [2, 6, 10]
% [3, 7, 11]
% [4, 8, 12]
OCB = NaN(3, 3);
% QCB = OCB;
O_V_BO_B = NaN(3, 1);
for i1 = 1:9
    OCB(i1) = eval(OCBm{i1});
    % QCB(i1) = eval(QCBm{i1});
    if i1 < 4
        O_V_BO_B(i1) = eval(OvBO_B{i1});
    end
end
BCO = transpose(OCB);
% BCQ = transpose(QCB);
% QCO = QCB*BCO;

% angles 
% ----------------------------------------------------------------
vrel_B = [0; 0; 0];
alfa = 0;
beta = 0;
v_inertial_O = [vinf_iO; vinf_jO; vinf_kO];     % m/s, inertial winds
vrel_B = BCO*v_inertial_O - O_V_BO_B;       % m/s, relative wind - old
% % alfa = atan2(vrel_B(3), -vrel_B(1));        % rad, alfa
% % beta = -atan2(vrel_B(2), -vrel_B(1));       % rad, beta 
% % alfa = atan2(vrel_B(3), vrel_B(1));           % rad, Edkin alpha 
% % beta = asin(vrel_B(2)/norm(vrel_B));          % rad, Edkin beta
% alfa = -atan2(vrel_B(3), vrel_B(1));
% beta = atan2(vrel_B(2), vrel_B(1));

alfa = atan2(vrel_B(3), vrel_B(1));
BCS = MakeMatrix('y', alfa);
SCB = transpose(BCS);
vrel_S = SCB*vrel_B;
beta = atan2(vrel_S(2), vrel_S(1));
WCS = MakeMatrix('z', beta);

% TO DO
% 3. Simulate to confirm operation wiht simple model
% 
% 4. Add in full blown aero model for a single linearized point
%   a. run AVL for known case 
%   b. add read in stabs file expressions and setup full aero model
%   c. simulate to confirm operation



% aero model
% ----------------------------------------------------------------
% stall model
% ASSUME:
%   1. stall is a decrease in lift and sideforce on the sail around a
%       critical alpha. This is modeled as an erf "rolloff" type of effect. 
%       Stall is continuous to prevent ode45 from freaking out.
%   2. stall is assumed to only degrade lift and side force. Drag is
%       assumed to still act and be large (to correct the sail). 
% stallterm = 1;
%stallterm = F(alfa*180/pi);    % return the reduction in stall [0, 1] due 
% to stall of alpha. stall alpha is around 15 deg and transitons within 2
% degrees
% Only adds ~0.5s for a 10s simulation to use F()

% aero switch case
stallterm = 1;
CL = 0;
CD = 0;
CY = 0;
Cl = 0;
Cm = 0;
Cn = 0;
switch aeromodel
    case 'none'
        % do nothing
        Maero_S = [0; 0; 0];
        Fax = 0;
        Fay = 0;
        Faz = 0;
        Faero_S = [Fax; Fay; Faz];
    case 'dumb'
        % % dumb aero model
        % Fax = 5;   % N, drag   
        Fax = 0;
        Fay = 0;
        Faz = 5;
        Maero_S = [0; 0; 0];
        Faero_S = [Fax; Fay; Faz];
    case 'abde'
        % simple aero model
        vrelB = norm(vrel_B);   % m/s, magnitude of relative wind
        q_Pa = 0.5*rho*vrelB*vrelB;
        CL = CLa*alfa + CLb*beta + CLd1*de;
        CD = CDvis + CL*CL/(pi*AR*e);
        CY = CYa*alfa + CYb*beta +CYd1*de;
        CL = CL*stallterm;
        CY = CY*stallterm;
        L = q_Pa*CL*Sref;
        D = q_Pa*CD*Sref;
        Y = q_Pa*CY*Sref;
        Faero_S = [D; Y; L];
        % moments
        Cl = Cla*alfa + Clb*beta + Cld1*de;
        Cm = Cma*alfa + Cmb*beta + Cmd1*de;
        Cn = Cna*alfa + Cnb*beta + Cnd1*de;
        l = q_Pa*Cl*Sref*b;
        m = q_Pa*Cm*Sref*c;
        n = q_Pa*Cn*Sref*b;
        Maero_S = [l; m; n];
    case 'abdepqr'
        % simple aero model
        vrelB = norm(vrel_B);   % m/s, magnitude of relative wind
        q_Pa = 0.5*rho*vrelB*vrelB;
        CL = CLa*alfa + CLb*beta + CLd1*de + CLp*p + CLq*q + CLr*r;
        CD = CDvis + CL*CL/(pi*AR*e);
        CY = CYa*alfa + CYb*beta +CYd1*de + CYp*p + CYq*q + CYr*r;
        CL = CL*stallterm;
        CY = CY*stallterm;
        L = q_Pa*CL*Sref;
        D = q_Pa*CD*Sref;
        Y = q_Pa*CY*Sref;
        Faero_S = [D; Y; L];
        % moments
        Cl = Cla*alfa + Clb*beta + Cld1*de + Clp*p + Clq*q + Clr*r;
        Cm = Cma*alfa + Cmb*beta + Cmd1*de + Cmp*p + Cmq*q + Cmr*r;
        Cn = Cna*alfa + Cnb*beta + Cnd1*de + Cnp*p + Cnq*q + Cnr*r;
        l = q_Pa*Cl*Sref*b;
        m = q_Pa*Cm*Sref*c;
        n = q_Pa*Cn*Sref*b;
        Maero_S = [l; m; n];
    otherwise
        error('aeromodel not specified.');
end
% SCB = transpose(BCS);
% SCW = transpose(WCS);


% % rotation from S to B frame is:
Faero_B = BCS*Faero_S;
Fax = Faero_B(1);
Fay = Faero_B(2);
Faz = Faero_B(3);
Maero_B = BCS*Maero_S;
Max = Maero_B(1);
May = Maero_B(2);
Maz = Maero_B(3);



% tension
% ----------------------------------------------------------------
% rGO_O = [0; L1; 0];
rGO_O = [0; 0; 0];      % for spherical pendulum model
rGO_B = BCO*rGO_O;
rBO_B = [xBO; yBO; zBO];
rPB_B = [xPB; yPB; 0];
rBP_B = -rPB_B;
% rBO = rBP + rPG + rGO 
% rBO - rBP - rGO = rPG
% rGP = - rBO + rBP + rGO
rGP_B = rBP_B + rGO_B - rBO_B;      % fixed for sphericla pendulum
OwB_B = [p; q; r];
OvBP_B = [0; 0; 0] + cross(OwB_B, rBP_B);
OvGO_B = [0; 0; 0] + cross(OwB_B, rGO_B); % fixed for spherical pendulum
OvBO_B = [uBO; vBO; wBO] + cross(OwB_B, rBO_B);
OvGP_B = OvBP_B + OvGO_B - OvBO_B;      % fixed for sphericla pendulum
% %   -> rBO - rBP - rGO = rPG 
% % rGP_B = rGO_B + rBP_B - rBO_B;
ds = max([norm(rGP_B) - L2, 0]);
% sign(ds) always either 0, or 1
% if ds = 0, min([+VE #, 0]) == 0 -> no stretch
% if ds = #, min([+VE #, 1e6]) == +VE # -> stretch!
% % dsd = min([norm(OvGP_B), sign(ds)*1e6]);  
% keyboard
% rGP -> tension is away from sail to balloon
% T_B = k*ds.*rGP_B/norm(rGP_B);
% T_B = (k*ds + ct*dsd).*rGP_B/norm(rGP_B)
% rGP_B(2)
% OvGP_B(2)
% k*ds.*rGP_B/norm(rGP_B)
% c*OvGP_B*sign(ds)
T_B = (k*ds).*rGP_B/norm(rGP_B) + ct*OvGP_B*sign(ds);
% OvGP_B(2)
dsd = OvGP_B(2);
% keyboard
% T_B = [0; 0; 0];
Tx = T_B(1);
Ty = T_B(2);
Tz = T_B(3);

% tension moment - post process calculation
MT_B = CrossMe(rPB_B, T_B);

% weight
% ---------------------------------------------------------------
W_O = [0; -MT*g; 0];
W_B = BCO*W_O;
Wx = W_B(1);
Wy = W_B(2);
Wz = W_B(3);



% equations
% ---------------------------------------------------------------
% u_dot, v_dot, w_dot, theta_dot, phi_dot, psi_dot, p_dot, q_dot, r_dot
xd = NaN(length(x0), 1);
xd(1:3) = [uBO; vBO; wBO];
for i1 = 1:9
    xd(i1 + 3) = eval(EQNS{i1});
end

% catch nan
if sum(isnan(xd)) > 0
    fprintf('Something is nan\n');
    ykeyboard
end

% handle output structures
if outflag == 1
    xdv = xd;
    xd = struct;
    xd.x0 = x0;
    xd.xdv = xdv;
    xd.Maero_B = [Max; May; Maz];
    xd.Faero_B = [Fax; Fay; Faz];
    xd.Tens_B = [Tx; Ty; Tz];
    xd.ds = ds;
    xd.BCO = BCO;
    xd.rGO_B = rGO_B;
    xd.rPB_B = rPB_B;
    xd.rGP_B = rGP_B;
    xd.alfa = alfa;
    xd.beta = beta;
    xd.runfile = runfile;
    xd.t = t;
    xd.vrel_B = vrel_B;
    xd.MT_B = MT_B;
    xd.coeffs = [CL; CD; CY];
    xd.momcoe = [Cl; Cm; Cn];
    xd.de = de;
    xd.stallterm = stallterm;
    xd.Tmag = norm(xd.Tens_B);
    xd.dsd = dsd;
end
end

function [matz] = MakeMatrix(ax, ang)
% [matz] = MakeMatrix(ax, ang) returns the rotation matrix matz about 
% the axis ax through the angle ang. These are defined by Mazz as BCO. 

% error handle, check type
if isa(ang, 'sym') == 1
    matz = sym('matz', [3, 3]);
elseif isnumeric(ang) == 1
    matz = NaN(3, 3);
else
    error('ang neither symbol nor numeric.');
end

% build matrix
switch ax
    case 'x'
        matz(1, 1) = 1;
        matz(1, 2) = 0;
        matz(1, 3) = 0;
        matz(2, 1) = 0;
        matz(2, 2) = cos(ang);
        matz(2, 3) = sin(ang);
        matz(3, 1) = 0;
        matz(3, 2) = -sin(ang);
        matz(3, 3) = cos(ang);
    case 'y'
        matz(1, 1) = cos(ang);
        matz(1, 2) = 0;
        matz(1, 3) = -sin(ang);
        matz(2, 1) = 0;
        matz(2, 2) = 1;
        matz(2, 3) = 0;
        matz(3, 1) = sin(ang);
        matz(3, 2) = 0;
        matz(3, 3) = cos(ang);
    case 'z'
        matz(1, 1) = cos(ang);
        matz(1, 2) = sin(ang);
        matz(1, 3) = 0;
        matz(2, 1) = -sin(ang);
        matz(2, 2) = cos(ang);
        matz(2, 3) = 0;
        matz(3, 1) = 0;
        matz(3, 2) = 0;
        matz(3, 3) = 1;
    otherwise
        error('ang undefined');
end

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

function [vec] = MakeVec(x, y, z)
% [vec] = MakeVec(x, y, z) returns a vector vec of elements x, y, z. 

% error handle, check type
if isa(x, 'sym') == 1
    vec = sym('vecz', [3, 1]);
elseif isnumeric(x) == 1
    vec = NaN(3, 1);
else
    error('x neither symbol nor numeric.');
end

% populate
vec(1) = x;
vec(2) = y;
vec(3) = z;

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

function [prod] = CrossMe(vec1, vec2)
% [prod] = CrossMe(vec1, vec2) returns the cross product for two vectors

prod = sym('prod', [3, 1]);
prod(1) = vec1(2)*vec2(3) - vec1(3)*vec2(2);
prod(2) = -vec1(1)*vec2(3) + vec1(3)*vec2(1);
prod(3) = vec1(1)*vec2(2) - vec1(2)*vec2(1);

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [vec] = MakeMat(xx, yy, zz, xy, yz, xz)
% [vec] = MakeMat(xx, yy, zz, xy, yz, xz) returns a matrix
% vec of elements similar to an inertia tensor. 

% error handle, check type
if isa(xx, 'sym') == 1
    vec = sym('vecz', [3, 3]);
elseif isnumeric(xx) == 1
    vec = NaN(3, 3);
else
    error('x neither symbol nor numeric.');
end

% populate
vec(1, 1) = xx;
vec(1, 2) = xy;
vec(1, 3) = xz;
vec(2, 1) = xy;
vec(2, 2) = yy;
vec(2, 3) = yz;
vec(3, 1) = xz;
vec(3, 2) = yz;
vec(3, 3) = zz;

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [outsO] = RotateMe(outsB, OCBs)
% [outsO] = RotateMe(outsB, OCB) rotates the output states from the B frame
% to the O frame. OCBs is a cell of strings of the expressions for OCB. 
%
% states vector is:
%     x(1) = xBO m, sail position
%     x(2) = yBO m, r_B/O_B 
%     x(3) = zBO m, 
%     x(4) = uBO m/s, 
%     x(5) = vBO m/s, 
%     x(6) = wBO m/s, 
%     x(7) = tta rad, roll angle
%     x(8) = phi rad, pitch angle
%     x(9) = psi rad, yaw angle
%     x(10) = p rad/s, roll rate
%     x(11) = q rad/s, pitch rate
%     x(12) = r rad/s, yaw rate

outsO = outsB*NaN;
for i1 = 1:length(outsB(:, 1))   
    % angles
    tta = outsB(i1, 7); % rad
    phi = outsB(i1, 8); % rad
    pzi = outsB(i1, 9); % rad
    outsO(i1, 7:9) = outsB(i1, 7:9);
    
    % rotation matrix
    OCB = NaN(3, 3);
    for j1 = 1:9
        OCB(j1) = eval(OCBs{j1});
    end
    
    % positions
    posB = outsB(i1, 1:3)';
    posO = OCB*posB;
    outsO(i1, 1:3) = posO';
    
    % velocities
    velB = outsB(i1, 4:6)';
    velO = OCB*velB;
    outsO(i1, 4:6) = velO';
    
    % angle rates
    angB = outsB(i1, 10:12)';
    angO = OCB*angB;
    outsO(i1, 10:12) = angO';
    % keyboard
    
end

end