function [xO,yO,zO] = rotationFunction_xyz(ph,th,ps,xB,yB,zB)

xO = zB*sin(th) + xB*cos(ph)*cos(th) - yB*cos(th)*sin(ph);
yO = xB*(cos(ps)*sin(ph) + cos(ph)*sin(ps)*sin(th)) + yB*(cos(ph)*cos(ps) - sin(ph)*sin(ps)*sin(th)) - zB*cos(th)*sin(ps);
zO = xB*(sin(ph)*sin(ps) - cos(ph)*cos(ps)*sin(th)) + yB*(cos(ph)*sin(ps) + cos(ps)*sin(ph)*sin(th)) + zB*cos(ps)*cos(th);

end