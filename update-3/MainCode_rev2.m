 function MainCode_rev2(varargin)
% Main code to simulate a sail on a tether
% Christopher D. Yoder
% 2019-12-23

% check varargin, welcome user
% --------------------------------------------------------
if isempty(varargin) == 1
    % if no filename in varargin, then do your thing!
    clc
    close all
    clear
    fclose('all');
    PrepPlots
    fprintf('Welcome! :D \n');
    fprintf('Time to model a tethered sail!\n');
    % runfile   
    % runfile = 'runfile_case1';    % no deflection
    runfile = 'runfile_case2';      % trimmed in pitch
    % runfile = 'runfile_case3';    % untrimmed case
else
    % if there is a file in varargin, load and go
    clc
    close all
    fclose('all');
    PrepPlots
    fprintf('Welcome! :D \n');
    fprintf('Looks like you brought your own file...\n');
    % runfile
    runfile = varargin{1};
    if strcmp(runfile(end-1:end), '.m') ~= 1
        error('runfile must be an .m file (end in .m).');
    end
end

% error handle
% --------------------------------------------------------
if exist(runfile, 'file') ~= 2
    error('runfile does not exist. Please use a file that exists.');
end
t = 0;
eval(runfile);
fprintf('Damping ratio: %0.3f\n', dr);
fprintf('Damping constant: %0.3f\n', ct);

% load equations
% --------------------------------------------------------
if exist(derivefile, 'file') == 2
    fprintf('Equation file found; loading equations.\n');
    tic
    e1 = load(derivefile);
    t5 = toc;
    fprintf('Time to load equaitons: %0.4f seconds.\n', t5);
else
    fprintf('Equation file not found; deriving equations.\n');
    tic
    DeriveEoms(derivefile);
    t5 = toc;
    fprintf('Time to derive equaitons: %0.4f seconds.\n', t5);
    e1 = load(derivefile);
end

% read in equations for later
% --------------------------------------------------------
F = griddedInterpolant([-360, 360], [1, 1]);    % default object, all ones
if exist('stallfile', 'var') == 0
    % warning('stallfile not named in runfile. Using F = 1 (no stall).');
    fprintf('stallfile not named in runfile. Using F = 1 (no stall)\n');
elseif exist(stallfile, 'file') == 2
    e2 = load(stallfile);
    if isfield(e2, 'F') ~= 1
        % warning('stallfile does not have a  object F. Using F = 1 (no stall).');
        fprintf('stallfile does not have a  object F. Using F = 1 (no stall)\n');
    else
        F = e2.F;
    end
else
    % warning('stallfile named in runfile but does not exist. Using F = 1 (no stall).');
    fprintf('stallfile named in runfile but does not exist. Using F = 1 (no stall)\n');
end
% BCO = e1.BCA*e1.ACO;
BCO = e1.BCO;
OCB = transpose(BCO);
% QCB = e1.QCB;
fid1 = fopen('matfile.txt', 'w');
OCBm = cell(9, 1);
EQNS = cell(9, 1);
% QCBm = cell(9, 1);
OvBO_B = cell(3, 1);
fid2 = fopen(eqnsfile, 'r');
newline = fgetl(fid2);
newline = fgetl(fid2);
for i1 = 1:9
    % MATLAB uses single index notation for matrices by
    % going down the first column, then second column, etc. Thus, the
    % indices would be (for a 4x3 matrix):
    % [1, 5, 9]
    % [2, 6, 10]
    % [3, 7, 11]
    % [4, 8, 12]
    EQNS{i1} = fgetl(fid2);
    % u_dot, v_dot, w_dot, theta_dot, phi_dot, psi_dot, p_dot, q_dot, r_dot
    OCBm{i1} = sprintf('%s', OCB(i1));
    % QCBm{i1} = sprintf('%s', QCB(i1));
    if i1 < 4
        OvBO_B{i1} = sprintf('%s', e1.O_V_BO_B(i1));
    end
end
fclose(fid2);
fprintf('EOMs, Matrices, and stall model read in.\n');


% simulate!
% --------------------------------------------------------
% may need to pass other rotation matrices into states file based on forces
% and moments to get to B frame. 
%   [ ] Aero forces need to be expressed as Fax, Fay, Faz in the B frame
%   [x] Gravity is already rotated into the B frame
%   [x] Tether tension needs to be in Tx, Ty, Tz in the B frame
%   [ ] Aero moments need to be Max, May, Maz in the B frame
%   [x] Tether moment is already rotated into the B frame
tin = t0:dt:te;
optz = odeset('Stats', 'on');
fprintf('Starting simulation...\n');
tic
switch ode
    case 'ode5'
        outsB = ode5(@(t, x)statesFile(t, x, runfile, EQNS, OCBm, 0, ...
            OvBO_B, F), tin, ICS);
        tout = tin;
    case 'ode23'
        [tout, outsB] = ode23(@(t, x)statesFile(t, x, runfile, EQNS, OCBm, 0, ...
            OvBO_B, F), tin, ICS, optz);
    case 'ode45'
        [tout, outsB] = ode45(@(t, x)statesFile(t, x, runfile, EQNS, OCBm, 0, ...
            OvBO_B, F), tin, ICS, optz);
    case 'ode113'
        [tout, outsB] = ode113(@(t, x)statesFile(t, x, runfile, EQNS, OCBm, 0, ...
            OvBO_B, F), tin, ICS, optz);
    otherwise
        error('ode not specified properly.');
end
t5 = toc;
fprintf('Time to simulate: %0.4f seconds.\n', t5);

% save temp mat for use later if errors in code below, don't care about
% overwrite for now
save('temp.mat');


% get other information as needed
% --------------------------------------------------------
% This is to get information not generally returned post integration
% but is calculated during the integration. This is used to make plots 
% which demonstrate phenomenoa of interest. 
% e.g. Aero forces, tension forces, relative velocity, etc. 
fprintf('Post processing results...\n');
tic
infostruct = PostProcess(runfile, EQNS, OCBm, tout, outsB, OvBO_B, F);
t5 = toc;
fprintf('Time to process results: %0.4f seconds.\n', t5);

% rotate results
% --------------------------------------------------------
outsO = RotateMe(outsB, OCBm);

% plot results
% --------------------------------------------------------
fprintf('Plotting results...\n');
tic
PlotMe(tout, outsB, outsO, infostruct);
t5 = toc;
fprintf('Time to plot: %0.4f seconds.\n', t5);

% keyboard
end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function DeriveEoms(derivefile)
% code to derive equations of motion  for the system
%
% Assume
%   1. Balloon fixed in IRF
%   2. Single link elastic tether, attached at P on the sail

% syms
syms t xB(t) yB(t) zB(t) xBO yBO zBO        % pos of CM wrt O
syms uB(t) vB(t) wB(t) uBO vBO wBO          % vel of CM wrt O
syms uBOd vBOd wBOd ttad pzid phid
syms ttac(t) pzic(t) phic(t) tta pzi phi    % angles
syms pc(t) qc(t) rc(t) p q r pd qd rd       % angular rates
syms xPB yPB zPB                            % P wrt B in B frame
syms xQB yQB zQB                            % Q wrt B in B frame
syms Ixx Iyy Izz Ixy
syms Tx Ty Tz
syms MT g Fax Fay Faz Max May Maz Wx Wy Wz
v1 = [xB, yB, zB, diff(xB, t), diff(yB, t), diff(zB, t), ...
    diff(xB, t, t), diff(yB, t, t), diff(zB, t, t), uB, vB, wB, ...
    ttac, pzic, phic, diff(ttac, t), diff(pzic, t), diff(phic, t), ...
    pc, qc, rc, diff(pc, t), diff(qc, t), diff(rc, t)];
v2 = [xBO, yBO, zBO, uBO, vBO, wBO, ...
    uBOd, vBOd, wBOd, uBO, vBO, wBO, ...
    tta, pzi, phi, ttad, pzid, phid, ...
    p, q, r, pd, qd, rd];

% matrices
R_phi_X = MakeMatrix('x', phic);
R_tta_Y = MakeMatrix('y', ttac);
R_psi_Z = MakeMatrix('z', pzic);
% ACO = cast(MakeMatrix('x', pi/2), 'int32');
% QCB = cast(MakeMatrix('y', pi), 'int32');
BCO = R_phi_X*R_psi_Z*R_tta_Y;
% OCA = transpose(ACO);
% BCQ = transpose(QCB);
% ACB = transpose(BCA);
% BCO = BCA*ACO;
OCB = transpose(BCO);

% positions
r_BO_B = MakeVec(xB, yB, zB);
% r_QB_B = MakeVec(xQB, yQB, 0);
r_PB_B = MakeVec(xPB, yPB, 0);

% angular velocities
OwB_B = MakeVec(pc, qc, rc);

% velocities
O_v_BO_B = FirstTransport(r_BO_B, OwB_B, t);

% acceleration
O_a_BO_B = SecondTransport(r_BO_B, OwB_B, t);

% inertia tensor
I_B_B = MakeMat(Ixx, Iyy, Izz, Ixy, 0, 0);
% I_B_B = BCQ*I_B_Q*QCB;

% angular momentum
OhOB_B = I_B_B*OwB_B;

% oddt ohob
Oddt_OhOB_B = FirstTransport(OhOB_B, OwB_B, t);

% forces
T_B = [Tx; Ty; Tz];
% W_O = [0; -MT*g; 0];
% W_O = [0; 0; -MT*g];        % corrected for eqns3.mat
W_B = [Wx; Wy; Wz];             % generalized for eqns5.mat to prevent this again
Fa_B = [Fax; Fay; Faz];

% torques
Ma_B = [Max; May; Maz];
MT_B = CrossMe(r_PB_B, T_B);

% f=ma
% e1 = T_B + BCO*W_O + Fa_B - MT*O_a_BO_B;
e1 = T_B + W_B + Fa_B - MT*O_a_BO_B;
eq4 = subs(e1(1), v1, v2);
eq5 = subs(e1(2), v1, v2);
eq6 = subs(e1(3), v1, v2);

% t=oddt
e2 = Oddt_OhOB_B - Ma_B - MT_B;
eq7 = subs(e2(1), v1, v2);
eq8 = subs(e2(2), v1, v2);
eq9 = subs(e2(3), v1, v2);

% angle dots
OCBd = diff(OCB, t);
eq1 = subs(simplify([0, 0, 1]*BCO*OCBd*[0; 1; 0] - p), v1, v2);
eq2 = subs(simplify([1, 0, 0]*BCO*OCBd*[0; 0; 1] - q), v1, v2);
eq3 = subs(simplify([0, 1, 0]*BCO*OCBd*[1; 0; 0] - r), v1, v2);

% sub in rotation matrices (for later use)
R_phi_X = subs(R_phi_X, v1, v2);
R_tta_Y = subs(R_tta_Y, v1, v2);
R_psi_Z = subs(R_psi_Z, v1, v2);
% BCA = subs(BCA, v1, v2);
BCO = subs(BCO, v1, v2);
% QCB = subs(QCB, v1, v2);
O_V_BO_B = subs(O_v_BO_B, v1, v2);


% solve
% theta_dot, psi_dot, phi_dot expressions
[EQN1, EQN2, EQN3] = solve([eq1==0, eq2==0, eq3==0], [ttad, pzid, phid]);
% u_dot, v_dot, w_dot, p_dot, q_dot, r_dot
[EQN4, EQN5, EQN6, EQN7, EQN8, EQN9] = solve([eq4==0, ...
    eq5==0, eq6==0, eq7==0, eq8==0, eq9==0], [uBOd, ...
    vBOd, wBOd, pd, qd, rd]);

% save
save(derivefile);
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
fid = fopen([derivefile(1:end-4), '.txt'], 'w');
fprintf(fid, 'Variable schedule:\n');
fprintf(fid, 'theta_dot, psi_dot, phi_dot, u_dot, v_dot, w_dot, p_dot, q_dot, r_dot\n');
fprintf(fid, '%s\n', EQN4); % u_dot
fprintf(fid, '%s\n', EQN5); % v_dot
fprintf(fid, '%s\n', EQN6); % w_dot
fprintf(fid, '%s\n', EQN1); % theta_dot
fprintf(fid, '%s\n', EQN3); % phi_dot
fprintf(fid, '%s\n', EQN2); % psi_dot
fprintf(fid, '%s\n', EQN7); % p_dot
fprintf(fid, '%s\n', EQN8); % q_dot
fprintf(fid, '%s\n', EQN9); % r_dot
fclose(fid);


% keyboard
end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [eqns] = FirstTransport(pos, ang, t)
% [eqns] = FirstTransport(pos, ang) returns the three-dimensional vector
% corresponding to the inertial derivatives
% pos = B frame position vector
% vel = B frame derivative of pos
% ang = B frame angular velocity vector

% eqns = simplify(diff(pos, t) + cross(ang, pos));
eqns = simplify(diff(pos, t) + CrossMe(ang, pos));

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [eqns] = SecondTransport(pos, angvel, t)
% [eqns] = SecondTransport(pos, vel, angvel, angaccl) returns the three-dimensional vector
% corresponding to the inertial derivatives
% pos = B frame position vector
% vel = B frame derivative of pos
% accl = B frame second derivative of pos
% angvel = B frame angular velocity vector
% angaccl = B frame angular acceleration

% eqns = diff(pos, t, t) + 2*cross(angvel, diff(pos, t)) + ...
%     cross(diff(angvel, t), pos) + cross(angvel, cross(angvel, pos));
eqns = diff(pos, t, t) + 2*CrossMe(angvel, diff(pos, t)) + ...
    CrossMe(diff(angvel, t), pos) + CrossMe(angvel, CrossMe(angvel, pos));

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

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

function PlotMe(tin, outsB, outsO, xtra)
% %  plot things in B frame
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

% % structure
% infoout.vrel_B = vrel_B;
% infoout.Tens_B = Tens_B;
% infoout.Faero_B = Faero_B;
% infoout.Maero_B = Maero_B;
% infoout.alfa = alfa;
% infoout.beta = beta;
% infoout.MT_B = MT_B;

% outsO(1:10, :)
% keyboard

% angles - roll pitch yaw
figure
hold on
for i1 = 1:3
    plot(tin, outsB(:, 6 + i1)*180/pi);
end
xlabel('Time [s]');
ylabel('Angle [deg]');
grid on
legend('Roll', 'Pitch', 'Yaw');

% angles - alpha, beta
figure
hold on
plot(tin, xtra.alfa*180/pi);
plot(tin, xtra.beta*180/pi);
plot(tin, xtra.de);
xlabel('Time [s]');
ylabel('Angle [deg]');
grid on
legend('$\alpha$', '$\beta$', '$\delta_e$');

% % position - B
% figure
% hold on
% for i1 = 1:3
%     plot(tin, outsB(:, i1));
% end
% xlabel('Time [s]');
% ylabel('Position [m]');
% grid on
% legend('$i_B$', '$j_B$', '$k_B$');

% position - O
figure
hold on
for i1 = 1:3
    plot(tin, outsO(:, i1));
end
xlabel('Time [s]');
ylabel('Position [m]');
grid on
legend('$i_O$', '$j_O$', '$k_O$');

% position - O, delta
figure
hold on
for i1 = 1:3
    plot(tin, outsO(:, i1) - outsO(1, i1));
end
xlabel('Time [s]');
ylabel('Change in position [m]');
grid on
legend('$i_O$', '$j_O$', '$k_O$');


% xz position - O w/ colors for time
figure
hold on
segs = 4;
n = floor((length(tin) - 1)/segs);
if segs*n < length(tin)
    plot(outsO(1, 3), outsO(1, 1), 'kx', 'DisplayName', 'Start');
    set(gca, 'ColorOrderIndex', 1);
    in1 = 1;
    in2 = in1 + n - 1;
    for i1 = 1:segs
        plot(outsO(in1:in2, 3), outsO(in1:in2, 1), '-', 'Marker', '.', 'DisplayName', sprintf('t=%0.4fs', tin(in1)));
        in1 = in2;
        in2 = in1 + n;
        if i1 == segs - 1
            in2 = length(tin);
        end
    end
else
    plot(outsO(1, 3), outsO(1, 1), 'kx');
    plot(outsO(:, 3), outsO(:, 1), '-.');
end
plot(outsO(end, 3), outsO(end, 1), 'ko', 'DisplayName', sprintf('t=%0.4fs', tin(end)));
xlabel('$k_O$ [m]');
ylabel('$i_O$ [m]');
grid on
% set(gca, 'XDir', 'reverse');
set(gca, 'XDir', 'reverse');
set(gca, 'YDir', 'reverse');
legend('location', 'northwest');

% v rel
figure
hold on
for i1 = 1:3
    plot(tin, xtra.vrel_B(i1, :));
end
xlabel('Time [s]');
ylabel('Relative velocity [m/s]');
grid on
legend('$i_B$', '$j_B$', '$k_B$');

% tensions
figure
hold on
for i1 = 1:3
    plot(tin, xtra.Tens_B(i1, :));
end
plot(tin, xtra.Tmag);
xlabel('Time [s]');
ylabel('Tension [N]');
grid on
legend('$i_B$', '$j_B$', '$k_B$', 'norm');

% % stretch
% figure
% hold on
% yyaxis left
% plot(tin, xtra.ds);
% plot(tin, xtra.dsd);
% yyaxis right
% plot(tin, xtra.Tmag);
% xlabel('Time [s]');
% ylabel('');
% legend('Stretch [m]', 'dsd [m]', 'Tension [N]');
% grid on

% coeffs
figure
hold on
for i1 = 1:3
    plot(tin, xtra.coeffs(i1, :));
end
plot(tin, xtra.stallterm);
for i1 = 1:3
    plot(tin, xtra.momcoe(i1, :))
end
xlabel('Time [s]');
ylabel('Aero coeffs');
grid on
legend('$C_L$', '$C_D$', '$C_Y$', 'StallTerm', '$C_l$', '$C_m$', '$C_n$');

% Faero_B
figure
hold on
for i1 = 1:3
    plot(tin, xtra.Faero_B(i1, :));
end
xlabel('Time [s]');
ylabel('Aero forces [N]');
grid on
legend('$i_B$', '$j_B$', '$k_B$');

% Maero_B
figure
hold on
for i1 = 1:3
    plot(tin, xtra.Maero_B(i1, :));
end
xlabel('Time [s]');
ylabel('Aero moments [Nm]');
grid on
legend('$i_B$', '$j_B$', '$k_B$');

% % Mtether_B
% figure
% hold on
% for i1 = 1:3
%     plot(tin, xtra.MT_B(i1, :));
% end
% xlabel('Time [s]');
% ylabel('Tether moment [Nm]');
% grid on
% legend('$i_B$', '$j_B$', '$k_B$');

% keyboard

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function PrepPlots

set(groot, 'defaultFigureColor', 'w');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultColorbarTickLabelInterpreter', 'latex');
set(groot, 'defaultGraphplotInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');
set(groot, 'defaultPolaraxesTickLabelInterpreter', 'latex');
set(groot, 'defaultTextInterpreter', 'latex');

end