function [xO,yO,zO] = rotationFunction_xzy(ph,th,ps,xB,yB,zB)

xO = yB*(sin(ph)*sin(th) - cos(ph)*cos(th)*sin(ps)) + zB*(cos(ph)*sin(th) + cos(th)*sin(ph)*sin(ps)) + xB*cos(ps)*cos(th);
yO = xB*sin(ps) + yB*cos(ph)*cos(ps) - zB*cos(ps)*sin(ph);
zO = yB*(cos(th)*sin(ph) + cos(ph)*sin(ps)*sin(th)) + zB*(cos(ph)*cos(th) - sin(ph)*sin(ps)*sin(th)) - xB*cos(ps)*sin(th);

end