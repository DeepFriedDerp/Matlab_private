function [success] = AVL_Main(filename, alfa1, beta, delta, velocity, p1, q1, r1)
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

%add the src path
addpath src;

%set default success state
success = 1;

% set plot stuffs
SetDefaults;

% load and rename variables
try
    info = LoadFile(filename);
catch
    disp("loadFile error");
    success = 0;
    return;
end
    
alfa = alfa1;
mass1 = info.mass1;
mass2 = info.mass2;
mass3 = info.mass3;
mass4 = info.mass4;
mass5 = info.mass5;
mass6 = info.mass6;
mass7 = info.mass7;
xNP = info.xNP;
yT = info.yT;
xoff = info.xoff;
info.inputfile = append(".\inputFiles\",filename);
if isfield(info, 'avlname') == 1
    sail.name = info.avlname;
end 


% find the design
xout = MathSail(info, 3, xNP, yT);   % get all stuffs
sail.mT = xout.sail.mT;
sail.Xcm = xout.sail.Xcm;
sail.Ycm = xout.sail.Ycm;
sail.Zcm = xout.sail.Zcm;
RollSM = xout.RollSM;
ICM = InertiaTensorCalc(sail, info);

% AVL file
% while AVLexitFlag == 0
% run AVL to find neutral point
% pack up
sail.mass1 = mass1;
sail.mass2 = mass2;
sail.mass3 = mass3;
sail.mass4 = mass4;
sail.mass5 = mass5;
sail.mass6 = mass6;
sail.mass7 = mass7;
sail.xoff = xoff;
sail.ICM = ICM;
sail.alfa = alfa;
sail.delta = delta;
sail.beta = beta;
sail.vel = velocity;
sail.p1 = p1;
sail.q1 = q1;
sail.r1 = r1;

try
    successTranslate = TranslateToAVL(sail);
catch
    disp("translate problem");
    success = 0;
    return;
end

if ~successTranslate
    success = 0;
    return;
end

% xNP = -xNP;
% sail.xNP = xNP;
% info.xNP = xNP;
% info.de = de;
% AVLexitFlag = 1;
%     
% % pack and go
% xout = MathSail(info, 3, xNP, yT);
% info.ICM = ICM;
% info.SM = xout.PitchSM;
% info.yL = xout.yL;
% info.xNP = xNP;
% info.yT = yT;
% info.yLyCM = RollSM;
% info.alfa = alfa;
% info.CL = CL;
% info.q = q;
% 
% % send to output
% WriteOutput(sail, info);




end