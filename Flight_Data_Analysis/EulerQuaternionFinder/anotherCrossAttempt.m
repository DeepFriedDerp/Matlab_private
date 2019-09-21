clear all
syms thetaX thetaY thetaZ iOiB jOiB kOiB
Pig = cos(thetaY);
Pjg = cos(thetaZ);

iOjB = cos(thetaZ)*sin(thetaX);
iOkB = cos(thetaX)*sin(thetaY)+sin(thetaX)*cos(thetaY)*sin(thetaZ);

jOjB = cos(thetaX)*cos(thetaZ);
jOkB = sin(thetaX)*sin(thetaY)-cos(thetaX)*cos(thetaY)*sin(thetaZ);

%kOiB = sin(thetaY);
kOjB = -sin(thetaZ);
kOkB = cos(thetaY)*cos(thetaZ);

j = [iOjB;jOjB;kOjB];
k = [iOkB;jOkB;kOkB];
i = [iOiB;jOiB;kOiB];

eqn = cross(j,k) == i;
solve(eqn,[iOiB jOiB kOiB]);

