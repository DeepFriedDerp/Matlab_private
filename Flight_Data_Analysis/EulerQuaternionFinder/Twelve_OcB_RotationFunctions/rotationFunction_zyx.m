function [xO,yO,zO] = rotationFunction_zyx(ph,th,ps,xB,yB,zB)

xO = zB*(sin(ph)*sin(ps) + cos(ph)*cos(ps)*sin(th)) - yB*(cos(ps)*sin(ph) - cos(ph)*sin(ps)*sin(th)) + xB*cos(ph)*cos(th);
yO = yB*(cos(ph)*cos(ps) + sin(ph)*sin(ps)*sin(th)) - zB*(cos(ph)*sin(ps) - cos(ps)*sin(ph)*sin(th)) + xB*cos(th)*sin(ph);
zO = zB*cos(ps)*cos(th) - xB*sin(th) + yB*cos(th)*sin(ps);

end