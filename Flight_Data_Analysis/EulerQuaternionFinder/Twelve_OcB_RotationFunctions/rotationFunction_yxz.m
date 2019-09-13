function [xO,yO,zO] = rotationFunction_yxz(ph,th,ps,xB,yB,zB)

xO = xB*(cos(ps)*cos(th) + sin(ph)*sin(ps)*sin(th)) - yB*(cos(ps)*sin(th) - cos(th)*sin(ph)*sin(ps)) + zB*cos(ph)*sin(ps);
yO = yB*cos(ph)*cos(th) - zB*sin(ph) + xB*cos(ph)*sin(th);
zO = yB*(sin(ps)*sin(th) + cos(ps)*cos(th)*sin(ph)) - xB*(cos(th)*sin(ps) - cos(ps)*sin(ph)*sin(th)) + zB*cos(ph)*cos(ps);

end