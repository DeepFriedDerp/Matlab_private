function [outputVector] = TrueEulerRotationMatrix(eulerAngles,vector,frameOfVector)

thetaX = eulerAngles(1);
thetaY = eulerAngles(2);
thetaZ = eulerAngles(3);
xInit = vector(1);
yInit = vector(2);
zInit = vector(3);
if frameOfVector == 'B'
xFin = xInit*(sin(thetaZ)*(sin(thetaX)*sin(thetaY) - cos(thetaX)*cos(thetaY)*sin(thetaZ)) + cos(thetaX)*cos(thetaY)*cos(thetaZ)^2) + zInit*(cos(thetaX)*sin(thetaY) + cos(thetaY)*sin(thetaX)*sin(thetaZ)) + yInit*cos(thetaZ)*sin(thetaX);
yFin = zInit*(sin(thetaX)*sin(thetaY) - cos(thetaX)*cos(thetaY)*sin(thetaZ)) - xInit*(cos(thetaY)*sin(thetaX) + cos(thetaX)*sin(thetaY)*sin(thetaZ)) + yInit*cos(thetaX)*cos(thetaZ);
zFin = zInit*cos(thetaY)*cos(thetaZ) - yInit*sin(thetaZ) - xInit*cos(thetaZ)*(2*cos(thetaX)^2*sin(thetaY) - sin(thetaY) + 2*cos(thetaX)*cos(thetaY)*sin(thetaX)*sin(thetaZ));
outputVector = [xFin,yFin,zFin];
else
if frameOfVector == 'O'
xFin = xInit*(sin(thetaZ)*(sin(thetaX)*sin(thetaY) - cos(thetaX)*cos(thetaY)*sin(thetaZ)) + cos(thetaX)*cos(thetaY)*cos(thetaZ)^2) - yInit*(cos(thetaY)*sin(thetaX) + cos(thetaX)*sin(thetaY)*sin(thetaZ)) - zInit*cos(thetaZ)*(2*cos(thetaX)^2*sin(thetaY) - sin(thetaY) + 2*cos(thetaX)*cos(thetaY)*sin(thetaX)*sin(thetaZ));
yFin = yInit*cos(thetaX)*cos(thetaZ) - zInit*sin(thetaZ) + xInit*cos(thetaZ)*sin(thetaX);
zFin = xInit*(cos(thetaX)*sin(thetaY) + cos(thetaY)*sin(thetaX)*sin(thetaZ)) + yInit*(sin(thetaX)*sin(thetaY) - cos(thetaX)*cos(thetaY)*sin(thetaZ)) + zInit*cos(thetaY)*cos(thetaZ);
outputVector = [xFin,yFin,zFin];
else
error('derp the frame didnt match');
end
end
end