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
CXtot = -0.0250;
Cltot = -0.0000;
CYtot = 0.0000;
Cmtot = 0.0000;
CZtot = -0.0000;
Cntot = -0.0000;
CLtot = 0.0000;
CDtot = 0.0250;
CDvis = 0.0250;
CDind = 0.0000;
CLff = 0.0000;
CDff = 0.0000;
CYff = 0.0000;
e = 0.0000;
CLa = 3.8944;
CLb = -0.0000;
CYa = 0.0000;
CYb = -0.0250;
Cla = 1.2047;
Clb = -0.0000;
Cma = -1.6770;
Cmb = 0.0000;
Cna = -0.0000;
Cnb = 0.0000;
CLp = -2.4573;
CLq = 8.3735;
CLr = 0.0000;
CYp = -0.0000;
CYq = 0.0000;
CYr = 0.0000;
Clp = -1.1571;
Clq = 1.6050;
Clr = 0.0000;
Cmp = 0.5550;
Cmq = -13.7810;
Cmr = -0.0000;
Cnp = 0.0000;
Cnq = -0.0000;
Cnr = -0.0000;
CLd1 = 0.0106;
CYd1 = 0.0000;
Cld1 = 0.0003;
Cmd1 = -0.0333;
Cnd1 = -0.0000;
CDffd1 = 0.0000;
ed1 = 0.0000;
CLde = 0.0106;
CYde = 0.0000;
CDffde = 0.0000;
ede = 0.0000;
Clde = 0.0003;
Cmde = -0.0333;
Cnde = -0.0000;
de = 0.0000;


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
te = 60;    % s, final time
ode = 'ode45'; dt = 0.1;
% ode = 'ode5';   dt = 0.025;


% do math!
b = sqrt(AR/Sref);
c = Sref/b;
% de = de*pi/180;
wn = sqrt(k/MT);
ct = 2*sqrt(k*MT)*dr;  % c of tether for damping ratio of dr
radps2Hz = 1/(2*pi);    % convert from rad/s to Hz
if e == 0
    e = 0.70;   % AVL returns e = 0 if no CL, sim artifact
end