% runfile.m for sail 
% classic sail design, test case 
% Christopher D. Yoder, 2019-12-24 
% Revised for new model 2020-01-05
% Revised AGAIN for the new model, 2020-01-07

% NOTES
% 1. g should be the magnitude of the gravity acceleration in O frame
%       (derivation puts force as -MG)

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
% parameters for CL = 0, de -> pm = 0
AR = 5;                     % aspect ratio of the sail
Sref = 1;                   % m2, sail reference area
CXtot = -0.0227;
Cltot = 0.0353;
CYtot = 0.0000;
Cmtot = -0.0000;
CZtot = -0.1007;
Cntot = 0.0008;
CLtot = 0.1000;
CDtot = 0.0257;
CDvis = 0.0250;
CDind = 0.0007;
CLff = 0.1000;
CDff = 0.0009;
CYff = 0.0000;
e = 0.7675;
CLa = 3.8909;
CLb = -0.0000;
CYa = 0.0000;
CYb = -0.0250;
Cla = 1.2034;
Clb = -0.0150;
Cma = -1.6770;
Cmb = -0.0000;
Cna = -0.0178;
Cnb = 0.0004;
CLp = -2.4551;
CLq = 8.3709;
CLr = 0.1431;
CYp = 0.0300;
CYq = 0.0000;
CYr = -0.0009;
Clp = -1.1559;
Clq = 1.6046;
Clr = 0.0741;
Cmp = 0.5543;
Cmq = -13.7749;
Cmr = -0.0236;
Cnp = -0.0193;
Cnq = -0.0133;
Cnr = -0.0006;
CLd1 = 0.0106;
CYd1 = -0.0000;
Cld1 = 0.0003;
Cmd1 = -0.0332;
Cnd1 = 0.0000;
CDffd1 = -0.0001;
ed1 = 0.2546;
CLde = 0.0106;
CYde = -0.0000;
CDffde = -0.0001;
ede = 0.2546;
Clde = 0.0003;
Cmde = -0.0332;
Cnde = 0.0000;
de = -1.5007;


% tether parameters
L1 = 152.4;                 % m, 500 ft height of the balloon
L2 = 76.2;                  % m, 250 ft length of the sail below the balloon
k = 35;                     % N/m, spring stiffness
dr = 10;                      % damping ratio of the tether
L0 = L2;                    % m, unstretched tether length


% environment
g = 9.81;                   % m/s2, gravity
rho = 1.225;                % kg/m3 air density
vinf_iO = 3;               % m/s, inertial winds
vinf_jO = 0;
vinf_kO = 0;                % MUST BE zero since no altiude winds


% files: eqns5.mat are the proper equations
derivefile = 'eqns5.mat';   % filename for EOMs, NEW MODEL, w/general gravity
eqnsfile = 'eqns5.txt';     % equations in plain text, NEW MODEL, w/general gravity
% stallfile = 'stall-erf-v2.mat';    % sa = 17deg +/- 3deg trans


% aero model choices
% aeromodel = 'none';     % no aero effects at all
% aeromodel = 'dumb';     % constant aero frame forces, no moments
% aeromodel = 'abde';     % full aero model about point above
aeromodel = 'abdepqr';     % full aero model about point above


% initial conditions
% ICS(1) = xBO m, sail position
% ICS(2) = yBO m, r_B/O_B 
% ICS(3) = zBO m, 
% ICS(4) = uBO m/s, 
% ICS(5) = vBO m/s, 
% ICS(6) = wBO m/s, 
% ICS(7) = tta rad, roll angle
% ICS(8) = phi rad, pitch angle
% ICS(9) = psi rad, yaw angle
% ICS(10) = p rad/s, roll rate
% ICS(11) = q rad/s, pitch rate
% ICS(12) = r rad/s, yaw rate
ICS = [0, -(L2 + yPB + 0.57), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];     % vertical ICS
% ICS = [-(L2 + yPB)*sind(30), -(L2 + yPB)*cosd(30), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];     % swept back 30 deg ICS
% ICS = [0, -(L2 + yPB) - 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];     % vertical stretched ICS


% integrator
t0 = 0;     % s, start time
te = 90;    % s, final time
ode = 'ode45'; dt = 0.1;
% ode = 'ode5';   dt = 0.025;


% do math!
b = sqrt(AR/Sref);
c = Sref/b;
% de = de*pi/180;
wn = sqrt(k/MT);
ct = 2*sqrt(k*MT)*dr;  % c of tether for damping ratio of dr
radps2Hz = 1/(2*pi);    % convert from rad/s to Hz