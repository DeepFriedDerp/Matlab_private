function [xO,yO,zO] = rotationFunction_zyz(ph,th,ps,xB,yB,zB)

xO = xB*(cos(ps)^2 + cos(ps)^2*cos(th) - 1) - (yB*sin(2*ps)*(cos(th) + 1))/2 + zB*cos(ps)*sin(th);
yO = yB*(cos(ps)^2 - cos(th)*sin(ps)^2) + zB*sin(ps)*sin(th) + xB*cos(ps)*sin(ps)*(cos(th) + 1);
zO = zB*cos(th) - xB*cos(ps)*sin(th) + yB*sin(ps)*sin(th);

end