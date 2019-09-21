function [xO,yO,zO] = rotationFunction_yzx(ph,th,ps,xB,yB,zB)

xO = yB*(sin(ph)*sin(th) - cos(ph)*cos(th)*sin(ps)) + zB*(cos(th)*sin(ph) + cos(ph)*sin(ps)*sin(th)) + xB*cos(ph)*cos(ps);
yO = xB*sin(ps) + yB*cos(ps)*cos(th) - zB*cos(ps)*sin(th);
zO = yB*(cos(ph)*sin(th) + cos(th)*sin(ph)*sin(ps)) + zB*(cos(ph)*cos(th) - sin(ph)*sin(ps)*sin(th)) - xB*cos(ps)*sin(ph);

end