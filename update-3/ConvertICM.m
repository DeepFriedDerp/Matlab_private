% code to convert ICM tensor

clc
close all
clear

% Classic sail from solidworks in Q frame, in g*mm*mm
Lxx = 721568707.07;
Lxy = -127675437.85;
Lxz = -839614.30;
Lyy = 394164759.43;
Lyz = 1364320.88;
Lzz = 1113357797.61;

% tensor
ICM = [Lxx, Lxy, Lxz; Lxy, Lyy, Lyz; Lxz, Lyz, Lzz];

% units
ICM = ICM./1000;        % g to kg
ICM = ICM./(1000^2);    % mm2 to m2

% frame rotate - not needed

% print to cmd line - copy+paste to runfile
fprintf('Ixx = %0.4f;\n', ICM(1, 1));
fprintf('Iyy = %0.4f;\n', ICM(2, 2));
fprintf('Izz = %0.4f;\n', ICM(3, 3));
fprintf('Ixy = %0.4f;\n', ICM(1, 2));
fprintf('Ixz = %0.4f;\n', ICM(1, 3));
fprintf('Iyz = %0.4f;\n', ICM(2, 3));