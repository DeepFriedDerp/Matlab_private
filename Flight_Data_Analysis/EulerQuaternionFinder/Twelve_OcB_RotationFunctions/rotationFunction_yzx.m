function [xO,yO,zO] = rotationFunction_yzx(ph,th,ps,xB,yB,zB)

xO = xB*cos(ps)*cos(th) - yB*sin(ps) + zB*cos(ps)*sin(th);
yO = xB*(sin(ph)*sin(th) + cos(ph)*cos(th)*sin(ps)) - zB*(cos(th)*sin(ph) - cos(ph)*sin(ps)*sin(th)) + yB*cos(ph)*cos(ps);
zO = zB*(cos(ph)*cos(th) + sin(ph)*sin(ps)*sin(th)) - xB*(cos(ph)*sin(th) - cos(th)*sin(ph)*sin(ps)) + yB*cos(ps)*sin(ph);

end