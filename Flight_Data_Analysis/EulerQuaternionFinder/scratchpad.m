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
solvedStuff = solve(eqn,[iOiB jOiB kOiB]);

% firstRow = simplify([iOiB,iOjB,iOkB]);
% secondRow = simplify([jOiB,jOjB,jOkB]);
% thirdRow = simplify([kOiB,kOjB,kOkB]);
% 
% equation = thirdRow == simplify(cross(firstRow,secondRow));
% 
% solvedStuff = solve(equation,[iOiB jOiB]);

OcB = [simplify(solvedStuff.iOiB),iOjB,iOkB;simplify(solvedStuff.jOiB),jOjB,jOkB;simplify(solvedStuff.kOiB),kOjB,kOkB];
BcO = transpose(OcB);

syms xInit yInit zInit xFin yFin zFin

Equation1 = [xFin;yFin;zFin] == OcB*[xInit;yInit;zInit];
Equation2 = [xFin;yFin;zFin] == BcO*[xInit;yInit;zInit];

outputFID = fopen('TrueEulerRotationMatrix.m','w');

fprintf(outputFID,"function [outputVector] = TrueEulerRotationMatrix(eulerAngles,vector,frameOfVector)\n\n");
fprintf(outputFID,"%eulerAngles should be in order (thetaX,thetaY,thetaZ), vector should be same\n");
fprintf(outputFID,"%frameOfVector is either 'B' or 'O'\n\n");
fprintf(outputFID,"thetaX = eulerAngles(1);\nthetaY = eulerAngles(2);\nthetaZ = eulerAngles(3);\n");
fprintf(outputFID,"xInit = vector(1);\nyInit = vector(2);\nzInit = vector(3);\n");
fprintf(outputFID,"if frameOfVector == 'B'\n");
for i = 1:3
    fprintf(outputFID,"%s;\n",strrep(string(Equation1(i,:)),"==","="));
end
fprintf(outputFID,"outputVector = [xFin,yFin,zFin];\nelse\nif frameOfVector == 'O'\n");
for i = 1:3
    fprintf(outputFID,"%s;\n",strrep(string(Equation2(i,:)),"==","="));
end
fprintf(outputFID,"outputVector = [xFin,yFin,zFin];\nelse\n");
fprintf(outputFID,"error('derp the frame didnt match');\nend\nend\nend");

fclose(outputFID);
