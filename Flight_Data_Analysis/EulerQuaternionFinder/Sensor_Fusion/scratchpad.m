clear;

addpath quaternion_library;

myIMU = MadgwickAHRS_V2('Beta',5);

inputFID = fopen('rawIMUdata.txt','r');
%outputFID = fopen('rotatedMagnet.txt','w');



eul = [0,0,0];
line = fgetl(inputFID);
minStateFound = 0;
minInd = 0;
i = 0;
while ischar(line)
    i = i+1;
    colonIndex = strfind(line,":");
    eulString = extractAfter(extractBefore(line,colonIndex(5)),colonIndex(4));
    commaIndex = strfind(eulString,",");
    eulX = str2double(extractBefore(eulString,commaIndex(1)));
    eulY = str2double(extractAfter(extractBefore(eulString,commaIndex(2)),commaIndex(1)));
    eulZ = str2double(extractAfter(eulString,commaIndex(2)));
    if eulY < 1 && eulZ < 1
        minStateFound = 1;
        minInd = [minInd,i];
    end
        
    eul(i,:) = [eulX,eulY,eulZ];
    line = fgetl(inputFID);
end
fclose(inputFID);

if minStateFound && minInd(1) < (size(eul,1)/50)
    thetaZ = eul(minInd(2),1);
    thetaZ = thetaZ * ((2*pi())/360);
else
    error("min orientation not found");
end

quatInit = [cos(thetaZ/2) 0 0 sin(thetaZ/2)];
quatInit = quatInit/norm(quatInit);
myIMU.Quaternion = quatInit;

inputFID = fopen('rawIMUdata.txt','r');
outputFID = fopen('rotatedData_Oframe.txt','w');
for(i = i:minInd(2))
    fgetl(inputFID);
end
rotatedMag = [0 0 0];
rotatedGrav = [0 0 0];
rotatedAcc = [0 0 0];
rotatedGyro = [0 0 0];
i = 0;
timeOld = 0;
line = fgetl(inputFID);
while ischar(line)
    i = i+1;
    
    colonIndex = strfind(line,":");
    timeNew = str2double(extractBefore(line,colonIndex(1)));
    accString = string(extractAfter(extractBefore(line,colonIndex(2)),colonIndex(1)));
    gyroString = string(extractAfter(extractBefore(line,colonIndex(3)),colonIndex(2)));
    magString = string(extractAfter(extractBefore(line,colonIndex(4)),colonIndex(3)));
    gravString = string(extractAfter(line,colonIndex(5)));
    
    stringHolder(1,:) = accString;
    stringHolder(2,:) = gyroString;
    stringHolder(3,:) = magString;
    stringHolder(4,:) = gravString;
    vectorHolder = zeros(4,3);
    
    for j = 1:4
        commaIndex = strfind(stringHolder(j),',');
        vectorHolder(j,1) = str2double(extractBefore(stringHolder(j,:),commaIndex(1)));
        vectorHolder(j,2) = str2double(extractAfter(extractBefore(stringHolder(j,:),commaIndex(2)),commaIndex(1)));
        vectorHolder(j,3) = str2double(extractAfter(stringHolder(j,:),commaIndex(2)));
    end
    
    dt = (timeNew - timeOld)/1000;
    timeOld = timeNew;
    
    myIMU = Update(myIMU, vectorHolder(2,:),vectorHolder(1,:),vectorHolder(3,:),dt);
    BcO = quatern2rotMat(myIMU.Quaternion);
    OcB = transpose(BcO);
    
    rotatedMag(i,:) = OcB*transpose(vectorHolder(3,:));
    rotatedGrav(i,:) = OcB*transpose(vectorHolder(4,:));
    
    rotAcc = BcO*transpose(vectorHolder(1,:));
    rotGyro = BcO*transpose(vectorHolder(2,:));
    
    rotatedAcc(i,:) = transpose(rotAcc);
    rotatedGyro(i,:) = transpose(rotGyro);
    
    rotVectHolder = [transpose(rotAcc);transpose(rotGyro);rotatedMag(i,:);rotatedGrav(i,:)];
    
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
hold on;
plot3(rotatedMag(:,1),rotatedMag(:,2),rotatedMag(:,3))
plot3(rotatedGrav(:,1),rotatedGrav(:,2),rotatedGrav(:,3))
%plot3(rotatedAcc(:,1),rotatedAcc(:,2),rotatedAcc(:,3))
%plot3(rotatedGyro(:,1),rotatedGyro(:,2),rotatedGyro(:,3))

fclose(inputFID);
fclose(outputFID);
    