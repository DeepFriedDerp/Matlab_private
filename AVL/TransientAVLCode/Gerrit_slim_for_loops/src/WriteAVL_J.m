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

if (design.runs.staticMassFlag > 1) && (design.runs.numberOfRuns > 1)
    
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
end


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