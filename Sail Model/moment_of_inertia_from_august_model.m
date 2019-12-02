
clear all;
clc;

mT = 1991.00 / 1000;

CM_millis_G = [581.23 -402.36 0.63];
CM_meter_G = CM_millis_G / 1000;


BcG = [
    -1 0 0
    0 1 0
    0 0 -1
    ];
GcB = BcG;

CM_millis_B = transpose(BcG * transpose(CM_millis_G));
CM_meter_B = CM_millis_B / 1000;
rBCM_B = -CM_meter_B;

Ix1 = [721568707.07 -127675437.85 -839614.30]; % grams * square mm, G frame
Iy1 = [-127675437.85 394164759.13 1364320.88];
Iz1 = [-839614.30 1364320.88 1113357797.61];
ICM_1_G = [Ix1 ; Iy1 ; Iz1];

ICM_2_G = ICM_1_G / 1000000000; % kg*m2

ICM_2_B = BcG * ICM_2_G * GcB; % kg*m2

IB_B_1 = ICM_2_B + mT * ((dot(rBCM_B , rBCM_B) * eye(3)) - (transpose(rBCM_B)*rBCM_B));

IB_B_2 = IB_B_1 * 1000000000;

IB_G_1 = BcG * IB_B_2 * GcB;


vpa(CM_millis_B);
vpa(CM_meter_B);
vpa(rBCM_B);
vpa(ICM_1_G);
vpa(ICM_2_G)
vpa(ICM_2_B);
vpa(IB_B_1);
vpa(IB_B_2);
vpa(IB_G_1);