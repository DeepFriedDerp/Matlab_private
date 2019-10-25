function [functionState] = AVL_Main(filename, alpha, betaz, deltae, velocity, p, q, r)
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

%set a bool var to true, in order to constantly AND it with success of
%subsections or other function calls, to see if the AVL function works.
functionState = 1;

% add the path to all of the supporting sourcefiles
if exist('src','dir')
    addpath src;
else
    functionState = 0;
    return;
end

if ~exist('AVL_output','dir')
    mkdir AVL_output;
end

% get the filename right
filename = append(".\inputFiles\",filename);
if ~exist(filename,'file')
    functionState = 0;
    return;
end

% set plot stuffs
SetDefaults;

% load and rename variables
loadSuccess = 0;
loadAttempts = 0;
while (~loadSuccess) && (loadAttempts < 5)
    [info1,loadSuccess] = LoadFile(filename);
    loadAttempts = loadAttempts + 1;
end
if ~loadSuccess
    functionState = 0;
    return;
end

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

persistent numberOfRuns;
if isempty(numberOfRuns)
    numberOfRuns = 0;
end
numberOfRuns = numberOfRuns + 1;
sail.numberOfRuns = numberOfRuns;

[translate_success] = TranslateToAVL(sail);

functionState = functionState && translate_success;

end

