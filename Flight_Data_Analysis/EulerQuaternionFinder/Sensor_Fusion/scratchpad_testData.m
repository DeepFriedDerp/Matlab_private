clear;

addpath quaternion_library;

myIMU = MadgwickAHRS_V2('Beta',1);

inputFID = fopen('AODATA00_TimeConvert_Sorted.txt','r');
%outputFID = fopen('rotatedMagnet.txt','w');



eul = [0,0,0];
line = fgetl(inputFID);
minStateFound = 0;
minInd = 0;
minIndTime = 0;
i = 0;
while ischar(line)
    i = i+1;
    commaIndex = strfind(line,",");
    time = str2double(extractBefore(line,commaIndex(1)));
    eulX = str2double(extractAfter(extractBefore(line,commaIndex(11)),commaIndex(10)));
    eulY = str2double(extractAfter(extractBefore(line,commaIndex(12)),commaIndex(11)));
    eulZ = str2double(extractAfter(extractBefore(line,commaIndex(13)),commaIndex(12)));
    if eulY < 0.1 && eulZ < 0.1
        if minStateFound < 1
            minIndTime = time;
        end
        minStateFound = 2;
        minInd = [minInd,i];
    end
        
    eul(i,:) = [eulX,eulY,eulZ];
    line = fgetl(inputFID);
end
fclose(inputFID);

if minStateFound > 1 && minInd(1) < (size(eul,1)/50)
    thetaX = eul(minInd(2),1);
    thetaX = thetaX * ((2*pi())/360);
else
    error("min orientation not found");
end

quatInit = [cos(thetaX/2) 0 0 sin(-thetaX/2)];
quatInit = quatInit/norm(quatInit);
myIMU.Quaternion = quatInit;

inputFID = fopen('AODATA00_TimeConvert_Sorted.txt','r');
outputFID = fopen('rotatedData_Oframe.txt','w');
for(i = i:minInd(2))
    fgetl(inputFID);
end
rotatedMag = [0 0 0];
rotatedGrav = [0 0 0];
rotatedAcc = [0 0 0];
rotatedGyro = [0 0 0];
elevation = 0;
i = 0;
timeOld = minIndTime;
line = fgetl(inputFID);
while ischar(line)
    i = i+1;
    fminFinder = find(minInd==i);
    if fminFinder > 0
        thetaX = eul(minInd(fminFinder),1);
        thetaX = thetaX * ((2*pi())/360);
        quatInit = [cos(thetaX/2) 0 0 sin(-thetaX/2)];
        quatInit = quatInit/norm(quatInit);
        myIMU.Quaternion = quatInit;
    end
        
    commaIndex = strfind(line,",");
    timeNew = str2double(extractBefore(line,commaIndex(1)));
    
    elev(i,:) = str2double(extractAfter(extractBefore(line,":"),commaIndex(1)));
    
    accX = str2double(extractAfter(extractBefore(line,commaIndex(2)),":"));
    accY = str2double(extractAfter(extractBefore(line,commaIndex(3)),commaIndex(2)));
    accZ = str2double(extractAfter(extractBefore(line,commaIndex(4)),commaIndex(3)));
    
    gyroX = str2double(extractAfter(extractBefore(line,commaIndex(5)),commaIndex(4)));
    gyroY = str2double(extractAfter(extractBefore(line,commaIndex(6)),commaIndex(5)));
    gyroZ = str2double(extractAfter(extractBefore(line,commaIndex(7)),commaIndex(6)));
    
    magX = str2double(extractAfter(extractBefore(line,commaIndex(8)),commaIndex(7)));
    magY = str2double(extractAfter(extractBefore(line,commaIndex(9)),commaIndex(8)));
    magZ = str2double(extractAfter(extractBefore(line,commaIndex(10)),commaIndex(9)));
    
    gravX = str2double(extractAfter(extractBefore(line,commaIndex(14)),commaIndex(13)));
    gravY = str2double(extractAfter(extractBefore(line,commaIndex(15)),commaIndex(14)));
    gravZ = str2double(extractAfter(extractBefore(line,commaIndex(16)),commaIndex(15)));
    
    acc_B = [accX;accY;accZ];
    gyro_B = [gyroX;gyroY;gyroZ];
    mag_B = [magX;magY;magZ];
    grav_B = [gravX;gravY;gravZ];
    
    dt = (timeNew - timeOld);
    timeOld = timeNew;
    
    myIMU = Update(myIMU, transpose(gyro_B), transpose(acc_B), transpose(mag_B), dt);
    BcO = quatern2rotMat(myIMU.Quaternion);
    OcB = transpose(BcO);
    
    rotatedAcc(i,:) = transpose(OcB*acc_B);
    rotatedGyro(i,:) = transpose(OcB*gyro_B);
    rotatedMag(i,:) = transpose(OcB*mag_B);
    rotatedGrav(i,:) = transpose(OcB*grav_B);
    
    rotVectHolder = [(rotatedAcc(i,:));(rotatedGyro(i,:));(rotatedMag(i,:));(rotatedGrav(i,:))];
    
    for j = 1:4
        for k = 1:3
            if k == 3 && j == 4
                fprintf(outputFID,"%f\n",rotVectHolder(j,k));
            elseif k == 3
                fprintf(outputFID,"%f:",rotVectHolder(j,k));
            else
                fprintf(outputFID,"%f,",rotVectHolder(j,k));
            end
        end
    end
    
    line = fgetl(inputFID);
end

%plot(elev(98784:173619,1));
subplot(2,2,1);
scatter3(rotatedMag(47261:55907,1),rotatedMag(47261:55907,2),rotatedMag(47261:55907,3),'.')
legend('Magnetometer');
xlabel('X');
ylabel('Y');
zlabel('Z');
subplot(2,2,2);
scatter3(rotatedGrav(47261:55907,1),rotatedGrav(47261:55907,2),rotatedGrav(47261:55907,3),'.');
legend('Gravity Vect');
xlabel('X');
ylabel('Y');
zlabel('Z');
subplot(2,2,3);
scatter3(rotatedAcc(47261:55907,1)-rotatedGrav(47261:55907,1),rotatedAcc(47261:55907,2)-rotatedGrav(47261:55907,1),rotatedAcc(47261:55907,3)-rotatedGrav(47261:55907,1)-9.808,'.');
legend('Acceleration');
xlabel('X');
ylabel('Y');
zlabel('Z');
subplot(2,2,4);
scatter3(rotatedGyro(47261:55907,1),rotatedGyro(47261:55907,2),rotatedGyro(47261:55907,3),'.');
legend('Gyroscope');
xlabel('X');
ylabel('Y');
zlabel('Z');

%scatter3(rotatedAcc(:,1),rotatedAcc(:,2),rotatedAcc(:,3),'.')
%scatter3(rotatedGyro(:,1),rotatedGyro(:,2),rotatedGyro(:,3),'.')

fclose(inputFID);
fclose(outputFID);
    