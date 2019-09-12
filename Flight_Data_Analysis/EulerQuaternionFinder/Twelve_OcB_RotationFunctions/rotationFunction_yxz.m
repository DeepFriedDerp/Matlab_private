function [xO,yO,zO] = rotationFunction_yxz(ph,th,ps,xB,yB,zB)

xO = xB*(cos(ps)*cos(th) - sin(ph)*sin(ps)*sin(th)) + zB*(cos(ps)*sin(th) + cos(th)*sin(ph)*sin(ps)) - yB*cos(ph)*sin(ps);
yO = xB*(cos(th)*sin(ps) + cos(ps)*sin(ph)*sin(th)) + zB*(sin(ps)*sin(th) - cos(ps)*cos(th)*sin(ph)) + yB*cos(ph)*cos(ps);
zO = yB*sin(ph) + zB*cos(ph)*cos(th) - xB*cos(ph)*sin(th);

end