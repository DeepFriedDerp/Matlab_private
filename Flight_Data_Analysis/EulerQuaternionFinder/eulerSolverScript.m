clear all;
syms ph th ps;

BcA = simplify(BcA_RotationMatrix('zyx',[ph,th,ps]));
AcB = transpose(BcA)

inputFID = fopen("example_data1.txt",'r');
outputFID = fopen("constructedEulerAngles_zyx.txt",'w');
j = 0;
line = fgetl(inputFID);

magRotation = [0,0,0];

while ischar(line)
    j = j + 1;
    colonIndex = strfind(line,":");
    eulerVect_string = extractBefore(line,colonIndex(1,1));
    eulerVect2_string = extractAfter(extractBefore(line,colonIndex(1,2)),colonIndex(1,1));
    magVect_string = extractAfter(extractBefore(line,colonIndex(1,3)),colonIndex(1,2));
    gravVect_string = extractAfter(extractBefore(line,colonIndex(1,4)),colonIndex(1,3));

    commaIndex_eul = strfind(eulerVect_string,",");
    commaIndex_mag = strfind(magVect_string,",");
    commaIndex_grav = strfind(gravVect_string,",");

    eulX = str2double(extractBefore(eulerVect_string,commaIndex_eul(1,1)));
    eulX = (eulX/360)*(2*pi());
    eulY = str2double(extractAfter(extractBefore(eulerVect_string,commaIndex_eul(1,2)),commaIndex_eul(1,1)));
    eulY = (eulY/360)*(2*pi());
    eulZ = str2double(extractAfter(eulerVect_string,commaIndex_eul(1,2)));
    eulZ = (eulZ/360)*(2*pi());

    magX = str2double(extractBefore(magVect_string,commaIndex_mag(1,1)));
    magY = str2double(extractAfter(extractBefore(magVect_string,commaIndex_mag(1,2)),commaIndex_mag(1,1)));
    magZ = str2double(extractAfter(magVect_string,commaIndex_mag(1,2)));
    magVect_B = [magX;magY;magZ];

    gravX = str2double(extractBefore(gravVect_string,commaIndex_grav(1,1)));
    gravY = str2double(extractAfter(extractBefore(gravVect_string,commaIndex_grav(1,2)),commaIndex_grav(1,1)));
    gravZ = str2double(extractAfter(gravVect_string,commaIndex_grav(1,2)));
    gravVect_B = [gravX;gravY;gravZ];

    %project magnetometer onto gravity vector normal plane
    grav_magnitude = norm(gravVect_B);
    mag_magnitude = norm(magVect_B);

    projMagVect_B = magVect_B - (dot(magVect_B,gravVect_B)/(grav_magnitude^2))*gravVect_B;
    pmag_magnitude = norm(projMagVect_B);

    jo = cross(gravVect_B,projMagVect_B);
    jo_magnitude = norm(jo);

    pmag_hat = projMagVect_B/pmag_magnitude;
    grav_hat = gravVect_B/grav_magnitude;
    jo_hat = jo/jo_magnitude;

    OcB(1,:) = [pmag_hat(1) , pmag_hat(2) , pmag_hat(3)];
    OcB(2,:) = [jo_hat(1) , jo_hat(2) , jo_hat(3)];
    OcB(3,:) = [grav_hat(1) , grav_hat(1) , grav_hat(1)];

    thetaMatrix = acos(OcB);

    Eqn(1) = AcB(3,1) == OcB(3,1);
    Eqn(2) = AcB(3,2)/AcB(3,1) == OcB(3,2)/OcB(3,1);
    Eqn(3) = AcB(1,1)/AcB(3,1) == OcB(1,1)/OcB(3,1);
    Eqn = transpose(Eqn);
    Eulers = solve(Eqn,[ph,th,ps],'IgnoreAnalyticConstraints',true);
    
    magRotation(j,:) = OcB*magVect_B;

    fprintf(outputFID,"%f,%f,%f:",eulX,eulY,eulZ);
    fprintf(outputFID,"%s:",eulerVect2_string);
    fprintf(outputFID,"%f,%f,%f:",Eulers.ph,Eulers.th,Eulers.ps);
    fprintf(outputFID,"%f,%f,%f,%f,%f,%f,%f,%f,%f\n",thetaMatrix(1,1),thetaMatrix(1,2),thetaMatrix(1,3),thetaMatrix(2,1),thetaMatrix(2,2),thetaMatrix(2,3),thetaMatrix(3,1),thetaMatrix(3,2),thetaMatrix(3,3));

    line = fgetl(inputFID);
end
plot3(magRotation(:,1),magRotation(:,2),magRotation(:,3))
fclose(inputFID);
fclose(outputFID);