function [ICM] = InertiaTensorCalc(sail, info)

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % %          Inertia tensor           % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% unpack
mass1 = info.mass1;
mass2 = info.mass2;
mass3 = info.mass3;
mass4 = info.mass4;
mass5 = info.mass5;
mass6 = info.mass6;
mass7 = info.mass7;

% inertia tensor of big sail
% d = rCMsail/CMmass in the B frame
mass1.d = [sail.Xcm; sail.Ycm; sail.Zcm] - [mass1.xCM; mass1.yCM; mass1.zCM];
mass1.dd = mass1.d*transpose(mass1.d);
mass1.Icm = [mass1.Ixx, mass1.Ixy, mass1.Ixz; mass1.Ixy, mass1.Iyy, mass1.Iyz; ...
    mass1.Ixz, mass1.Iyz, mass1.Izz];
mass1.ICM = mass1.Icm + mass1.mass*mass1.dd;    % inertia tensor about sail CM

mass2.d = [sail.Xcm; sail.Ycm; sail.Zcm] - [mass2.xCM; mass2.yCM; mass2.zCM];
mass2.dd = mass2.d*transpose(mass2.d);
mass2.Icm = [mass2.Ixx, mass2.Ixy, mass2.Ixz; mass2.Ixy, mass2.Iyy, mass2.Iyz; ...
    mass2.Ixz, mass2.Iyz, mass2.Izz];
mass2.ICM = mass2.Icm + mass2.mass*mass2.dd;    % inertia tensor about sail CM

mass3.d = [sail.Xcm; sail.Ycm; sail.Zcm] - [mass3.xCM; mass3.yCM; mass3.zCM];
mass3.dd = mass3.d*transpose(mass3.d);
mass3.Icm = [mass3.Ixx, mass3.Ixy, mass3.Ixz; mass3.Ixy, mass3.Iyy, mass3.Iyz; ...
    mass3.Ixz, mass3.Iyz, mass3.Izz];
mass3.ICM = mass3.Icm + mass3.mass*mass3.dd;    % inertia tensor about sail CM

mass4.d = [sail.Xcm; sail.Ycm; sail.Zcm] - [mass4.xCM; mass4.yCM; mass4.zCM];
mass4.dd = mass4.d*transpose(mass4.d);
mass4.Icm = [mass4.Ixx, mass4.Ixy, mass4.Ixz; mass4.Ixy, mass4.Iyy, mass4.Iyz; ...
    mass4.Ixz, mass4.Iyz, mass4.Izz];
mass4.ICM = mass4.Icm + mass4.mass*mass4.dd;    % inertia tensor about sail CM

mass5.d = [sail.Xcm; sail.Ycm; sail.Zcm] - [mass5.xCM; mass5.yCM; mass5.zCM];
mass5.dd = mass5.d*transpose(mass5.d);
mass5.Icm = [mass5.Ixx, mass5.Ixy, mass5.Ixz; mass5.Ixy, mass5.Iyy, mass5.Iyz; ...
    mass5.Ixz, mass5.Iyz, mass5.Izz];
mass5.ICM = mass5.Icm + mass5.mass*mass5.dd;    % inertia tensor about sail CM

mass6.d = [sail.Xcm; sail.Ycm; sail.Zcm] - [mass6.xCM; mass6.yCM; mass6.zCM];
mass6.dd = mass6.d*transpose(mass6.d);
mass6.Icm = [mass6.Ixx, mass6.Ixy, mass6.Ixz; mass6.Ixy, mass6.Iyy, mass6.Iyz; ...
    mass6.Ixz, mass6.Iyz, mass6.Izz];
mass6.ICM = mass6.Icm + mass6.mass*mass6.dd;    % inertia tensor about sail CM

mass7.d = [sail.Xcm; sail.Ycm; sail.Zcm] - [mass7.xCM; mass7.yCM; mass7.zCM];
mass7.dd = mass7.d*transpose(mass7.d);
mass7.Icm = [mass7.Ixx, mass7.Ixy, mass7.Ixz; mass7.Ixy, mass7.Iyy, mass7.Iyz; ...
    mass7.Ixz, mass7.Iyz, mass7.Izz];
mass7.ICM = mass7.Icm + mass7.mass*mass7.dd;    % inertia tensor about sail CM

ICM = mass1.ICM + mass2.ICM + mass3.ICM + mass4.ICM + ...
    mass5.ICM + mass6.ICM + mass7.ICM;   % sail CM

end