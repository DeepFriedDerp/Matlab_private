function xd = fcn(t, x0, de)
% [xd] fcn(t, x0, de) accepts the simulation time, the states vector, and the 
% commanded deflection and returns the state derivatives. 
%   INPUTS
%       t  = s, simulation time
%       x0 = #, state vector (see commend in main code or here)
%       de = rad, rudder command

% old function 
% function [xd] = statesFile(t, x0, runfile, EQNS, OCBm, outflag, OvBO_B, F)
% [xd] = statesFile(t, x0, runfile, EQNS, OCBm, outflag) returns the 
% state derivatives xd for a given time t, state vector x0, and parameters 
% when outflag == 0. When outflag == 1, statesFile returns parameters
% calculated during the integration process. 

% % error handle
% if isnumeric(outflag) ~= 1
%     error('outflag needs to be numeric.');
% elseif abs(outflag) > 1
%     error('outflag needs to be either 0 or 1.');
% end

% load parameters
%---------------------------------------------------------------
% copy+paste into main file

% sail physical parameters
MT = 1.991;                 % kg, sail mass
Ixx = 0.7216;       % Q frame
Iyy = 0.3942;
Izz = 1.1134;
Ixy = -0.1277;
Ixz = -0.0008;
Iyz = 0.0014;
xPB = 0;
yPB = 0.40236;
xQB = -0.58123;
yQB = 0.40236;

% sail aero
% parameters for CL = 0.5, de -> pm = 0
AR = 5;                     % aspect ratio of the sail
Sref = 1;                   % m2, sail reference area
CXtot = 0.0318;
Cltot = 0.1757;
CYtot = 0.0000;
Cmtot = 0.0000;
CZtot = -0.5009;
Cntot = 0.0199;
CLtot = 0.5000;
CDtot = 0.0435;
CDvis = 0.0250;
CDind = 0.0185;
CLff = 0.5028;
CDff = 0.0225;
CYff = 0.0000;
e = 0.7675;
CLa = 3.8047;
CLb = 0.0000;
CYa = 0.0000;
CYb = -0.0250;
Cla = 1.1716;
Clb = -0.0746;
Cma = -1.6770;
Cmb = -0.0000;
Cna = -0.0867;
Cnb = 0.0113;
CLp = -2.4030;
CLq = 8.3082;
CLr = 0.7156;
CYp = 0.1491;
CYq = 0.0000;
CYr = -0.0226;
Clp = -1.1289;
Clq = 1.5950;
Clr = 0.3704;
Cmp = 0.5373;
Cmq = -13.6260;
Cmr = -0.1172;
Cnp = -0.0992;
Cnq = -0.0663;
Cnr = -0.0153;
CLd1 = 0.0104;
CYd1 = 0.0000;
Cld1 = 0.0003;
Cmd1 = -0.0325;
Cnd1 = 0.0000;
CDffd1 = -0.0005;
ed1 = 0.0501;
CLde = 0.0104;
CYde = 0.0000;
CDffde = -0.0005;
ede = 0.0501;
Clde = 0.0003;
Cmde = -0.0325;
Cnde = 0.0000;
% de = -7.6261;

% tether parameters
L1 = 152.4;                 % m, 500 ft height of the balloon
L2 = 76.2;                  % m, 250 ft length of the sail below the balloon
k = 35;                     % N/m, spring stiffness
dr = 1;                      % damping ratio of the tether
L0 = L2;                    % m, unstretched tether length

% environment
g = 9.81;                   % m/s2, gravity
rho = 1.225;                % kg/m3 air density
vinf_iO = 3;               % m/s, inertial winds
vinf_jO = 0;
vinf_kO = 0;                % MUST BE zero since no altiude winds

% NOT NEEDED, KEPT FOR REFERENCE
% % files: eqns5.mat are the proper equations
% derivefile = 'eqns5.mat';   % filename for EOMs, NEW MODEL, w/general gravity
% eqnsfile = 'eqns5.txt';     % equations in plain text, NEW MODEL, w/general gravity
% % stallfile = 'stall-erf-v2.mat';    % sa = 17deg +/- 3deg trans

% aero model choices
% aeromodel = 'none';     % no aero effects at all
% aeromodel = 'dumb';     % constant aero frame forces, no moments
aeromodel = 'abdepqr';     % full aero model about point above

% % % initial conditions
% DONT NEED THIS, COMMENTED OUT
% % % ICS(1) = xBO m, sail position
% % % ICS(2) = yBO m, r_B/O_B 
% % % ICS(3) = zBO m, 
% % % ICS(4) = uBO m/s, 
% % % ICS(5) = vBO m/s, 
% % % ICS(6) = wBO m/s, 
% % % ICS(7) = tta rad, roll angle
% % % ICS(8) = phi rad, pitch angle
% % % ICS(9) = psi rad, yaw angle
% % % ICS(10) = p rad/s, roll rate
% % % ICS(11) = q rad/s, pitch rate
% % % ICS(12) = r rad/s, yaw rate
% % ICS = [0, -(L2 + yPB + 0.57), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];     % vertical ICS
% ICS = [0, L1 - (L2 + yPB + 0.57), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];     % vertical ICS
% % % ICS = [-(L2 + yPB)*sind(30), -(L2 + yPB)*cosd(30), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];     % swept back 30 deg ICS
% % % ICS = [0, -(L2 + yPB) - 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];     % vertical stretched ICS

% balloon node
% DONT NEED THIS, COMMENTED OUT
% balnmode = 'still'; % fixed balloon
% % balnmode = 'move';  % moving balloon
% FB = 80;            % N, buoyancy of the balloon
% Sref_BALN = 1;      % m2, balloon area
% mG = 1;           % kg, gondola mass
% CD_BALN = 0.5;
% % ICS = [0, L1 - (L2 + yPB + 0.566), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];     % gondola up high
% % ICS = [ICS, 0, L1, 0, 0, 0, 0];                       % addition of xyzuvw of balloon

% % integrator
% DONT NEED THIS, COMMENTED OUT
% t0 = 0;     % s, start time
% te = 1;    % s, final time
% ode = 'ode45'; dt = 0.0005;
% % ode = 'ode5';   dt = 0.0005;

% do math!
b = sqrt(AR/Sref);
c = Sref/b;
wn = sqrt(k/MT);
% de = de*pi/180;
ct = 2*sqrt(k*MT)*dr;  % c of tether for damping ratio of dr
radps2Hz = 1/(2*pi);    % convert from rad/s to Hz



% load states into variable names
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
O_V_BO_B = NaN(3, 1);
% for i1 = 1:9
%     OCB(i1) = eval(OCBm{i1});
%     % QCB(i1) = eval(QCBm{i1});
%     if i1 < 4
%         O_V_BO_B(i1) = eval(OvBO_B{i1});
%     end
% end
% COPY+PASTE EXPRESSIONS FROM MAT FILE INTO CODE
O_V_BO_B(1) = uBO + q*zBO - r*yBO;
O_V_BO_B(2) = vBO - p*zBO + r*xBO;
O_V_BO_B(3) = wBO + p*yBO - q*xBO;
OCB(1) = cos(pzi)*cos(tta);
OCB(2) = sin(pzi);
OCB(3) = -cos(pzi)*sin(tta);
OCB(4) = sin(phi)*sin(tta) - cos(phi)*cos(tta)*sin(pzi);
OCB(5) = cos(phi)*cos(pzi);
OCB(6) = cos(tta)*sin(phi) + cos(phi)*sin(pzi)*sin(tta);
OCB(7) = cos(phi)*sin(tta) + cos(tta)*sin(phi)*sin(pzi);
OCB(8) = -cos(pzi)*sin(phi);
OCB(9) = cos(phi)*cos(tta) - sin(phi)*sin(pzi)*sin(tta);
BCO = transpose(OCB);



% angles 
% ----------------------------------------------------------------
vrel_B = [0; 0; 0];
alfa = 0;
beta = 0;
v_inertial_O = [vinf_iO; vinf_jO; vinf_kO];     % m/s, inertial winds
vrel_B = BCO*v_inertial_O - O_V_BO_B;       % m/s, relative wind - old

alfa = atan2(vrel_B(3), vrel_B(1));
BCS = MakeMatrix('y', alfa);
SCB = transpose(BCS);
vrel_S = SCB*vrel_B;
beta = atan2(vrel_S(2), vrel_S(1));
WCS = MakeMatrix('z', beta);



% aero model
% ----------------------------------------------------------------

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

% rGP -> tension is away from sail to balloon
% T_B = k*ds.*rGP_B/norm(rGP_B);
% T_B = (k*ds + ct*dsd).*rGP_B/norm(rGP_B)

T_B = (k*ds).*rGP_B/norm(rGP_B) + ct*OvGP_B*sign(ds);
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
% equations of motion from eqns5.txt
xd(4) = -(Fax*Ixx*Iyy*Izz - Ixy^2*Izz*Tx - Ixy^2*Izz*Wx - Ixy^2*MT*Maz*yBO - Fax*Ixy^2*Izz + Ixx*Iyy*Izz*Tx + Ixx*Iyy*Izz*Wx + Ixy^3*MT*p^2*yBO - Ixy^3*MT*q^2*yBO + Ixx*Iyy*MT*Maz*yBO - Ixx*Izz*MT*May*zBO + Ixy*Izz*MT*Max*zBO + 2*Ixy^2*Izz*MT*q*wBO - 2*Ixy^2*Izz*MT*r*vBO - Ixy^2*MT*Ty*xPB*yBO + Ixy^2*MT*Tx*yBO*yPB - Ixy^2*Izz*MT*q^2*xBO - Ixy^2*Izz*MT*r^2*xBO - 2*Ixx*Iyy*Izz*MT*q*wBO + 2*Ixx*Iyy*Izz*MT*r*vBO + Ixx*Iyy*MT*Ty*xPB*yBO - Ixx*Iyy*MT*Tx*yBO*yPB + Ixx*Izz*MT*Tz*xPB*zBO + Ixy*Izz*MT*Tz*yPB*zBO - Ixx*Ixy*Iyy*MT*p^2*yBO + Ixx*Iyy*Izz*MT*q^2*xBO + Ixx*Ixy*Iyy*MT*q^2*yBO + Ixx*Iyy*Izz*MT*r^2*xBO - Ixx*Ixy^2*MT*p*q*yBO - Ixx*Iyy^2*MT*p*q*yBO + Ixx^2*Iyy*MT*p*q*yBO + Ixy^2*Iyy*MT*p*q*yBO + Ixy^2*Izz*MT*p*q*yBO - Ixx*Izz^2*MT*p*r*zBO + Ixx^2*Izz*MT*p*r*zBO + 2*Ixy^2*Izz*MT*p*r*zBO - Ixy*Izz^2*MT*q*r*zBO - Ixx*Iyy*Izz*MT*p*q*yBO - Ixx*Iyy*Izz*MT*p*r*zBO + Ixx*Ixy*Izz*MT*q*r*zBO + Ixy*Iyy*Izz*MT*q*r*zBO)/(Izz*MT*(Ixy^2 - Ixx*Iyy));
xd(5) = -(Ixy^2*MT*Maz*xBO - Ixy^2*Izz*Ty - Ixy^2*Izz*Wy - Fay*Ixy^2*Izz + Fay*Ixx*Iyy*Izz + Ixx*Iyy*Izz*Ty + Ixx*Iyy*Izz*Wy - Ixy^3*MT*p^2*xBO + Ixy^3*MT*q^2*xBO - Ixx*Iyy*MT*Maz*xBO - Ixy*Izz*MT*May*zBO + Iyy*Izz*MT*Max*zBO - 2*Ixy^2*Izz*MT*p*wBO + 2*Ixy^2*Izz*MT*r*uBO + Ixy^2*MT*Ty*xBO*xPB - Ixy^2*MT*Tx*xBO*yPB - Ixy^2*Izz*MT*p^2*yBO - Ixy^2*Izz*MT*r^2*yBO + 2*Ixx*Iyy*Izz*MT*p*wBO - 2*Ixx*Iyy*Izz*MT*r*uBO - Ixx*Iyy*MT*Ty*xBO*xPB + Ixx*Iyy*MT*Tx*xBO*yPB + Ixy*Izz*MT*Tz*xPB*zBO + Iyy*Izz*MT*Tz*yPB*zBO + Ixx*Ixy*Iyy*MT*p^2*xBO - Ixx*Ixy*Iyy*MT*q^2*xBO + Ixx*Iyy*Izz*MT*p^2*yBO + Ixx*Iyy*Izz*MT*r^2*yBO + Ixx*Ixy^2*MT*p*q*xBO + Ixx*Iyy^2*MT*p*q*xBO - Ixx^2*Iyy*MT*p*q*xBO - Ixy^2*Iyy*MT*p*q*xBO + Ixy^2*Izz*MT*p*q*xBO - Ixy*Izz^2*MT*p*r*zBO + 2*Ixy^2*Izz*MT*q*r*zBO - Iyy*Izz^2*MT*q*r*zBO + Iyy^2*Izz*MT*q*r*zBO - Ixx*Iyy*Izz*MT*p*q*xBO + Ixx*Ixy*Izz*MT*p*r*zBO + Ixy*Iyy*Izz*MT*p*r*zBO - Ixx*Iyy*Izz*MT*q*r*zBO)/(Izz*MT*(Ixy^2 - Ixx*Iyy));
xd(6) = (Faz*Ixy^2 + Ixy^2*Tz + Ixy^2*Wz - Faz*Ixx*Iyy - Ixx*Iyy*Tz - Ixx*Iyy*Wz - 2*Ixy^2*MT*p*vBO + 2*Ixy^2*MT*q*uBO + Ixy^2*MT*p^2*zBO + Ixy^2*MT*q^2*zBO - Ixx*MT*May*xBO + Ixy*MT*Max*xBO - Ixy*MT*May*yBO + Iyy*MT*Max*yBO + 2*Ixx*Iyy*MT*p*vBO - 2*Ixx*Iyy*MT*q*uBO + Ixx*MT*Tz*xBO*xPB + Ixy*MT*Tz*xBO*yPB + Ixy*MT*Tz*xPB*yBO + Iyy*MT*Tz*yBO*yPB - Ixx*Iyy*MT*p^2*zBO - Ixx*Iyy*MT*q^2*zBO + Ixx^2*MT*p*r*xBO + Iyy^2*MT*q*r*yBO + Ixx*Iyy*MT*p*r*xBO - Ixx*Izz*MT*p*r*xBO + Ixx*Ixy*MT*p*r*yBO + Ixx*Ixy*MT*q*r*xBO + Ixy*Iyy*MT*p*r*yBO + Ixy*Iyy*MT*q*r*xBO - Ixy*Izz*MT*p*r*yBO - Ixy*Izz*MT*q*r*xBO + Ixx*Iyy*MT*q*r*yBO - Iyy*Izz*MT*q*r*yBO)/(MT*(Ixy^2 - Ixx*Iyy));
xd(7) = (q*cos(phi) - r*sin(phi))/(cos(pzi)*(cos(phi)^2 + sin(phi)^2));
xd(8) = (r*sin(phi)*sin(pzi) - q*cos(phi)*sin(pzi) + p*cos(phi)^2*cos(pzi) + p*cos(pzi)*sin(phi)^2)/(cos(pzi)*(cos(phi)^2 + sin(phi)^2));
xd(9) = (r*cos(phi) + q*sin(phi))/(cos(phi)^2 + sin(phi)^2);
xd(10) = -(Iyy*Max - Ixy*May + Ixy*Tz*xPB + Iyy*Tz*yPB + Ixy^2*q*r + Iyy^2*q*r + Ixx*Ixy*p*r + Ixy*Iyy*p*r - Ixy*Izz*p*r - Iyy*Izz*q*r)/(Ixy^2 - Ixx*Iyy);
xd(11) = (Ixy*Max - Ixx*May + Ixx*Tz*xPB + Ixy*Tz*yPB + Ixx^2*p*r + Ixy^2*p*r - Ixx*Izz*p*r + Ixx*Ixy*q*r + Ixy*Iyy*q*r - Ixy*Izz*q*r)/(Ixy^2 - Ixx*Iyy);
xd(12) = (Maz + Ty*xPB - Tx*yPB - Ixy*p^2 + Ixy*q^2 + Ixx*p*q - Iyy*p*q)/Izz;

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

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [infoout] = PostProcess(runfile, EQNS, OCBm, tin, outsB, OvBO_B, F)
% [infoout] = PostProcess(runfile, EQNS, OCBm, tin, outsB)
% returns a structure infoout of information of interest post simulation. 
% fields:
%   relative velocity
%   aero forces
%   aero moments
%   etc. 

% xd.x0 = x0;
% xd.xdv = xdv;
% xd.Maero_B = [Max; May; Maz];
% xd.Faero_B = [Fax; Fay; Faz];
% xd.Tens_B = [Tx; Ty; Tz];
% xd.ds = ds;
% xd.BCO = BCO;
% xd.rGO_B = rGO_B;
% xd.rPB_B = rPB_B;
% xd.rGP_B = rGP_B;
% xd.alfa = alfa;
% xd.beta = beta;
% xd.runfile = runfile;
% xd.t = t;
% xd.vrel_B = vrel_B;

% preallocate
n = length(tin);
Tens_B = NaN(3, n);
Faero_B = Tens_B;
Maero_B = Tens_B;
vrel_B = Tens_B;
alfa = NaN(n, 1);
beta = alfa;
ds = alfa;
dsd = ds;
MT_B = Tens_B;
de = alfa;
coeffs = Tens_B;
st = alfa;
Tmag = alfa;
momcoe = Tens_B;
for i1 = 1:length(tin)
    xd = statesFile(tin(i1), outsB(i1, :), runfile, EQNS, OCBm, 1, OvBO_B, F);
    Tens_B(:, i1) = xd.Tens_B;
    Faero_B(:, i1) = xd.Faero_B;
    Maero_B(:, i1) = xd.Maero_B;
    vrel_B(:, i1) = xd.vrel_B;
    alfa(i1) = xd.alfa;
    beta(i1) = xd.beta;
    ds(i1) = xd.ds;
    MT_B(:, i1) = xd.MT_B;
    coeffs(:, i1) = xd.coeffs;
    de(i1) = xd.de;
    st(i1) = xd.stallterm;
    Tmag(i1) = xd.Tmag;
    momcoe(:, i1) = xd.momcoe;
    dsd(i1) = xd.dsd;
end

% structure
infoout.vrel_B = vrel_B;
infoout.Tens_B = Tens_B;
infoout.Faero_B = Faero_B;
infoout.Maero_B = Maero_B;
infoout.alfa = alfa;
infoout.beta = beta;
infoout.ds = ds;
infoout.MT_B = MT_B;
infoout.coeffs = coeffs;
infoout.de = de;
infoout.stallterm = st;
infoout.Tmag = Tmag;
infoout.momcoe = momcoe;
infoout.dsd = dsd;

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [xd] = statesFile(t, x0, runfile, EQNS, OCBm, outflag, OvBO_B, F)
% [xd] = statesFile(t, x0, runfile, EQNS, OCBm, outflag) returns the 
% state derivatives xd for a given time t, state vector x0, and parameters 
% when outflag == 0. When outflag == 1, statesFile returns parameters
% calculated during the integration process. 

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
stallterm = F(alfa*180/pi);    % return the reduction in stall [0, 1] due 
% to stall of alpha. stall alpha is around 15 deg and transitons within 2
% degrees
% Only adds ~0.5s for a 10s simulation to use F()

% aero switch case
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
    keyboard
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

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

