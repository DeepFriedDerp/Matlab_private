function [xO,yO,zO] = rotationFunction_xyx(ph,th,ps,xB,yB,zB)

xO = xB*cos(th) + zB*cos(ph)*sin(th) + yB*sin(ph)*sin(th);
yO = yB*(cos(ph)^2 - cos(th)*sin(ph)^2) + xB*sin(ph)*sin(th) - zB*cos(ph)*sin(ph)*(cos(th) + 1);
zO = zB*(cos(ph)^2 + cos(ph)^2*cos(th) - 1) + (yB*sin(2*ph)*(cos(th) + 1))/2 - xB*cos(ph)*sin(th);

end