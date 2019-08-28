function xdot=testfile(t,x)

m = 0.5;
g = -9.81;
d = 0.0318;
h = d;
b = 2*d;
L = 3*d;
FgX = 0;
FgY = 0;
FgZ = m*g;
FrX = -0.001;
FrY = 0;
FrZ = 0;
px = -L/2;
py = b/2;
pz = h/2;
IxxB = (m/12)*(b^2 + h^2);
IyyB = (m/12)*(h^2 + L^2);
IzzB = (m/12)*(b^2 + L^2);

xdot(1) = x(4);
xdot(2) = x(5);
xdot(3) = x(6);
xdot(4) = (FgZ*IyyB*IzzB*sin(x(7))*sin(x(9)) - (IyyB^2*m*sin(2*x(9))*x(2)*x(11)^2)/2 + FrZ*IyyB*IzzB*sin(x(7))*sin(x(9)) + 2*IyyB*IzzB*m*x(5)*x(12) + IyyB*IzzB*m*x(1)*x(10)^2 + IyyB*IzzB*m*x(1)*x(12)^2 + FgX*IyyB*IzzB*cos(x(8))*cos(x(9)) + FrX*IyyB*IzzB*cos(x(8))*cos(x(9)) + FgY*IyyB*IzzB*cos(x(7))*sin(x(9)) + FrY*IyyB*IzzB*cos(x(7))*sin(x(9)) - 2*IyyB*IzzB*m*x(6)*x(11)*cos(x(9)) + FrX*IzzB*m*px*x(3)*sin(x(8)) + 2*IyyB*IzzB*m*x(5)*x(10)*sin(x(8)) + IyyB^2*m*x(2)*x(10)*x(11)*cos(x(8)) - IzzB^2*m*x(3)*x(11)*x(12)*sin(x(9)) - FgZ*IyyB*IzzB*cos(x(7))*cos(x(9))*sin(x(8)) - FrZ*IyyB*IzzB*cos(x(7))*cos(x(9))*sin(x(8)) + IyyB*IzzB*m*x(1)*x(11)^2*cos(x(9))^2 + FgY*IyyB*IzzB*cos(x(9))*sin(x(7))*sin(x(8)) + FrY*IyyB*IzzB*cos(x(9))*sin(x(7))*sin(x(8)) + (IxxB*IyyB*m*sin(2*x(9))*x(2)*x(11)^2)/2 - (IyyB*IzzB*m*sin(2*x(9))*x(2)*x(11)^2)/2 - FrX*IyyB*m*px*x(2)*cos(x(8))*sin(x(9)) + FrZ*IyyB*m*px*x(2)*cos(x(9))*sin(x(7)) - FrY*IyyB*m*py*x(2)*cos(x(7))*sin(x(9)) - FrY*IzzB*m*px*x(3)*cos(x(8))*sin(x(7)) - FrY*IzzB*m*pz*x(3)*cos(x(7))*sin(x(9)) + 2*IyyB*IzzB*m*x(6)*x(10)*cos(x(8))*sin(x(9)) - FrZ*IyyB*m*py*x(2)*sin(x(7))*sin(x(9)) - FrZ*IzzB*m*pz*x(3)*sin(x(7))*sin(x(9)) - IyyB*IzzB*m*x(1)*x(10)^2*cos(x(8))^2*cos(x(9))^2 - IzzB^2*m*x(3)*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8)) - IzzB^2*m*x(3)*x(10)*x(12)*cos(x(8))*cos(x(9)) - IxxB*IyyB*m*x(2)*x(10)*x(11)*cos(x(8)) + IyyB*IzzB*m*x(2)*x(10)*x(11)*cos(x(8)) + IxxB*IzzB*m*x(3)*x(11)*x(12)*sin(x(9)) + 2*IyyB*IzzB*m*x(1)*x(10)*x(12)*sin(x(8)) - IyyB*IzzB*m*x(3)*x(11)*x(12)*sin(x(9)) - IzzB^2*m*x(3)*x(10)*x(11)*sin(x(8))*sin(x(9)) + IyyB^2*m*x(2)*x(10)^2*cos(x(8))^2*cos(x(9))*sin(x(9)) - 2*IyyB^2*m*x(2)*x(10)*x(11)*cos(x(8))*cos(x(9))^2 + FrY*IyyB*m*px*x(2)*cos(x(7))*cos(x(9)) - FrX*IyyB*m*py*x(2)*cos(x(8))*cos(x(9)) + FrZ*IzzB*m*px*x(3)*cos(x(7))*cos(x(8)) - FrX*IzzB*m*pz*x(3)*cos(x(8))*cos(x(9)) - FrY*IyyB*m*px*x(2)*sin(x(7))*sin(x(8))*sin(x(9)) + IxxB*IzzB*m*x(3)*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8)) - IyyB*IzzB*m*x(3)*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8)) + IxxB*IzzB*m*x(3)*x(10)*x(12)*cos(x(8))*cos(x(9)) - IyyB*IzzB*m*x(3)*x(10)*x(12)*cos(x(8))*cos(x(9)) + IxxB*IzzB*m*x(3)*x(10)*x(11)*sin(x(8))*sin(x(9)) - IyyB*IzzB*m*x(3)*x(10)*x(11)*sin(x(8))*sin(x(9)) - IxxB*IyyB*m*x(2)*x(10)^2*cos(x(8))^2*cos(x(9))*sin(x(9)) + IyyB*IzzB*m*x(2)*x(10)^2*cos(x(8))^2*cos(x(9))*sin(x(9)) + 2*IxxB*IyyB*m*x(2)*x(10)*x(11)*cos(x(8))*cos(x(9))^2 - 2*IyyB*IzzB*m*x(2)*x(10)*x(11)*cos(x(8))*cos(x(9))^2 + FrZ*IyyB*m*py*x(2)*cos(x(7))*cos(x(9))*sin(x(8)) + FrZ*IzzB*m*pz*x(3)*cos(x(7))*cos(x(9))*sin(x(8)) + FrZ*IyyB*m*px*x(2)*cos(x(7))*sin(x(8))*sin(x(9)) - FrY*IyyB*m*py*x(2)*cos(x(9))*sin(x(7))*sin(x(8)) - FrY*IzzB*m*pz*x(3)*cos(x(9))*sin(x(7))*sin(x(8)) - 2*IyyB*IzzB*m*x(1)*x(10)*x(11)*cos(x(8))*cos(x(9))*sin(x(9)))/(IyyB*IzzB*m);
xdot(5) = (IxxB*IzzB*m*x(2)*x(10)^2 - 2*IxxB*IzzB*m*x(4)*x(12) - (IxxB^2*m*sin(2*x(9))*x(1)*x(11)^2)/2 + IxxB*IzzB*m*x(2)*x(11)^2 + IxxB*IzzB*m*x(2)*x(12)^2 + FgY*IxxB*IzzB*cos(x(7))*cos(x(9)) + FrY*IxxB*IzzB*cos(x(7))*cos(x(9)) - FgX*IxxB*IzzB*cos(x(8))*sin(x(9)) + FgZ*IxxB*IzzB*cos(x(9))*sin(x(7)) - FrX*IxxB*IzzB*cos(x(8))*sin(x(9)) + FrZ*IxxB*IzzB*cos(x(9))*sin(x(7)) + FrX*IzzB*m*py*x(3)*sin(x(8)) - 2*IxxB*IzzB*m*x(4)*x(10)*sin(x(8)) + 2*IxxB*IzzB*m*x(6)*x(11)*sin(x(9)) + IxxB^2*m*x(1)*x(10)*x(11)*cos(x(8)) - IzzB^2*m*x(3)*x(11)*x(12)*cos(x(9)) - IxxB*IzzB*m*x(2)*x(10)^2*cos(x(8))^2 - IxxB*IzzB*m*x(2)*x(11)^2*cos(x(9))^2 + FgZ*IxxB*IzzB*cos(x(7))*sin(x(8))*sin(x(9)) + FrZ*IxxB*IzzB*cos(x(7))*sin(x(8))*sin(x(9)) + (IxxB*IyyB*m*sin(2*x(9))*x(1)*x(11)^2)/2 - (IxxB*IzzB*m*sin(2*x(9))*x(1)*x(11)^2)/2 - FgY*IxxB*IzzB*sin(x(7))*sin(x(8))*sin(x(9)) - FrY*IxxB*IzzB*sin(x(7))*sin(x(8))*sin(x(9)) + 2*IxxB*IzzB*m*x(6)*x(10)*cos(x(8))*cos(x(9)) + FrX*IxxB*m*px*x(1)*cos(x(8))*sin(x(9)) - FrZ*IxxB*m*px*x(1)*cos(x(9))*sin(x(7)) + FrY*IxxB*m*py*x(1)*cos(x(7))*sin(x(9)) - FrY*IzzB*m*py*x(3)*cos(x(8))*sin(x(7)) + FrX*IzzB*m*pz*x(3)*cos(x(8))*sin(x(9)) - FrZ*IzzB*m*pz*x(3)*cos(x(9))*sin(x(7)) + FrZ*IxxB*m*py*x(1)*sin(x(7))*sin(x(9)) + IxxB*IzzB*m*x(2)*x(10)^2*cos(x(8))^2*cos(x(9))^2 + IzzB^2*m*x(3)*x(10)^2*cos(x(8))*sin(x(8))*sin(x(9)) - IxxB*IyyB*m*x(1)*x(10)*x(11)*cos(x(8)) + IxxB*IzzB*m*x(1)*x(10)*x(11)*cos(x(8)) - IxxB*IzzB*m*x(3)*x(11)*x(12)*cos(x(9)) + IyyB*IzzB*m*x(3)*x(11)*x(12)*cos(x(9)) - IzzB^2*m*x(3)*x(10)*x(11)*cos(x(9))*sin(x(8)) + IzzB^2*m*x(3)*x(10)*x(12)*cos(x(8))*sin(x(9)) + 2*IxxB*IzzB*m*x(2)*x(10)*x(12)*sin(x(8)) + IxxB^2*m*x(1)*x(10)^2*cos(x(8))^2*cos(x(9))*sin(x(9)) - 2*IxxB^2*m*x(1)*x(10)*x(11)*cos(x(8))*cos(x(9))^2 - FrY*IxxB*m*px*x(1)*cos(x(7))*cos(x(9)) + FrX*IxxB*m*py*x(1)*cos(x(8))*cos(x(9)) + FrZ*IzzB*m*py*x(3)*cos(x(7))*cos(x(8)) - FrY*IzzB*m*pz*x(3)*cos(x(7))*cos(x(9)) + FrY*IxxB*m*px*x(1)*sin(x(7))*sin(x(8))*sin(x(9)) + FrY*IzzB*m*pz*x(3)*sin(x(7))*sin(x(8))*sin(x(9)) + IxxB*IzzB*m*x(3)*x(10)^2*cos(x(8))*sin(x(8))*sin(x(9)) - IyyB*IzzB*m*x(3)*x(10)^2*cos(x(8))*sin(x(8))*sin(x(9)) - IxxB*IzzB*m*x(3)*x(10)*x(11)*cos(x(9))*sin(x(8)) + IxxB*IzzB*m*x(3)*x(10)*x(12)*cos(x(8))*sin(x(9)) + IyyB*IzzB*m*x(3)*x(10)*x(11)*cos(x(9))*sin(x(8)) - IyyB*IzzB*m*x(3)*x(10)*x(12)*cos(x(8))*sin(x(9)) - IxxB*IyyB*m*x(1)*x(10)^2*cos(x(8))^2*cos(x(9))*sin(x(9)) + IxxB*IzzB*m*x(1)*x(10)^2*cos(x(8))^2*cos(x(9))*sin(x(9)) + 2*IxxB*IyyB*m*x(1)*x(10)*x(11)*cos(x(8))*cos(x(9))^2 - 2*IxxB*IzzB*m*x(1)*x(10)*x(11)*cos(x(8))*cos(x(9))^2 - FrZ*IxxB*m*py*x(1)*cos(x(7))*cos(x(9))*sin(x(8)) - FrZ*IxxB*m*px*x(1)*cos(x(7))*sin(x(8))*sin(x(9)) + FrY*IxxB*m*py*x(1)*cos(x(9))*sin(x(7))*sin(x(8)) - FrZ*IzzB*m*pz*x(3)*cos(x(7))*sin(x(8))*sin(x(9)) + 2*IxxB*IzzB*m*x(2)*x(10)*x(11)*cos(x(8))*cos(x(9))*sin(x(9)))/(IxxB*IzzB*m);
xdot(6) = (FgX*IxxB*IyyB*sin(x(8)) + FrX*IxxB*IyyB*sin(x(8)) + IxxB*IyyB*m*x(3)*x(11)^2 + FgZ*IxxB*IyyB*cos(x(7))*cos(x(8)) + FrZ*IxxB*IyyB*cos(x(7))*cos(x(8)) - FgY*IxxB*IyyB*cos(x(8))*sin(x(7)) - FrY*IxxB*IyyB*cos(x(8))*sin(x(7)) + 2*IxxB*IyyB*m*x(4)*x(11)*cos(x(9)) - FrX*IxxB*m*px*x(1)*sin(x(8)) - FrX*IyyB*m*py*x(2)*sin(x(8)) - 2*IxxB*IyyB*m*x(5)*x(11)*sin(x(9)) - IyyB^2*m*x(2)*x(11)*x(12)*cos(x(9)) - IxxB^2*m*x(1)*x(11)*x(12)*sin(x(9)) + IxxB*IyyB*m*x(3)*x(10)^2*cos(x(8))^2 - 2*IxxB*IyyB*m*x(5)*x(10)*cos(x(8))*cos(x(9)) + FrY*IxxB*m*px*x(1)*cos(x(8))*sin(x(7)) + FrY*IxxB*m*pz*x(1)*cos(x(7))*sin(x(9)) + FrY*IyyB*m*py*x(2)*cos(x(8))*sin(x(7)) - FrX*IyyB*m*pz*x(2)*cos(x(8))*sin(x(9)) + FrZ*IyyB*m*pz*x(2)*cos(x(9))*sin(x(7)) - 2*IxxB*IyyB*m*x(4)*x(10)*cos(x(8))*sin(x(9)) + FrZ*IxxB*m*pz*x(1)*sin(x(7))*sin(x(9)) - IxxB^2*m*x(1)*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8)) + IyyB^2*m*x(2)*x(10)^2*cos(x(8))*sin(x(8))*sin(x(9)) - IxxB^2*m*x(1)*x(10)*x(12)*cos(x(8))*cos(x(9)) - IxxB*IyyB*m*x(2)*x(11)*x(12)*cos(x(9)) + IyyB*IzzB*m*x(2)*x(11)*x(12)*cos(x(9)) - IyyB^2*m*x(2)*x(10)*x(11)*cos(x(9))*sin(x(8)) + IyyB^2*m*x(2)*x(10)*x(12)*cos(x(8))*sin(x(9)) - IxxB*IyyB*m*x(1)*x(11)*x(12)*sin(x(9)) + IxxB*IzzB*m*x(1)*x(11)*x(12)*sin(x(9)) - IxxB^2*m*x(1)*x(10)*x(11)*sin(x(8))*sin(x(9)) - FrZ*IxxB*m*px*x(1)*cos(x(7))*cos(x(8)) + FrX*IxxB*m*pz*x(1)*cos(x(8))*cos(x(9)) - FrZ*IyyB*m*py*x(2)*cos(x(7))*cos(x(8)) + FrY*IyyB*m*pz*x(2)*cos(x(7))*cos(x(9)) - FrY*IyyB*m*pz*x(2)*sin(x(7))*sin(x(8))*sin(x(9)) - IxxB*IyyB*m*x(1)*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8)) + IxxB*IzzB*m*x(1)*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8)) + IxxB*IyyB*m*x(2)*x(10)^2*cos(x(8))*sin(x(8))*sin(x(9)) - IyyB*IzzB*m*x(2)*x(10)^2*cos(x(8))*sin(x(8))*sin(x(9)) - IxxB*IyyB*m*x(1)*x(10)*x(12)*cos(x(8))*cos(x(9)) + IxxB*IzzB*m*x(1)*x(10)*x(12)*cos(x(8))*cos(x(9)) - IxxB*IyyB*m*x(2)*x(10)*x(11)*cos(x(9))*sin(x(8)) + IxxB*IyyB*m*x(2)*x(10)*x(12)*cos(x(8))*sin(x(9)) + IyyB*IzzB*m*x(2)*x(10)*x(11)*cos(x(9))*sin(x(8)) - IyyB*IzzB*m*x(2)*x(10)*x(12)*cos(x(8))*sin(x(9)) - IxxB*IyyB*m*x(1)*x(10)*x(11)*sin(x(8))*sin(x(9)) + IxxB*IzzB*m*x(1)*x(10)*x(11)*sin(x(8))*sin(x(9)) - FrZ*IxxB*m*pz*x(1)*cos(x(7))*cos(x(9))*sin(x(8)) + FrY*IxxB*m*pz*x(1)*cos(x(9))*sin(x(7))*sin(x(8)) + FrZ*IyyB*m*pz*x(2)*cos(x(7))*sin(x(8))*sin(x(9)))/(IxxB*IyyB*m);
xdot(7) = x(10);
xdot(8) = x(11);
xdot(9) = x(12);
xdot(10) = (IxxB^2*x(11)*x(12) - IxxB^2*x(11)*x(12)*cos(x(9))^2 + IyyB^2*x(11)*x(12)*cos(x(9))^2 - FrY*IxxB*pz*cos(x(7)) - FrZ*IxxB*pz*sin(x(7)) - IxxB*IyyB*x(11)*x(12) - IxxB*IzzB*x(11)*x(12) + IxxB^2*x(10)*x(11)*sin(x(8)) + IxxB*IzzB*x(11)*x(12)*cos(x(9))^2 - IyyB*IzzB*x(11)*x(12)*cos(x(9))^2 - IxxB^2*x(10)*x(11)*cos(x(9))^2*sin(x(8)) + IyyB^2*x(10)*x(11)*cos(x(9))^2*sin(x(8)) + FrX*IyyB*py*cos(x(9))*sin(x(8)) + FrX*IxxB*px*sin(x(8))*sin(x(9)) + FrY*IxxB*pz*cos(x(7))*cos(x(9))^2 - FrY*IyyB*pz*cos(x(7))*cos(x(9))^2 + FrZ*IxxB*pz*cos(x(9))^2*sin(x(7)) - FrZ*IyyB*pz*cos(x(9))^2*sin(x(7)) + IxxB*IyyB*x(10)*x(11)*sin(x(8)) - IxxB*IzzB*x(10)*x(11)*sin(x(8)) + FrZ*IxxB*px*cos(x(7))*cos(x(8))*sin(x(9)) - FrX*IxxB*pz*cos(x(8))*cos(x(9))*sin(x(9)) - FrY*IyyB*py*cos(x(8))*cos(x(9))*sin(x(7)) + FrX*IyyB*pz*cos(x(8))*cos(x(9))*sin(x(9)) + IxxB*IzzB*x(10)*x(11)*cos(x(9))^2*sin(x(8)) - IyyB*IzzB*x(10)*x(11)*cos(x(9))^2*sin(x(8)) - FrY*IxxB*px*cos(x(8))*sin(x(7))*sin(x(9)) + IxxB^2*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)) - IyyB^2*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)) + IxxB^2*x(10)*x(12)*cos(x(8))*cos(x(9))*sin(x(9)) - IyyB^2*x(10)*x(12)*cos(x(8))*cos(x(9))*sin(x(9)) + FrZ*IyyB*py*cos(x(7))*cos(x(8))*cos(x(9)) - IxxB*IzzB*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)) + IyyB*IzzB*x(10)^2*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)) - IxxB*IzzB*x(10)*x(12)*cos(x(8))*cos(x(9))*sin(x(9)) + IyyB*IzzB*x(10)*x(12)*cos(x(8))*cos(x(9))*sin(x(9)) + FrZ*IxxB*pz*cos(x(7))*cos(x(9))*sin(x(8))*sin(x(9)) - FrZ*IyyB*pz*cos(x(7))*cos(x(9))*sin(x(8))*sin(x(9)) - FrY*IxxB*pz*cos(x(9))*sin(x(7))*sin(x(8))*sin(x(9)) + FrY*IyyB*pz*cos(x(9))*sin(x(7))*sin(x(8))*sin(x(9)))/(IxxB*IyyB*cos(x(8)));
xdot(11) = ((IyyB*IzzB*sin(2*x(8))*x(10)^2)/2 - (IyyB^2*sin(2*x(8))*x(10)^2)/2 + FrX*IyyB*pz*cos(x(8)) - (IxxB^2*sin(2*x(9))*x(11)*x(12))/2 + (IyyB^2*sin(2*x(9))*x(11)*x(12))/2 - IyyB^2*x(10)*x(12)*cos(x(8)) - IxxB^2*x(10)*x(12)*cos(x(8))*cos(x(9))^2 + IyyB^2*x(10)*x(12)*cos(x(8))*cos(x(9))^2 - FrX*IxxB*px*cos(x(9))*sin(x(8)) - FrZ*IyyB*pz*cos(x(7))*sin(x(8)) + (IxxB*IzzB*sin(2*x(9))*x(11)*x(12))/2 - (IyyB*IzzB*sin(2*x(9))*x(11)*x(12))/2 + FrX*IyyB*py*sin(x(8))*sin(x(9)) + FrY*IyyB*pz*sin(x(7))*sin(x(8)) + FrX*IxxB*pz*cos(x(8))*cos(x(9))^2 - FrX*IyyB*pz*cos(x(8))*cos(x(9))^2 + IxxB*IyyB*x(10)*x(12)*cos(x(8)) + IyyB*IzzB*x(10)*x(12)*cos(x(8)) - IxxB^2*x(10)^2*cos(x(8))*cos(x(9))^2*sin(x(8)) + IyyB^2*x(10)^2*cos(x(8))*cos(x(9))^2*sin(x(8)) + FrY*IxxB*px*cos(x(8))*cos(x(9))*sin(x(7)) + FrY*IxxB*pz*cos(x(7))*cos(x(9))*sin(x(9)) + FrZ*IyyB*py*cos(x(7))*cos(x(8))*sin(x(9)) - FrY*IyyB*pz*cos(x(7))*cos(x(9))*sin(x(9)) - FrY*IyyB*py*cos(x(8))*sin(x(7))*sin(x(9)) + FrZ*IxxB*pz*cos(x(9))*sin(x(7))*sin(x(9)) - FrZ*IyyB*pz*cos(x(9))*sin(x(7))*sin(x(9)) - FrZ*IxxB*pz*cos(x(7))*cos(x(9))^2*sin(x(8)) + FrZ*IyyB*pz*cos(x(7))*cos(x(9))^2*sin(x(8)) + FrY*IxxB*pz*cos(x(9))^2*sin(x(7))*sin(x(8)) - FrY*IyyB*pz*cos(x(9))^2*sin(x(7))*sin(x(8)) - IxxB^2*x(10)*x(11)*cos(x(9))*sin(x(8))*sin(x(9)) + IyyB^2*x(10)*x(11)*cos(x(9))*sin(x(8))*sin(x(9)) + IxxB*IzzB*x(10)^2*cos(x(8))*cos(x(9))^2*sin(x(8)) - IyyB*IzzB*x(10)^2*cos(x(8))*cos(x(9))^2*sin(x(8)) - FrZ*IxxB*px*cos(x(7))*cos(x(8))*cos(x(9)) + IxxB*IzzB*x(10)*x(12)*cos(x(8))*cos(x(9))^2 - IyyB*IzzB*x(10)*x(12)*cos(x(8))*cos(x(9))^2 + IxxB*IzzB*x(10)*x(11)*cos(x(9))*sin(x(8))*sin(x(9)) - IyyB*IzzB*x(10)*x(11)*cos(x(9))*sin(x(8))*sin(x(9)))/(IxxB*IyyB);
xdot(12) = (IxxB*IzzB^2*x(10)*x(11) - IxxB^2*IzzB*x(10)*x(11) - IxxB*IyyB*IzzB*x(10)*x(11) + IxxB*IzzB^2*x(11)*x(12)*sin(x(8)) - IxxB^2*IzzB*x(11)*x(12)*sin(x(8)) + IxxB*IyyB^2*x(10)*x(11)*cos(x(8))^2 - IxxB^2*IyyB*x(10)*x(11)*cos(x(8))^2 - IxxB*IzzB^2*x(10)*x(11)*cos(x(8))^2 + IxxB^2*IzzB*x(10)*x(11)*cos(x(8))^2 - IxxB*IzzB^2*x(10)*x(11)*cos(x(9))^2 + IxxB^2*IzzB*x(10)*x(11)*cos(x(9))^2 + IyyB*IzzB^2*x(10)*x(11)*cos(x(9))^2 - IyyB^2*IzzB*x(10)*x(11)*cos(x(9))^2 - FrX*IyyB*IzzB*py*cos(x(9)) - FrX*IxxB*IzzB*px*sin(x(9)) + IxxB*IyyB*IzzB*x(11)*x(12)*sin(x(8)) + IxxB*IyyB^2*x(10)^2*cos(x(8))^3*cos(x(9))*sin(x(9)) - IxxB^2*IyyB*x(10)^2*cos(x(8))^3*cos(x(9))*sin(x(9)) - IxxB*IzzB^2*x(10)^2*cos(x(8))^3*cos(x(9))*sin(x(9)) + IxxB^2*IzzB*x(10)^2*cos(x(8))^3*cos(x(9))*sin(x(9)) + IyyB*IzzB^2*x(10)^2*cos(x(8))^3*cos(x(9))*sin(x(9)) - IyyB^2*IzzB*x(10)^2*cos(x(8))^3*cos(x(9))*sin(x(9)) - IxxB*IzzB^2*x(11)*x(12)*cos(x(9))^2*sin(x(8)) + IxxB^2*IzzB*x(11)*x(12)*cos(x(9))^2*sin(x(8)) + IyyB*IzzB^2*x(11)*x(12)*cos(x(9))^2*sin(x(8)) - IyyB^2*IzzB*x(11)*x(12)*cos(x(9))^2*sin(x(8)) + FrY*IxxB*IzzB*pz*cos(x(7))*sin(x(8)) + FrZ*IxxB*IzzB*pz*sin(x(7))*sin(x(8)) - 2*IxxB*IyyB^2*x(10)*x(11)*cos(x(8))^2*cos(x(9))^2 + 2*IxxB^2*IyyB*x(10)*x(11)*cos(x(8))^2*cos(x(9))^2 + IxxB*IzzB^2*x(10)*x(11)*cos(x(8))^2*cos(x(9))^2 - IxxB^2*IzzB*x(10)*x(11)*cos(x(8))^2*cos(x(9))^2 - IyyB*IzzB^2*x(10)*x(11)*cos(x(8))^2*cos(x(9))^2 + IyyB^2*IzzB*x(10)*x(11)*cos(x(8))^2*cos(x(9))^2 - FrX*IxxB*IyyB*py*cos(x(8))^2*cos(x(9)) + FrX*IyyB*IzzB*py*cos(x(8))^2*cos(x(9)) - IxxB*IyyB^2*x(11)^2*cos(x(8))*cos(x(9))*sin(x(9)) + IxxB^2*IyyB*x(11)^2*cos(x(8))*cos(x(9))*sin(x(9)) + IxxB*IzzB^2*x(10)^2*cos(x(8))*cos(x(9))*sin(x(9)) - IxxB^2*IzzB*x(10)^2*cos(x(8))*cos(x(9))*sin(x(9)) - IyyB*IzzB^2*x(10)^2*cos(x(8))*cos(x(9))*sin(x(9)) + IyyB^2*IzzB*x(10)^2*cos(x(8))*cos(x(9))*sin(x(9)) - FrX*IxxB*IyyB*px*cos(x(8))^2*sin(x(9)) + FrX*IxxB*IzzB*px*cos(x(8))^2*sin(x(9)) + FrY*IxxB*IyyB*px*cos(x(7))*cos(x(8))*cos(x(9)) + FrZ*IxxB*IyyB*px*cos(x(8))*cos(x(9))*sin(x(7)) - FrY*IxxB*IyyB*py*cos(x(7))*cos(x(8))*sin(x(9)) - FrZ*IxxB*IzzB*pz*cos(x(7))*cos(x(9))*sin(x(9)) + FrZ*IyyB*IzzB*pz*cos(x(7))*cos(x(9))*sin(x(9)) - FrZ*IxxB*IyyB*py*cos(x(8))*sin(x(7))*sin(x(9)) + FrY*IxxB*IzzB*pz*cos(x(9))*sin(x(7))*sin(x(9)) - FrY*IyyB*IzzB*pz*cos(x(9))*sin(x(7))*sin(x(9)) - FrY*IxxB*IzzB*pz*cos(x(7))*cos(x(9))^2*sin(x(8)) + FrY*IyyB*IzzB*pz*cos(x(7))*cos(x(9))^2*sin(x(8)) - FrZ*IxxB*IzzB*pz*cos(x(9))^2*sin(x(7))*sin(x(8)) + FrZ*IyyB*IzzB*pz*cos(x(9))^2*sin(x(7))*sin(x(8)) + FrZ*IxxB*IyyB*py*cos(x(7))*cos(x(8))*cos(x(9))*sin(x(8)) - FrZ*IyyB*IzzB*py*cos(x(7))*cos(x(8))*cos(x(9))*sin(x(8)) + FrZ*IxxB*IyyB*px*cos(x(7))*cos(x(8))*sin(x(8))*sin(x(9)) - FrY*IxxB*IyyB*py*cos(x(8))*cos(x(9))*sin(x(7))*sin(x(8)) - FrZ*IxxB*IzzB*px*cos(x(7))*cos(x(8))*sin(x(8))*sin(x(9)) + FrX*IxxB*IzzB*pz*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)) + FrY*IyyB*IzzB*py*cos(x(8))*cos(x(9))*sin(x(7))*sin(x(8)) - FrX*IyyB*IzzB*pz*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)) - FrY*IxxB*IyyB*px*cos(x(8))*sin(x(7))*sin(x(8))*sin(x(9)) + FrY*IxxB*IzzB*px*cos(x(8))*sin(x(7))*sin(x(8))*sin(x(9)) + FrZ*IxxB*IzzB*pz*cos(x(7))*cos(x(8))^2*cos(x(9))*sin(x(9)) - FrZ*IyyB*IzzB*pz*cos(x(7))*cos(x(8))^2*cos(x(9))*sin(x(9)) - FrY*IxxB*IzzB*pz*cos(x(8))^2*cos(x(9))*sin(x(7))*sin(x(9)) + FrY*IyyB*IzzB*pz*cos(x(8))^2*cos(x(9))*sin(x(7))*sin(x(9)) + IxxB*IzzB^2*x(10)*x(12)*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)) - IxxB^2*IzzB*x(10)*x(12)*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)) - IyyB*IzzB^2*x(10)*x(12)*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)) + IyyB^2*IzzB*x(10)*x(12)*cos(x(8))*cos(x(9))*sin(x(8))*sin(x(9)))/(IxxB*IyyB*IzzB*cos(x(8)));

xdot=xdot';
end