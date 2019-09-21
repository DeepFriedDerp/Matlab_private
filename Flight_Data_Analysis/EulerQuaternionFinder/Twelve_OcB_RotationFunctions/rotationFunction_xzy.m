function [xO,yO,zO] = rotationFunction_xzy(ph,th,ps,xB,yB,zB)

xO = xB*cos(ph)*cos(ps) - yB*sin(ps) + zB*cos(ps)*sin(ph);
yO = xB*(sin(ph)*sin(th) + cos(ph)*cos(th)*sin(ps)) - zB*(cos(ph)*sin(th) - cos(th)*sin(ph)*sin(ps)) + yB*cos(ps)*cos(th);
zO = zB*(cos(ph)*cos(th) + sin(ph)*sin(ps)*sin(th)) - xB*(cos(th)*sin(ph) - cos(ph)*sin(ps)*sin(th)) + yB*cos(ps)*sin(th);

end