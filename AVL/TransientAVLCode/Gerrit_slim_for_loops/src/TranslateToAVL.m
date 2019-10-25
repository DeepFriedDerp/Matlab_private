function [successState] = TranslateToAVL(sail)

% name
avlLocation = '.\avl.exe';
runs.header = 'CM ReCals';   % name of run within files

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
runs.name = '.\AVL_output\cm_calc';     % name of files without extensions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
showStall = 0;              % stall plot flag, 1 == plot, 0 == no plot
delFlag = 1;                % delete other files to prevent interference

% wing parameters
wing.span = sail.mass1.span;        % [m] span
wing.chord = sail.mass1.chord;      % [m] chord
wing.n_cho = 7;                     % number of chordwise vortices
wing.n_spa = 97;                    % number of spanwise vortices
wing.n_ail = 0;                     % number of ailerons - control rolling moment
wing.d_ail = sail.mass1.aildef;     % [deg] aileron deflection
wing.s_ail = 1.2;                   % start of ail on span 
wing.e_ail = 1.58;                  % [m] length of the aileron  end point on span moving from 0 on root to tip
wing.xbc_ail = 0.7;                 % x/c for aileron
wing.n_fps = 0;                     % number of flaps - control lift distribution
wing.d_fps = sail.mass1.fpdef;
wing.xbc_fps = 0.7;                 % x/c flap locations
wing.s_fps = [0.02, 0.4, 0.8];    % [m] start of the flaps
wing.e_fps = [0.38, 0.78, 1.18];    % [m] end of the flaps
wing.xle = -sail.mass1.xle;          % [m] offset of leading edge 
wing.yle = 0;                       % [m] offset of leading edge 
wing.zle = 0;                       % [m] offset of leading edge 
wing.mass = sail.mass1.mass;        % [kg] wing mass + boom mass assumption 

% rudder parameters
rudder.span = sail.mass2.span;      % [m] span
rudder.chord = sail.mass2.chord;	% [m] chord
rudder.n_cho = 7;     % number of chordwise vortices
rudder.n_spa = 37;    % number of spanwise vortices
rudder.d_ele = 0;     % [deg] aileron deflection
rudder.xle = -sail.mass2.xle;       % [m] offset of leading edge 
rudder.yle = 0;       % [m] offset of leading edge 
rudder.zle = 0;       % [m] offset of leading edge 
rudder.mass = sail.mass2.mass;     % [kg] wing mass
% rudder.xbc_ele = 0.7;   % x/c for elevator 
if isfield(sail.mass2, 'xbc') ~= 1
    rudder.xbc_ele = 0.7;   % x/c for elevator 
else
    rudder.xbc_ele = sail.mass2.xbc;
end

% run parametrs
runs.Lunit = 1;     % [m] length unit
runs.Munit = 1;     % [kg] mass unit
runs.Tunit = 1;     % [s] time unit
runs.mach = 0;
runs.Xsim = 0;
runs.Ysim = 0;
runs.Zsim = 0;
runs.CDp = 0.025;   % profile drag coefficient
runs.Sref = wing.chord*wing.span;
runs.Cref = wing.chord;
runs.Bref = wing.span;
runs.g = 9.81;
runs.rho = 1.225;
runs.vel = sail.vel;
runs.stFlag = 1;    % Save ST file, 1 == yes, 0 == no
runs.fsFlag = 0;    % Save fs file, 1 == yes, 0 == no
runs.staticMassFlag = 1; %does the mass configuration change for multiple loops?
                         % 1 == yes, 0 == no
runs.numberOfRuns = sail.numberOfRuns;
q = 0.5*runs.rho*runs.vel*runs.vel;

% electronics package
runs.elecs = sail.mass4.mass;   % [kg] electronics mass

% aerodynamic constraints
const.b = sail.beta;        % beta
const.r = sail.r;        % roll rate
const.p = sail.p;        % pitch rate
const.y = sail.p;        % yaw rate
const.pm = 0;       % pitching moment

const.a = sail.alfa;
const.de = sail.de;
runs.const = const; % generic constraints

% mass and inertia
runs.Xref = sail.Xcm;
runs.Yref = sail.Ycm;
runs.Zref = sail.Zcm;
runs.mass = sail.mT;
runs.IXX = sail.ICM(1, 1);
runs.IYY = sail.ICM(2, 2);
runs.IZZ = sail.ICM(3, 3);
runs.IXY = sail.ICM(1, 2);
runs.IXZ = sail.ICM(1, 3);
runs.IYZ = sail.ICM(2, 3);


% % %       LEAVE THIS ALONE

% disp('Loading parameters ... ');
% error checking
if length(wing.d_fps) ~= wing.n_fps
    error(['Length of wing.d_fps (', num2str(wing.d_fps), ...
        ') is not equal to the number of flaps (', ...
        num2str(wing.n_fps), ')']);
end

% compile structure and send out
design.wing = wing;         % save wing structure in design structure
design.rudder = rudder;     % save rudder structure in design structure
design.runs = runs;         % save runs structure in design structure
design.avlLoc = avlLocation;% save avl location in design struct so it 
                            % flows into other functions


% % find the stall conditions
successState = findStall_newclassic(design, 0);


end