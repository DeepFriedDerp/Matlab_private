function [xO,yO,zO] = rotationFunction_zyx(ph,th,ps,xB,yB,zB)

xO = zB*sin(th) + xB*cos(ps)*cos(th) - yB*cos(th)*sin(ps);
yO = xB*(cos(ph)*sin(ps) + cos(ps)*sin(ph)*sin(th)) + yB*(cos(ph)*cos(ps) - sin(ph)*sin(ps)*sin(th)) - zB*cos(th)*sin(ph);
zO = xB*(sin(ph)*sin(ps) - cos(ph)*cos(ps)*sin(th)) + yB*(cos(ps)*sin(ph) + cos(ph)*sin(ps)*sin(th)) + zB*cos(ph)*cos(th);

end