function [xO,yO,zO] = rotationFunction_yxy(ph,th,ps,xB,yB,zB)

xO = xB*(cos(th)^2 - cos(ph)*sin(th)^2) + yB*sin(ph)*sin(th) + zB*cos(th)*sin(th)*(cos(ph) + 1);
yO = yB*cos(ph) - zB*cos(th)*sin(ph) + xB*sin(ph)*sin(th);
zO = zB*(cos(th)^2 + cos(ph)*cos(th)^2 - 1) - (xB*sin(2*th)*(cos(ph) + 1))/2 + yB*cos(th)*sin(ph);

end