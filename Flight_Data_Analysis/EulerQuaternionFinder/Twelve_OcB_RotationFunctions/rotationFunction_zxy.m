function [xO,yO,zO] = rotationFunction_zxy(ph,th,ps,xB,yB,zB)

xO = xB*(cos(ps)*cos(th) + sin(ph)*sin(ps)*sin(th)) - yB*(cos(th)*sin(ps) - cos(ps)*sin(ph)*sin(th)) + zB*cos(ph)*sin(th);
yO = yB*cos(ph)*cos(ps) - zB*sin(ph) + xB*cos(ph)*sin(ps);
zO = yB*(sin(ps)*sin(th) + cos(ps)*cos(th)*sin(ph)) - xB*(cos(ps)*sin(th) - cos(th)*sin(ph)*sin(ps)) + zB*cos(ph)*cos(th);

end