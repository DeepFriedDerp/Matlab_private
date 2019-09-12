function [xO,yO,zO] = rotationFunction_xyz(ph,th,ps,xB,yB,zB)

xO = zB*(sin(ph)*sin(ps) + cos(ph)*cos(ps)*sin(th)) - yB*(cos(ph)*sin(ps) - cos(ps)*sin(ph)*sin(th)) + xB*cos(ps)*cos(th);
yO = yB*(cos(ph)*cos(ps) + sin(ph)*sin(ps)*sin(th)) - zB*(cos(ps)*sin(ph) - cos(ph)*sin(ps)*sin(th)) + xB*cos(th)*sin(ps);
zO = zB*cos(ph)*cos(th) - xB*sin(th) + yB*cos(th)*sin(ph);

end