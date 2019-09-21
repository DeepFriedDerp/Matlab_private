function [xO,yO,zO] = rotationFunction_yzy(ph,th,ps,xB,yB,zB)

xO = xB*(cos(th)^2 + cos(ps)*cos(th)^2 - 1) + (zB*sin(2*th)*(cos(ps) + 1))/2 - yB*cos(th)*sin(ps);
yO = yB*cos(ps) + xB*cos(th)*sin(ps) + zB*sin(ps)*sin(th);
zO = zB*(cos(th)^2 - cos(ps)*sin(th)^2) + yB*sin(ps)*sin(th) - xB*cos(th)*sin(th)*(cos(ps) + 1);

end