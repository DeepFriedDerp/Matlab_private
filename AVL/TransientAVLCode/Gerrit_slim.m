function Gerrit_slim(filename, alpha, betaz, deltae, velocity, p, q, r)
% Script to compute the center of mass and intertia tensor of the sail

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % %          User inputs          % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% masses - defined in the global frame
% io = out the nose
% jo = towards balloon altitude
% ko = RHR, into the plane
% The origin of the O frame is at the pitch ballast
% set SM and yLyCM to desired values and the code will use double golden
% section to choose the masses to make it happen

% set plot stuffs
SetDefaults;

% load and rename variables
info1 = LoadFile(filename);
mass1 = info1.mass1;
mass2 = info1.mass2;
mass3 = info1.mass3;
mass4 = info1.mass4;
mass5 = info1.mass5;
mass6 = info1.mass6;
mass7 = info1.mass7;
massT = info1.massT;     % total sail structure
xNP = info1.xNP;
yT = info1.yT;
xoff = info1.xoff;
info1.inputfile = filename;

info1.alfa = alpha;
info1.beta = betaz;
info1.de = deltae;

% find the design
sail.Xcm = massT.x;
sail.Ycm = massT.y;
sail.Zcm = massT.z;
ICM = [massT.Ixx, massT.Ixy, massT.Ixz; massT.Ixy, massT.Iyy, massT.Iyz; ...
    massT.Ixz, massT.Iyz, massT.Izz];

% AVL file
sail.mass1 = mass1;
sail.mass2 = mass2;
sail.mass3 = mass3;
sail.mass4 = mass4;
sail.mass5 = mass5;
sail.mass6 = mass6;
sail.mass7 = mass7;
sail.xoff = xoff;
sail.ICM = ICM;
sail.alfa = info1.alfa;
sail.beta = info1.beta;
sail.de = info1.de;
sail.runs.mass = massT.mass;
sail.mT = massT.mass;
sail.alfa = alpha;
sail.beta = betaz;
sail.de = deltae;
sail.vel= velocity;

Cref = sail.mass1.chord;
Bref = sail.mass1.span;

sail.p = (p*Bref)/(2*velocity);
sail.q = (q*Cref)/(2*velocity);
sail.r = (r*Bref)/(2*velocity);

[xNP, alfa, CL, q, de] = TranslateToAVL(sail);


% print
%disp('Done! :D');

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [info] = LoadFile(filename)

fclose('all');
fid = fopen(filename);
newline = fgetl(fid);
while newline ~= -1
    eval(newline);
    newline = fgetl(fid);
end
fclose(fid);

info.mass1 = mass1;
info.mass2 = mass2;
info.mass3 = mass3;
info.mass4 = mass4;
info.mass5 = mass5;
info.mass6 = mass6;
info.mass7 = mass7;
info.massT = massT;
% info.SM = SM;
info.xNP = xNP;
% info.yLyCM = yLyCM;
info.span = span;
info.chord = chord;
info.yT = yT;
info.xoff = xoff;


end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function SetDefaults()
% SetDefaults(varargin) sets the default figure and text based objects for
% all MATLAB runs using the script. Variable inputs are used for different
% styles (jounral paper is default)

% Set journal paper style default
set(groot, 'defaultUicontrolFontName', 'Helvetica');
set(groot, 'defaultUitableFontName', 'Helvetica');
set(groot, 'defaultAxesFontName', 'Helvetica');
set(groot, 'defaultTextFontName', 'Helvetica');
set(groot, 'defaultUipanelFontName', 'Helvetica');
set(groot, 'defaultAxesFontSize', 16);   
set(groot, 'defaultFigureColor', [1, 1, 1]);
set(groot, 'defaultAxesXMinorGrid', 'on');
set(groot, 'defaultAxesYMinorGrid', 'on');
set(groot, 'defaultAxesZMinorGrid', 'on');

% set latex
set(0, 'defaulttextinterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


function [xNP, alfa, CL, q, de] = TranslateToAVL(sail)

% name
avlLocation = '.\avl.exe';
runs.header = 'CM ReCals';   % name of run within files

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
runs.name = 'cm_calc';     % name of files without extensions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
showStall = 1;              % stall plot flag, 1 == plot, 0 == no plot
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
runs.fsFlag = 1;    % Save fs file, 1 == yes, 0 == no
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


% % find the stall conditions
[alfa, CL, errs, xNP, de] = findStall_newclassic(design, 1);


end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [alfa, CL, errs, xNP, de] = findStall_newclassic(design, plotFlag)
% [alfa, CL, errs] = findStall(design) returns the stall angle of 
% attack in degrees for the design structure design. 
    
% run specific CL case
[CL, errs, xNP, de, alfa] = RunLoop(design, design.runs.const.a, 1, 0);

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [CL, errs, xNP, de, alphaN] = RunLoop(design, alpha, i1, plotFlag)
% [CL, errs] = RunLoop(design, alpha, iteration) returns the cl and 
% error for a given design and alpha run. 

    % set up
    avlLocation = '.\avl.exe';
    nameList = design.runs.name;
    runs = design.runs;
    const = runs.const;
    
    if isnan(alpha) ~= 1
        const.a = alpha;       % set
    end
    
    
    runs.name = nameList;
    runs.const = const;         % generic constraints
    design.runs = runs;
    runName = nameList;
   

    % write the files + run
    delete([runName, '.stabs']);
    delete([runName, '.strip']);
    delete([runName, '.mass']);
    delete([runName, '.avl']);
    delete([runName, '.run']);
    % [~, ~, runFile] = WriteAVL_D(design);
    % [~, ~, runFile] = WriteAVL_F(design); % use sail inertia tensor
    [~, ~, runFile] = WriteAVL_J(design);   % use sail inertia, use de = 15 deg
    fclose('all');
    [status, result] = dos([avlLocation,' < ', runFile]);
    stabDerivs = ReadStabDerivs_revA([runName, '.stabs']);
    de = stabDerivs.elev;
    alphaN = stabDerivs.Alpha;
    xNP = stabDerivs.Xnp;
    [Cl, ~, ~, ~, ~, yLE] = ReadStrips([runName, '.strip'], 0, design);
    fclose('all');
    
    % get CL difference
    [Clmax] = getCLmax(design, yLE(:, 1));
    differr1 = Clmax - Cl(:, 1);
    [m1, indx1] = min(differr1);
    differr2 = Clmax - Cl(:, 2);
    [m2, indx2] = min(differr2);

    
    % return valuables
    CL = stabDerivs.CLtot;
    errs = min([m1, m2]);
    de = stabDerivs.elev;
    
    % plot if asked
    if plotFlag == 1
        figure
        hold on
        plot(yLE(:, 1), Clmax, 'r-')
        plot(yLE(:, 1), abs(Cl(:, 1)))
        plot(yLE(:, 2), abs(Cl(:, 2)), '-', 'Color', [0.4940    0.1840    0.5560])
        xlabel('Span position [m]')
        ylabel('Sectional lift coefficient')
        grid on
        grid minor
        title(['$C_{L}$ = ', num2str(CL), ...
            ', $\alpha_{Stall}$ = ', num2str(alpha), ' [deg]']);
        legend({'$C_{l_{max}}$', '$C_{l_{wing}}$', '$C_{l_{rudder}}$'}, ...
            'interpreter', 'latex', 'location', 'northwest');
        
        wing = design.wing;
        spn = wing.span;
        % set(gca, 'XTick', -1.6:0.4:0);
        % xlim([-spn, 0]);
        set(gca, 'YTick', 0:0.4:1.6);
        ylim([0, 1.6])
                
    end

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [avlFile, massFile, runFile] = WriteAVL_J(design)
% [avlFile, massFile, runFile] = WriteAVL(design) returns the .avl, .mass, 
% and .run files for files for the given structure design. 
%
% NOTE: The following files must be present within the folder:
%   template.avl
%   template.mass
%
% INPUTS:
%   design  - a structure with the given design values
%
% FIELDS:
%   wing    -   a structure with wing parameters
%   rudder  -   a structure with rudder parameters
%   runs    -   a structure of run conditions
%   header  -   a string for a header
%   name    -   name of the files (run case) without extensions
%
%   WING:
%       span    - span of the wing
%       chord   - chord of the wing
%       n_cho   - number of chordwise vortices
%       n_spa   - number of spanwise vortices
%       n_ail   - number of ailerons
%       d_ail   - n_ail x 1 vector of aileron deflections
%       xle     - leading edge x offset (should be zero)
%       yle     - leading edge y offset (should be zero)
%       zle     - leading edge z offset (should be zero)
%       mass    - mass of the wing
%       Ixx     - moment of inertia about CM x axis
%       IYY     - moment of inertia about CM y axis
%       IZZ     - moment of inertia about CM z axis
%       IXY     - product of inertia about xy
%   	IXZ     - product of inertia about xz
%   	IYZ     - product of inertia about yz
%
%   RUDDER:
%       span    - span of the rudder
%       chord   - chord of the rudder
%       n_cho   - number of chordwise vortices
%       n_spa   - number of spanwise vortices
%       d_ele   - elevator deflections
%       xle     - leading edge x offset (should be non-zero)
%       yle     - leading edge y offset (should be zero)
%       zle     - leading edge z offset (should be zero)
%       mass    - mass of the rudder
%       Ixx     - moment of inertia about CM x axis
%       IYY     - moment of inertia about CM y axis
%       IZZ     - moment of inertia about CM z axis
%       IXY     - product of inertia about xy
%   	IXZ     - product of inertia about xz
%   	IYZ     - product of inertia about yz
%
% OUTPUTS:
%   avlFile     - .avl file to import geometry
%   massFile    - .mass file to incorporate the mass of the system
%   runFile     - .run file to execute avl from Matlab script
%
% 

% Written by Christopher D. Yoder on 9/1/2017 to run avl from matlab. 
% 
% % error handle
% if exist('template.avl', 'file') ~= 2
%     error('template.avl not found in the local directory.');
%     
% elseif exist('template.mass', 'file') ~= 2
%     error('template.mass not found in the local directory.');
%     
% end

% get stuffs
wing = design.wing;             % wing structure
rudder = design.rudder;         % rudder structure
runs = design.runs;             % runs structure
linewrite = '! ';




% write avl file
avlFile = [runs.name, '.avl'];  % make file name
fileAVL = fopen(avlFile, 'w');  % create file

% header lines
fprintf(fileAVL, '%s \n', linewrite);        % first line
fprintf(fileAVL, '! %s \n', runs.header);      % write header line

% preamble
WritePreamble(fileAVL, runs.mach, [runs.Xsim, runs.Ysim, runs.Zsim], ...
    [runs.Sref, runs.Cref, runs.Bref], ...
    [runs.Xref, runs.Yref, runs.Zref], runs.CDp, linewrite);



% wing surface
WriteSurface(fileAVL, 'WING', wing.n_cho, 0.0, wing.n_spa, 0.0, linewrite); % _A, total vortices
% WriteSurface(fileAVL, 'WING', wing.n_cho, 0.0, [], [], linewrite); % _B, individual vortices

% wing left section
WriteSection(fileAVL, wing.xle, -wing.span + wing.yle, wing.zle, ...
    wing.chord, 0.0, [], [], 'NACA 0015');  % _A, total vortices
% WriteSection(fileAVL, wing.xle, -wing.span + wing.yle, wing.zle, ...
%     wing.chord, 0.0, wing.n_spa, 1.0, 'NACA 0015'); % _B, individual vortices

% write ailerons
n_ail = wing.n_ail;                 % number of ailerons
if n_ail ~= 0
    fprintf(fileAVL, '%s \n', linewrite);
    fprintf(fileAVL, '%s \n', linewrite);
    
%     % write far flap section
    WriteSection(fileAVL, wing.xle, wing.yle - wing.e_ail, wing.zle, ...
        wing.chord, 0.0, [], [], []);
%     WriteSection(fileAVL, wing.xle, wing.yle - wing.e_ail, wing.zle, ...
%         wing.chord, 0.0, wing.n_spa, 1.0, []);
    nme = 'ailer';
    WriteControl(fileAVL, nme, 1.0, wing.xbc_fps, [0.0, 0.0, 0.0], -1.0)
    
    % write near flap section
    WriteSection(fileAVL, wing.xle, wing.yle - wing.s_ail, wing.zle, ...
        wing.chord, 0.0, [], [], []); % _A, total vortices
%     WriteSection(fileAVL, wing.xle, wing.yle - wing.s_ail, wing.zle, ...
%         wing.chord, 0.0, wing.n_spa, 1.0, []);
    WriteControl(fileAVL, nme, 1.0, wing.xbc_fps, [0.0, 0.0, 0.0], 1.0)
end    
        
% write flaps
n_fps = wing.n_fps;                 % number of flaps
if n_fps ~= 0
    for i1 = 1:n_fps                % 1, 2, 3
        fprintf(fileAVL, '%s \n', linewrite);
        fprintf(fileAVL, '%s \n', linewrite);
        indx = n_fps - i1 + 1;      % 3, 2, 1
        
        % write far flap section
        WriteSection(fileAVL, wing.xle, wing.yle - wing.e_fps(indx), ...
            wing.zle, wing.chord, 0.0, [], [], []);
%         WriteSection(fileAVL, wing.xle, wing.yle - wing.e_fps(indx), ...
%             wing.zle, wing.chord, 0.0, wing.n_spa, 1.0, []);
        nme = ['flap', num2str(indx)];
        % nme = ['flap', num2str(i1)];
        WriteControl(fileAVL, nme, 1.0, wing.xbc_fps, [0.0, 0.0, 0.0], 1.0)

        % write near flap section
        WriteSection(fileAVL, wing.xle, wing.yle - wing.s_fps(indx), ...
            wing.zle, wing.chord, 0.0, [], [], []);
%         WriteSection(fileAVL, wing.xle, wing.yle - wing.s_fps(indx), ...
%             wing.zle, wing.chord, 0.0, wing.n_spa, 1.0, []);
        WriteControl(fileAVL, nme, 1.0, wing.xbc_fps, [0.0, 0.0, 0.0], 1.0)
    end           
end
fprintf(fileAVL, '%s \n', linewrite);
fprintf(fileAVL, '%s \n', linewrite);
    
% wing right section
WriteSection(fileAVL, wing.xle, wing.yle, wing.zle, ...
    wing.chord, 0.0, [], [], []);
% WriteSection(fileAVL, wing.xle, wing.yle, wing.zle, ...
%     wing.chord, 0.0, wing.n_spa, 1.0, []);




% rudder surface
WriteSurface(fileAVL, 'RUDDER', rudder.n_cho, 0.0, rudder.n_spa, 0.0, linewrite);
% WriteSurface(fileAVL, 'RUDDER', rudder.n_cho, 1.0, rudder.n_spa, 1.0, linewrite);

% rudder left section
WriteSection(fileAVL, rudder.xle, -rudder.span - rudder.yle, rudder.zle, ...
    rudder.chord, 0.0, [], [], 'NACA 0015');

% rudder elevator
WriteControl(fileAVL, 'ELEV', 1.0, rudder.xbc_ele, ...
    [0.0, 0.0, 0.0], 1.0)

% rudder right section
WriteSection(fileAVL, rudder.xle, rudder.yle, rudder.zle, ...
    rudder.chord, 0.0, [], [], []);

% rudder elevator
WriteControl(fileAVL, 'ELEV', 1.0, rudder.xbc_ele, ...
    [0.0, 0.0, 0.0], 1.0)

% close file
fclose(fileAVL);



% % % % % % % %      write mass file    % % % % % % % % % % % % % % % % 
massFile = [runs.name, '.mass'];  % make file name
fileMASS = fopen(massFile, 'w');  % create file

% write preamble
WritePreambleMass(fileMASS, runs.Lunit, runs.Munit, runs.Tunit, ...
    runs.g, runs.rho)

% % write mass table - wing
% WriteMassTable(fileMASS, wing.mass, wing.xcg, wing.ycg, wing.zcg, ...
%     wing.IXX, wing.IYY, wing.IZZ, wing.IXY, wing.IXZ, wing.IYZ, 'wing'); 
% 
% % write mass table - rudder
% WriteMassTable(fileMASS, rudder.mass, rudder.xcg, ...
%     rudder.ycg, rudder.zcg, rudder.IXX, rudder.IYY, ...
%     rudder.IZZ, rudder.IXY, rudder.IXZ, rudder.IYZ, 'rudder'); 
% 
% % write mass table - electronics sled
% WriteMassTable(fileMASS, runs.elecs, runs.elecsCG(1), runs.elecsCG(2), ...
%     runs.elecsCG(3), runs.elecsI(1), runs.elecsI(2), runs.elecsI(3), ...
%     runs.elecsI(4), runs.elecsI(5), runs.elecsI(6), 'electronics'); 

% write mass table - sail
WriteMassTable(fileMASS, runs.mass, -runs.Xref, -runs.Yref, runs.Zref, ...
    runs.IXX, runs.IYY, runs.IZZ, runs.IXY, runs.IXZ, runs.IYZ, 'sail'); 

% close file
fclose(fileMASS);



%%%%%%%%%%%%%%%%%%%%%%%%%
% enter deflections
if isempty(n_fps) == 1
    n_fps = 0;
end
if isempty(n_ail) == 1
    n_ail = 0;
end
n_tot = n_fps + n_ail + 1;  % total number of control surfaces
num1 = ['d', num2str(n_tot), ' '];
elevn = num2str(n_tot);
%%%%%%%%%%%%%%%%%%%%%%%%%

% write run file
runFile = [runs.name, '.run'];  % make file name
fileRUN = fopen(runFile, 'w');  % create file

% load written files
fprintf(fileRUN, 'LOAD %s\n', avlFile);     % load avl file
fprintf(fileRUN, 'MASS %s\n', massFile);    % load mass file
fprintf(fileRUN, 'MSET\n');
fprintf(fileRUN, '%i\n', 0);

% disable graphics
fprintf(fileRUN, 'PLOP\ng\n\n');

% enter run case settings
fprintf(fileRUN, '%s\n', 'OPER');                   % oper menu
fprintf(fileRUN, '%s\n', 'm');                      % edit parameters
fprintf(fileRUN, '%s%6.4f\n', 'v ', runs.vel);      % velocity
fprintf(fileRUN, '%s%6.4f\n', 'mn ', runs.mach);    % mach number
fprintf(fileRUN, '%s%6.4f\n', 'g ', runs.g);        % gravity
fprintf(fileRUN, '%s%6.4f\n', 'd ', runs.rho);      % density
fprintf(fileRUN, '\n');                             % back to oper



%%%%%%%%%%%%%%%%%%%%%%%%%%%

% enter constraints
con = runs.const;
% if isfield(con, 'a') == 1
%     fprintf(fileRUN, '%s%s%6.4f\n', 'a ', 'a ', con.a);    % set a to cl
%     fprintf(fileRUN, '%s%s%6.4f\n', ['d',elevn, ' '], 'pm ', con.pm);     % set y to y
%     % fprintf('a = %0.2f\n', con.a);
% elseif isfield(con, 'c') == 1
%     fprintf(fileRUN, '%s%s%6.4f\n', 'a ', 'c ', con.c);    % set a to cl
%     fprintf(fileRUN, '%s%s%6.4f\n', ['d',elevn, ' '], 'pm ', con.pm);     % set y to y
%     % fprintf('c = %0.2f\n', con.c);
% elseif isfield(con, 'de') == 1
%     fprintf(fileRUN, '%s%s%6.4f\n', ['d',elevn, ' '], ['d',elevn, ' '], con.de);     % set de to de angle
%     fprintf(fileRUN, '%s%s%6.4f\n', 'a ', 'pm ', con.pm);    % set a to pm of 0
% else 
%     error('Missing alpha constraint either in a or in c.');
% end
fprintf(fileRUN, '%s%s%6.4f\n', 'a ', 'a ', con.a);    % set a to cl
fprintf(fileRUN, '%s%s%6.4f\n', 'b ', 'b ', con.b);     % set b to b
fprintf(fileRUN, '%s%s%6.4f\n', ['d',elevn, ' '], ['d',elevn, ' '], con.de);
fprintf(fileRUN, '%s%s%6.4f\n', 'r ', 'r ', con.r);     % set r to r
fprintf(fileRUN, '%s%s%6.4f\n', 'p ', 'p ', con.p);     % set p to p
fprintf(fileRUN, '%s%s%6.4f\n', 'y ', 'y ', con.y);     % set y to y

%%%%%%%%%%%%%%%%%%%%%%%%%%%%





% ailerons
% fprintf(fileRUN, '%s%s%6.4f\n', 'd1 ', 'd1 ', rudder.d_ele);   % rudder
% fprintf(fileRUN, '%s%s%6.4f\n', num1, num1, rudder.d_ele);   % rudder
if n_ail > 0
    num1 = 'd1 ';
    % keyboard
    fprintf(fileRUN, '%s%s%6.4f\n', num1, num1, wing.d_ail);   % aileron
end
% fprintf('WriteAVL_F: Aileron = %0.4f\n', wing.d_ail);

    
% print flaps
for i1 = 1:n_fps            % 1, 2, 3
    indx = n_fps - i1 + 1;  % 3, 2, 1
    num1 = ['d', num2str(n_ail + indx), ' '];
    if isempty(wing.d_fps) == 1
        error('Check wing.d_fps values.');
    else
        fprintf(fileRUN, '%s%s%6.4f\n', num1, num1, wing.d_fps(i1));   % flaps
    end
end

% run the analysis
fprintf(fileRUN, '%s\n', 'x');

% save the stability derivatives
if runs.stFlag == 1
    fprintf(fileRUN, '%s %s\n', 'st', [runs.name, '.stabs']);
end

% save the strip forces
if runs.fsFlag == 1
    fprintf(fileRUN, '%s %s\n', 'fs', [runs.name, '.strip']);
    fprintf(fileRUN, '%s %s\n', 'hm', [runs.name, '.hinge']);
end

% quit
fprintf(fileRUN, '\n');                             % back to main
fprintf(fileRUN, 'QUIT\n');                         % all done
fclose(fileRUN);


end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function WritePreamble(fID, mach, sims, refs, offs, cdp, linewrite)
% Function to write the preamble entry of the avl file
% INPUTS:
%   fID         - avl file id
%   mach        - mach number
%   sims        - 3 x 1 vector of Xsym, Ysym, and Zsym flags
%   refs        - 3 x 1 vector of Sref, Cref, Bref values
%   offs        - 3 x 1 vector of Xref, Yref, Zref values
%   cdp         - profile drag coefficient
%   linewrite   - line for spacing

fprintf(fID, '%s\n', linewrite);                    % break line
fprintf(fID, '%s\n', 'TCS');
fprintf(fID, '%s\n', '! Mach');                         % mach number
fprintf(fID, '%1.1f\n', mach);                     % mach number
fprintf(fID, '%s\t%s\t%s\n', '! Xsym', 'Ysym', 'Zsym'); % sym flags
fprintf(fID, '%1.0f %1.0f %1.0f\n', sims(1), ...
    sims(2), sims(3));                % sym flags
fprintf(fID, '%s\t%s\t%s\n', '! Sref', 'Cref', 'Bref'); % ref flags
fprintf(fID, '%5.1f %5.1f %5.1f\n', refs(1), ...
    refs(2), refs(3));
fprintf(fID, '%s\t%s\t%s\n', '! Xref', 'Yref', 'Zref'); % ref flags
fprintf(fID, '%6.2f %6.2f %6.2f\n', offs(1), ...
    offs(2), offs(3));
fprintf(fID, '%s\n', '! CDp');                          % CDp number
fprintf(fID, '%s\n', num2str(cdp));                % CDp number
fprintf(fID, '\n');

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function WriteSurface(fID, names, chordVort, Cspace, spanVort, Sspace, linewrite)
% Function to write the "SURFACE" entry of the avl file
% INPUTS:
%   fID         - avl file id
%   chordVort   - number of chordwise vortices
%   names       - name of the surface
%   Cspace      - spacing parameter
%   spanVort    - spanwise vortex number
%   Sspace      - spacing method on the wing

fprintf(fID, '%s\n', linewrite);                            % break line
fprintf(fID, '%s\n', 'SURFACE ');                            % surface
fprintf(fID, '%s\n', names);                               % wing 
fprintf(fID, '%s\t%s\t%s\t%s\n', '! Nchordwise', ...        % headers 
    'Cspace', 'Nspanwise', 'Sspace'); 
fprintf(fID, '%d %1.1f %d %1.1f \n', chordVort, ...    % values
    Cspace, spanVort, Sspace);
fprintf(fID, '\n');                                         % newline

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function WriteSection(fID, x, y, z, chord, ainc, spanVort, Sspace, afil)
% Function to write the "SECTION" entry of the avl file
% INPUTS:
%   fID         - avl file id
%   x           - x entry
%   y           - y entry
%   z           - z entry
%   chord       - chord at section
%   ainc        - angle of attack of section
%   spanVort    - spanwise vortex number
%   Sspace      - spacing method on the wing
%   afil        - airfoil information
%       EXAMPLE:
%       NACA 0015  -> afil = 'NACA 0015' 
%       sd7037.dat -> afil = 'AFIL sd7037.dat' 

% Sspace=0.0; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% change later %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(fID, '%s\n', 'SECTION');                              % section
fprintf(fID, '%s\t%s\t%s\t%s\t%s\t%s\t%s\n', '! Xle', ...     % header
    'Yle', 'Zle', 'Chord', 'Ainc', 'Nspanwise', 'Sspace'); 
fprintf(fID, '%5.2f %5.2f %5.2f %5.2f %1.1f %d %1.1f\n', ...              % values
    x, y, z, chord, ainc, spanVort, Sspace); 
 

% add airfoil if needed
if isempty(afil) ~= 1
    a = strsplit(afil);     % get airfoil info and throw error if needed
    if length(a) ~= 2
        error(['afil value of "', afil, '" is not in the proper format.']);
    end
    
    fprintf(fID, '%s\n', cell2mat(a(1)));    % airfoil geometry
    fprintf(fID, '%s\n', cell2mat(a(2)));    % airfoil geometry
end

fprintf(fID, '\n');                      % blank line

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function WriteControl(fID, cname, cgain, xhinge, hingeVec, sgndup)
% Function to write the "CONTROL" entry of the avl file
% INPUTS:
%   fID         - avl file id
%   cname       - name of the control
%   cgain       - control deflect. gain in deg/control variable
%   xhinge      - x/c location of the hinge
%   hingeVec    - 3 x 1 vector of hinge vector rotation
%   sgndup      - sign of deflection 
%       EXAMPLE: 
%       ailerons -> sgndup = -1
%       elevator -> sgndup = +1

fprintf(fID, '%s\n', 'CONTROL');                            % surface
fprintf(fID, '%s\t%s\t%s\t%s\t%s\n', ...
    '! Cname', 'Cgain', 'Xhinge', 'HingeVec', 'SgnDup'); 
fprintf(fID, '%s %1.1f %5.2f %1.1f %1.1f %1.1f %1.1f\n', ...
    cname, cgain, xhinge, hingeVec(1), hingeVec(2), ...
    hingeVec(3), sgndup);
fprintf(fID, '\n');                                         % newline

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function WritePreambleMass(fID, Lunit, Munit, Tunit, g, rho)
% Function to write the preamble for the mass files
% INPUTS:
%   fID     - File identifier
%   Lunit   - length unit
%   Munit   - mass unit
%   Tunit   - time unit
%   g       - gravity [Lunit/Tunit^2]
%   rho     - density [Munit/Lunit^3]

% user info
fprintf(fID, '%s \n', '! ');
fprintf(fID, '%s \n', '! TCS AUTO Mass File');
fprintf(fID, '%s \n', '! ');
fprintf(fID, '%s \n', '!xyz is the location of the item CG');
fprintf(fID, '%s \n', '!Ixx, ... are the inertias about the item CG');
fprintf(fID, '%s \n', '! ');
fprintf(fID, '%s \n', '!x back');
fprintf(fID, '%s \n', '!y right');
fprintf(fID, '%s \n', '!z up');
fprintf(fID, '%s \n', '! ');
fprintf(fID, '%s \n', '!x,y,z system must have origin as the AVL input file');
fprintf(fID, '%s \n', '! ');

% alv info
fprintf(fID, '%s %6.4f %s \n', 'Lunit = ', Lunit, ' m');
fprintf(fID, '%s %6.4f %s \n', 'Munit = ', Munit, ' kg');
fprintf(fID, '%s %6.4f %s \n', 'Tunit = ', Tunit, ' s');
fprintf(fID, '%s \n', ' ');
fprintf(fID, '%s %6.4f\n', 'g = ', g);
fprintf(fID, '%s %6.4f\n', 'rho = ', rho);
fprintf(fID, '%s \n', ' ');
fprintf(fID, '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n', ...
    '! Mass', 'x', 'y', 'z', 'Ixx', 'Iyy', 'Izz', 'Ixy', 'Ixz', 'Iyz');
fprintf(fID, '%s \n', '! ');

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

function WriteMassTable(fID, mass, xcg, ycg, zcg, ...
    IXX, IYY, IZZ, IXY, IXZ, IYZ, comm)
% Function to write a line of the mass table 
% INPUTS:
%   fID     - file identification
%   mass    - mass of the line
%   xcg     - xcg of line
%   ycg     - ycg of line
%   zcg     - zcg of line
%   IXX     - moment of inertia about x
%   IYY     - moment of inertia about y
%   IZZ     - moment of inertia about z
%   IXY     - product of inertia about xy
%   IXZ     - product of inertia about xz
%   IYZ     - product of inertia about YZ
%   comm    - any comments on the line

fprintf(fID, '%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%s\n', ...
    mass, xcg, ycg, zcg, IXX, IYY, IZZ, IXY, IXZ, IYZ, ['   ! ', comm]);

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% [stabDerivs] = ReadStabDerivs(filename) returns a structure of stability
% derivatives written to filename by AVL. 
%
% INPUTS:
%   filename    = [string] filename of stability derivatives file
%
% OUTPUTS:
%   stabDerivs  = structure with the stability derivatives (and other
%                   helpful information)
%
% EXAMPLE: extract the stability derivatives from vanilla.stabs
%
% [stabDerivs] = ReadStabDerivs(vanilla.stabs)
%
% stabDerivs = 
% 
%   struct with fields:
% 
%          e: 0.9681
%        CLa: 5.0222
%        CLb: 0
%        CYa: 0
%        CYb: -0.2680
%        Cla: 0
%        Clb: -0.1956
%        Cma: -0.8081
%        Cmb: 0
%        Cna: 0
%        Cnb: 0.0343
%        CLp: 0
%        CLq: 6.7951
%        CLr: 0
%        CYp: -0.3153
%        CYq: 0
%        CYr: 0.1916
%        Clp: -0.5674
%        Clq: 0
%        Clr: 0.1225
%        Cmp: 0
%        Cmq: -21.5664
%        Cmr: 0
%        Cnp: -0.0452
%        Cnq: 0
%        Cnr: -0.0449
%       CLd1: 0.0438
%       CLd2: 0
%       CLd3: 0.0069
%       CLd4: 0
%       CYd1: 0
%       CYd2: 0.0063
%       CYd3: 0
%       CYd4: -0.0021
%       Cld1: 0
%       Cld2: 0.0090
%       Cld3: 0
%       Cld4: -7.8000e-05
%       Cmd1: 0.0097
%       Cmd2: 0
%       Cmd3: -0.0281
%       Cmd4: 0
%       Cnd1: 0
%       Cnd2: 5.2000e-05
%       Cnd3: 0
%       Cnd4: 8.1700e-04
%     CDffd1: 0.0011
%     CDffd2: 0
%     CDffd3: 8.8000e-05
%     CDffd4: 0
%        ed1: -4.0900e-04
%        ed2: 0
%        ed3: 0.0155
%        ed4: 0
%        Xnp: 0.6448

function [stabDerivs] = ReadStabDerivs_revA(filename)
% Written by Christopher D. Yoder on 9/1/2017 to read avl output file of
% stability derivatives.


% error handling
if ischar(filename) ~= 1
    error('Filename is not a character array.');
end

% do what you came to do
fID = fopen(filename);  % open the file
newLine = fgetl(fID);   % get the first line
exitFlag = 0;           % preallocate

% read
while exitFlag ~= 1     % while not finished yet
    
    % check if skip
    if isempty(newLine) ~= 1      % if not blank
        
        % check type of line
        switch newLine(1:6)         % get the first 6 characters
            
            % get Sref, Cref, Bref
            case '  Sref'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), '=') == 1
                        eval(['stabDerivs.', a{i1 - 1}, ' = ', a{i1 + 1}, ';']);
                    end
                end
                
                
            % get Xref, Yref, Zref
            case '  Xref'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    b1 = strsplit(a{i1}, '=');
                    if length(b1) > 1 && strcmp(a{i1}, '=') ~= 1
                        eval(['stabDerivs.', a{i1 - 1}, ' = ', b1{end}, ';']);
                    elseif strcmp(cell2mat(a(i1)), '=') == 1
                        eval(['stabDerivs.', a{i1 - 1}, ' = ', a{i1 + 1}, ';']);
                    end
                end
            
            % get alpha 
            case '  Alph'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'Alpha') == 1
                        stabDerivs.Alpha = str2double(cell2mat(a(i1 + 2)));
                        break
                    end
                end
                
            % get beta
            case '  Beta'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'Beta') == 1
                        stabDerivs.Beta = str2double(cell2mat(a(i1 + 2)));
                        break
                    end
                end
            
            % get Cl'mom
            case '  CXto'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'Cltot') == 1
                        stabDerivs.Clptot = str2double(cell2mat(a(i1 + 5)));
                        break
                    end
                end
                
            % get Cmtot
            case '  CYto'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'Cmtot') == 1
                        stabDerivs.Cmtot = str2double(cell2mat(a(i1 + 2)));
                        break
                    end
                end

            % get Cntot
            case '  CZto'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'Cntot') == 1
                        stabDerivs.Cnptot = str2double(cell2mat(a(i1 + 5)));
                        break
                    end
                end                
                
            % get CL TOTAL
            case '  CLto'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'CLtot') == 1
                        stabDerivs.CLtot = str2double(cell2mat(a(i1 + 2)));
                        break
                    end
                end                
                
            % get CD TOTAL
            case '  CDto'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'CDtot') == 1
                        stabDerivs.CDtot = str2double(cell2mat(a(i1 + 2)));
                        break
                    end
                end    
                
            % get CDvis
            case '  CDvi'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'CDvis') == 1
                        stabDerivs.CDvis = str2double(cell2mat(a(i1 + 2)));
                        break
                    end
                end 
                
            % get e for Oswalds
            case '  CYff'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'e') == 1
                        stabDerivs.e = str2double(cell2mat(a(i1 + 2)));
                        break
                    elseif strcmp(cell2mat(a(i1)), 'CYff') == 1
                        stabDerivs.CYff = str2double(cell2mat(a(i1 + 2)));
                    end
                end
                
            % get aileron
            case '   ail'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'ailer') == 1
                        stabDerivs.ailer = str2double(cell2mat(a(i1 + 2)));
                        break
                    end
                end 
                
            % get flap
            case '   fla'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'flap3') == 1
                        stabDerivs.flap3 = str2double(cell2mat(a(i1 + 2)));
                        break
                    elseif strcmp(cell2mat(a(i1)), 'flap2') == 1
                        stabDerivs.flap2 = str2double(cell2mat(a(i1 + 2)));
                        break
                    elseif strcmp(cell2mat(a(i1)), 'flap1') == 1
                        stabDerivs.flap1 = str2double(cell2mat(a(i1 + 2)));
                        break
                    end
                end 
            
            % get e for Oswalds
            case '   ELE'
                a = strsplit(newLine);      % split string by delimiter
                for i1 = 1:length(a)        % for all, find e and save it
                    if strcmp(cell2mat(a(i1)), 'ELEV') == 1
                        stabDerivs.elev = str2double(cell2mat(a(i1 + 2)));
                        break
                    end
                end
                
                
                
                
                
            % get the stability axis derivatives
            case  ' Stabi'
                           
                % find and save stab derivs
                while exitFlag ~= 1
                    newLine = fgetl(fID);
                    
                    if length(newLine) > 5
                        a = strsplit(newLine);      % split string by delimiter
                        
                        
                        % handle neutral point entry
                        if strcmp(cell2mat(a(2)), 'Neutral') == 1
                            tf = cell2mat(a(4));    % field string
                            tv = cell2mat(a(6));    % field value
                            eval(['stabDerivs.', tf, ' = ', tv, ';'])  % save to fields
                            exitFlag = 1;
                        else
                        
                            % handle check for stability derivatives
                            for i2 = 1:length(a)                 % for all, find stab derivs
                                if strcmp(cell2mat(a(i2)), '=') == 1
                                    tf = cell2mat(a(i2 - 1));    % field string
                                    tv = cell2mat(a(i2 + 1));    % field value
                                    eval(['stabDerivs.', tf, ' = ', tv, ';'])  % save to fields
                                end
                            end
                        end
                    end
                    
                    % keyboard
                end
                
            otherwise
                newLine = fgetl(fID);
             
        end
                
                    
    end
    
    % new line and repeat
    newLine = fgetl(fID);
    
end          

% change names to solve merge issues
stabDerivs.CLde = stabDerivs.CLd1;
stabDerivs.CYde = stabDerivs.CYd1;
stabDerivs.CDffde = stabDerivs.CDffd1;
if isfield(stabDerivs, 'ed1') == 1
    stabDerivs.ede = stabDerivs.ed1;
else
    stabDerivs.ede = NaN;
end
stabDerivs.Clde = stabDerivs.Cld1;
stabDerivs.Cmde = stabDerivs.Cmd1;
stabDerivs.Cnde = stabDerivs.Cnd1;

% stabDerivs
% keyboard

end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function [Cl, Cd, ai, cmc4, chord, yLE, Fx, Fy, Fz, yl, Mc4] = ReadStrips(filename, plotFlag, varargin)
% [Cl, Cd, ai, cmc4] = ReadStrips(filename) returns the section lift
% coefficient, the section drag coefficient, angle of attack, and moment
% about the quarter chord for the strips in filename. 
%
% INPUTS:
%   filename    - the .strip file generated from AVL code
%   plotFlag    - 1 == yes, plot results. 0 == no plot
% 
% OUTPUTS:
%   Cl          - n x b matrix of sectional lift coefficients
%   Cd          - n x b matrix of sectional drag coefficients
%   ai          - n x b matrix of local angle of attack
%   cmc4        - n x b matrix of moment about the quarter chord
%   chord       - n x b matrix of chord lengths
%   yLE         - n x b matrix of leading edges in span direction
%   Fx          - n x b matrix of X direction forces per unit span
%       CURRENTLY: This is using Cd since drag is in +VE X direction
%   Fy          - n x b matrix of Y direction forces per unit areaspan
%       CURRNETLY: This returns NaN matrix. Use side force coefficients to
%       determine side forces in future revision. 
%   Fz          - n x b matrix of Z direction forces per unit areaspan
%       CURRENTLY: This is using Cl since lift is in +VE Z direction
%   Mc4         - n x b matrix of airfoil pitching moment per unit span
%   yl          - center of lift for the sail in spanwise direction
%
% VARARGIN:
%   design structure populated from RunDesign.m with all the info needed
% 
% NOTE: n is the number of surfaces defined, b is the number of spanwise
% voritces
% NOTE: the wing and geometry plot only is valid for hershey bar wings
%
% Modification table:
% 1. CDY, 9/12/17, added in ability to calculate forces on the bodies from
%       strips file and input structure

close all

% check varargin
rho = NaN;
vel = NaN;
if isempty(varargin) ~= 1   
    design = varargin{1};        % overall structure
    if isstruct(design) == 1
        wingS = design.wing;         % wing structure in design structure
        rudderS = design.rudder;     % rudder structure in design structure
        runsS = design.runs;
        rho = runsS.rho;     % density
        vel = runsS.vel;     % velocity
    end
% 
%     
%     switch exist(design)
%         case 0
%             error('The design you have specified does not exist in the current working directory.');
%     
%         case 1
%             
%             
%         case 2
%             s1 = load(design);
%             designm = s1.design;
%             wingS = designm.wing;         % wing structure in design structure
%             rudderS = designm.rudder;     % rudder structure in design structure
%             runsS = designm.runs;
%             rho = runsS.rho;     % density
%             vel = runsS.vel;     % velocity
%             
%         otherwise
%             error('Input design is not of structure or matrix file format.');
%     end
    
    
end

% preallocate
numc = 2000;
Cl = NaN(numc, numc);
Cd = NaN(numc, numc);
ai = NaN(numc, numc);
cmc4 = NaN(numc, numc);
chord = NaN(numc, numc);
yLE = NaN(numc, numc);
nmbr = NaN(numc, numc);

% % open and discard headers
% fID = fopen(filename);
% for i1 = 1:7
%     newLine = fgetl(fID);
% end
% 
% % get all the surfaces
% Ncntr = 1;
% Bcntr = 1;
% while newLine ~= -1
%     
%     % handle next line
%     a = strsplit(newLine);      % parse next line
%     if length(a) >= 2           % if greater than two
%         
%         % header for a new surface
%         if strcmp(a{3}, '#') == 1   % if pound sign
%             names{Ncntr} = a{5};     % get name
%             
%             newLine = fgetl(fID);   % get next line
%             a = strsplit(newLine);  % split new line
%             indx(Ncntr) = str2double(a{9});
%             
%             newLine = fgetl(fID);   % get next line
%             a = strsplit(newLine);  % split new line
%             Sref(Ncntr) = str2double(a{5});
%             crd = str2double(a{9});
%             spn(Ncntr) = Sref(Ncntr)/crd;
%             
%             newLine = fgetl(fID);
%             exit1 = 0;
%             while exit1 ~= 1
%                 a = strsplit(newLine);
%                 if length(a) == 8 && strcmp(a{2}, 'Strip') == 1
%                     newLine = fgetl(fID);
%                     exit1 = 1;
%                 else
%                     newLine = fgetl(fID);
%                 end
%             end
%             newLine = fgetl(fID);
%             
%             for i1 = 1:indx(Ncntr)
%                 a = strsplit(newLine);
%                 Cl(Bcntr, Ncntr) = str2double(a{9});
%                 Cd(Bcntr, Ncntr) = str2double(a{10});
%                 ai(Bcntr, Ncntr) = str2double(a{7});
%                 cmc4(Bcntr, Ncntr) = str2double(a{12});
%                 chord(Bcntr, Ncntr) = str2double(a{4});
%                 yLE(Bcntr, Ncntr) = str2double(a{3});
%                 nmbr(Bcntr, Ncntr) = str2double(a{2});
%                 Bcntr = Bcntr + 1;
%                 newLine = fgetl(fID);
%             end
%             Ncntr = Ncntr + 1;
%             Bcntr = 1;
%             
%             
%                    
%         end
%         
%         
%     end
%     newLine = fgetl(fID);
%     
% end


fID = fopen(filename);  % open file
newLine = fgetl(fID);   % get new line
nCNTR = 0;
bCNTR = 1;

% while loop
while newLine ~= -1
    
    if length(newLine) > 7
        
        % consider lines
        switch newLine(1:7)

            % surface and strip forces lines
            case ' Surfac'
                for i1 = 1:4
                    newLine = fgetl(fID);
                end
            
            % surface 
            case '  Surfa'
                nCNTR = nCNTR + 1;
                a = strsplit(newLine);
                names = a{5};           % wing or rudder
                newLine = fgetl(fID);   % chord line
                newLine = fgetl(fID);   % surface area and chord
                a = strsplit(newLine);
                Sref(nCNTR) = str2num(a{5});
                Chord(nCNTR) = str2num(a{9});
                
                for i1 = 1:9
                    newLine = fgetl(fID);
                end
            
            % strip forces
            case ' Strip '
                newLine = fgetl(fID);
                newLine = fgetl(fID);
                while newLine ~= -1
                    a = strsplit(newLine);
                    Cl(bCNTR, nCNTR) = str2num(a{9});
                    Cd(bCNTR, nCNTR) = str2num(a{10});
                    ai(bCNTR, nCNTR) = str2num(a{7});
                    cmc4(bCNTR, nCNTR) = str2num(a{12});
                    chord(bCNTR, nCNTR) = str2num(a{4});
                    yLE(bCNTR, nCNTR) = str2num(a{3});
                    nmbr(bCNTR, nCNTR) = str2num(a{2});
                    bCNTR = bCNTR + 1;
                    newLine = fgetl(fID);
                    if length(newLine) > 7 
                        if strcmp(newLine(1:7), ' ------') == 1
                            newLine = -1;
                        end
                    end
                        
                end
                bCNTR = 1;
                
        end
        
    end
    
    % next line
    newLine = fgetl(fID);

end



% plotting the results
maxROW = numc - sum(isnan(Cl(:, 1)));
% maxROW = max(indx)     % most number of sections
maxCOL = nCNTR;     % number of sections
Cl = Cl(1:maxROW, 1:maxCOL);
Cd = Cd(1:maxROW, 1:maxCOL);
ai = ai(1:maxROW, 1:maxCOL);
cmc4 = cmc4(1:maxROW, 1:maxCOL);
chord = chord(1:maxROW, 1:maxCOL);
yLE = yLE(1:maxROW, 1:maxCOL);
nmbr = nmbr(1:maxROW, 1:maxCOL);



% add in ability to figure out clmax for a given situation
% clmax = 1.0;
clmax = getCLmax(design, yLE);



% draw surface results
if plotFlag == 1
    figure;
    hold on
    MarkerSize = 10;
    LineWidth = 1.5;
    mrkrs = {'-o'; '-s'; '-v'; '-p'; '->'; '-d'; '-h'; '-^'; '-x'; '-<'};
    for i1 = 1:1
%     for i1 = 1:maxCOL
%         plot(yLE(:, i1), Cl(:, i1), mrkrs{i1}, 'MarkerSize', ...
%             MarkerSize', 'LineWidth', LineWidth)
        % lege1{i1} = names{i1};
        plot(yLE(:, i1)/2, Cl(:, i1), 'LineWidth', LineWidth);
    end
    % plot(yLE(:, 1)/2, clmax*ones(length(yLE(:, 1))), 'r', 'LineWidth', LineWidth)
    plot(yLE(:, 1)/2, clmax(:, 1), 'r', 'LineWidth', LineWidth)
    xlabel('Span')
    ylabel('c$_{l}$')
    grid on
    yt = yLE(:, 1);
    xlim([yt(1), 0]/2);
    ylim([0, 2])
    legend({'c$_{l}$'; 'c$_{l_{max}}$'}, 'interpreter', 'latex', 'location', 'southeast')
    % keyboard
    % lege1{i1 + 1} = 'c$_{l_{max}}$';
    % legend(lege1, 'interpreter', 'latex')

%     figure(2);
%     hold on
%     plot(-50, -50, 'o', 'MarkerSize', MarkerSize, 'Color', ...
%                     [0    0.4470    0.7410])
%     plot(-50, -50, 'x', 'MarkerSize', MarkerSize, 'Color', ...
%                     [0.8500    0.3250    0.0980])
%     legend({'Normal', 'Stall'}, 'interpreter', 'latex', ...
%         'location', 'southeast')
%     xIncr = 0;
%     for i1 = 1:maxCOL
%         for i2 = 1:maxROW
% 
%             if Cl(i2, i1) > clmax
%                 plot(xIncr + chord(i2, i1)/4, yLE(i2, i1), ...
%                     'x', 'MarkerSize', 4, 'Color', ...
%                     [0.8500    0.3250    0.0980])
%                     
%             else
%                 plot(xIncr + chord(i2, i1)/4, yLE(i2, i1), ...
%                     'o', 'MarkerSize', 4, 'Color', ...
%                     [0    0.4470    0.7410])
%             end
% 
%         end
% 
%         % plot wing outlines - only works with rectangular wings
%         plot(xIncr + [0, 0, chord(1, i1), chord(1, i1), 0], ...
%             [0, -spn(i1), -spn(i1), 0, 0], '-k', 'LineWidth', LineWidth)
% 
%         xIncr = xIncr + 3.5;
% 
%     end
%     
%     axis([-1, xIncr - 3, -1.1*max(spn), 1])
%     xlabel('Chord Direction')
%     ylabel('Span Direction')
%     grid on
    
end


% calculate forces and moments on the system
Fz = 0.5*rho*(vel^2)*Cl.*chord;     % N/m, lift per unit span
Fx = 0.5*rho*(vel^2)*Cd.*chord;     % N/m, drag per unit span
Fy = NaN*Cl;
Mc4 = 0.5*rho*(vel^2)*cmc4.*chord.*chord;   % N, pitching moment per unit span


% calculate yl
num = sum(Cl(:, 1).*yLE(:, 1));
den = sum(Cl(:, 1));
yl = num/den;

% figure(1);
% hold on
% plot(yl*[1, 1], clmax*[0, 1], 'k*-')
% set(gcf, 'Position', [2995         406         560         420]);


end

function [Clmax] = getCLmax(design, yLE)
% [Clmax] = getCLmax(design) returns a n x 1 array of Cl max values based
% on design. 

% pull datas
% assume Re = 1e5 constraints
% add real data later
% datas = [0,     1.1;
%          15,    1.6;
%          20,    1.4];
% Cl0 = 1.1;

% real data for x/c = 0.7 flap
datas = [0,          1.1357;
         2.0000,     1.1970;
         4.0000,     1.2581;
         6.0000,     1.3168;
         8.0000,     1.3745;
         10.0000,    1.4291;
         12.0000,    1.4700;
         14.0000,    1.4979;
         16.0000,    1.5391;
         18.0000,    1.5824];
Cl0 = datas(1, 2);

% get design stuffs
wing = design.wing;
aildef = wing.d_ail;    % [deg] aileron deflection
fpdef = wing.d_fps;     % [deg] flap deflection
spn = wing.n_spa;
ailS = wing.s_ail;
ailE = wing.e_ail;
fp1S = wing.s_fps(1);
fp2S = wing.s_fps(2);
fp3S = wing.s_fps(3);
fp1E = wing.e_fps(1);
fp2E = wing.e_fps(2);
fp3E = wing.e_fps(3);


% set flap values along span
Clmax = NaN(length(yLE), 1);
yLE = -yLE;
for i1 = 1:length(yLE)
    
    % default value
    Clmax(i1) = Cl0;
    
    % aileron
    if ailS <= yLE(i1) && yLE(i1) <= ailE
        if isempty(aildef) ~= 1
            Clmax(i1) = interp1(datas(:, 1), datas(:, 2), abs(aildef));
        end
        
    % flap 1
    elseif fp1S <= yLE(i1) && yLE(i1) <= fp1E
        if isempty(fpdef) ~= 1
           Clmax(i1) = interp1(datas(:, 1), datas(:, 2), abs(fpdef(1)));
        end
        
    % flap 2
    elseif fp2S <= yLE(i1) && yLE(i1) <= fp2E
        if isempty(fpdef) ~= 1
           Clmax(i1) = interp1(datas(:, 1), datas(:, 2), abs(fpdef(2)));
        end 
        
    % flap 3
    elseif fp3S <= yLE(i1) && yLE(i1) <= fp3E
        if isempty(fpdef) ~= 1
            Clmax(i1) = interp1(datas(:, 1), datas(:, 2), abs(fpdef(3)));
        end 
        
    else
        Clmax(i1) = Cl0;
    
    end
    
end
    
end