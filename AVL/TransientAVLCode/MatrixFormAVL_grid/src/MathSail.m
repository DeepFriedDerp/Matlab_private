function [xout] = MathSail(info, OutFlag, xNP, yT)

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % %         CM calc           % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% unpack
mass1 = info.mass1;
mass2 = info.mass2;
mass3 = info.mass3;
mass4 = info.mass4;
mass5 = info.mass5;
mass6 = info.mass6;
mass7 = info.mass7;

% CM of big sail
sail.mT = mass1.mass + mass2.mass + mass3.mass + mass4.mass + ...
     mass5.mass + mass6.mass + mass7.mass;
sail.Xcm = (mass1.mass*mass1.xCM + mass2.mass*mass2.xCM + ...
    mass3.mass*mass3.xCM + mass4.mass*mass4.xCM + ...
    mass5.mass*mass5.xCM + mass6.mass*mass6.xCM + ...
    mass7.mass*mass7.xCM)/sail.mT;
sail.Ycm = (mass1.mass*mass1.yCM + mass2.mass*mass2.yCM + ...
    mass3.mass*mass3.yCM + mass4.mass*mass4.yCM + ...
    mass5.mass*mass5.yCM + mass6.mass*mass6.yCM + ...
    mass7.mass*mass7.yCM)/sail.mT;
sail.Zcm = (mass1.mass*mass1.zCM + mass2.mass*mass2.zCM + ...
    mass3.mass*mass3.zCM + mass4.mass*mass4.zCM + ...
    mass5.mass*mass5.zCM + mass6.mass*mass6.zCM + ...
    mass7.mass*mass7.zCM)/sail.mT;

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % %         Margins           % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
PitchSM = (sail.Xcm - xNP)/mass1.chord;    % pitch static margin, +VE good
yL = mass1.yCM;      % approx for normal distribution, assume yCM and yL are same half span
RollSM = (yT - yL)/(yT - sail.Ycm);                          % < 1 is good

if OutFlag == 1
    xout = PitchSM;
elseif OutFlag == 2
    xout = RollSM;
elseif OutFlag == 3
    xout.sail = sail;
    xout.xNP = xNP;
    xout.PitchSM = PitchSM;
    xout.yL = yL;
    xout.RollSM = RollSM;
end

end