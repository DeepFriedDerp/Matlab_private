function [xO,yO,zO] = rotationFunction_xzx(ph,th,ps,xB,yB,zB)

xO = xB*cos(ps) - yB*cos(ph)*sin(ps) + zB*sin(ph)*sin(ps);
yO = yB*(cos(ph)^2 + cos(ph)^2*cos(ps) - 1) - (zB*sin(2*ph)*(cos(ps) + 1))/2 + xB*cos(ph)*sin(ps);
zO = zB*(cos(ph)^2 - cos(ps)*sin(ph)^2) + xB*sin(ph)*sin(ps) + yB*cos(ph)*sin(ph)*(cos(ps) + 1);

end