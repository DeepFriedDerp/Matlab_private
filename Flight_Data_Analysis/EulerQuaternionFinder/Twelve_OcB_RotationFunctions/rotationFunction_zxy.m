function [xO,yO,zO] = rotationFunction_zxy(ph,th,ps,xB,yB,zB)

xO = xB*(cos(ps)*cos(th) - sin(ph)*sin(ps)*sin(th)) + zB*(cos(th)*sin(ps) + cos(ps)*sin(ph)*sin(th)) - yB*cos(ph)*sin(th);
yO = xB*(cos(ps)*sin(th) + cos(th)*sin(ph)*sin(ps)) + zB*(sin(ps)*sin(th) - cos(ps)*cos(th)*sin(ph)) + yB*cos(ph)*cos(th);
zO = yB*sin(ph) + zB*cos(ph)*cos(ps) - xB*cos(ph)*sin(ps);

end