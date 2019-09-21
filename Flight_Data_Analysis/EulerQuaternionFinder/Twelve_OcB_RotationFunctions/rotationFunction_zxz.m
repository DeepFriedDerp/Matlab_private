function [xO,yO,zO] = rotationFunction_zxz(ph,th,ps,xB,yB,zB)

xO = xB*(cos(ps)^2 - cos(ph)*sin(ps)^2) + zB*sin(ph)*sin(ps) - yB*cos(ps)*sin(ps)*(cos(ph) + 1);
yO = yB*(cos(ps)^2 + cos(ph)*cos(ps)^2 - 1) + (xB*sin(2*ps)*(cos(ph) + 1))/2 - zB*cos(ps)*sin(ph);
zO = zB*cos(ph) + yB*cos(ps)*sin(ph) + xB*sin(ph)*sin(ps);

end