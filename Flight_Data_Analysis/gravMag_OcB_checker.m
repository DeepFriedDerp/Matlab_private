clear all;

inputFile = './GENERATED_DATA/TestFlight_Aug30_19/Sail1/AODATA00_TimeConvert_Sorted.txt';
rawOutput = 'methodCheck_rawOut.txt';
errorOutput = 'methodCheck_errorOut.txt';

if ~exist(inputFile)
    error("inputfile does not exist");
end

inputFID = fopen(inputFile, 'r');
rawOutputFID = fopen(rawOutput,'w');
errorOutputFID = fopen(errorOutput,'w');

line = fgetl(inputFID);
i = 0;
while ischar(line)
    commaInd = strfind(line,',');
    
    if size(commaInd,2) > 18
        commonTime = str2double(extractBefore(line,commaInd(1)));
        
        magX = str2double(extractAfter(extractBefore(line,commaInd(8)),commaInd(7)));
        magY = str2double(extractAfter(extractBefore(line,commaInd(9)),commaInd(8)));
        magZ = str2double(extractAfter(extractBefore(line,commaInd(10)),commaInd(9)));
        
        gravX = str2double(extractAfter(extractBefore(line,commaInd(14)),commaInd(13)));
        gravY = str2double(extractAfter(extractBefore(line,commaInd(15)),commaInd(14)));
        gravZ = str2double(extractAfter(extractBefore(line,commaInd(16)),commaInd(15)));
        
        if ~(isnan(commonTime) || isnan(magX) || isnan(magY) ||isnan(magZ) || isnan(gravX) || isnan(gravY) || isnan(gravZ))
            magVect = [magX magY magZ];
            gravVect = [gravX gravY gravZ];
  
            projMagVect = magVect - ((dot(magVect,gravVect)/(norm(gravVect)^2))*gravVect);
            
            magMag = norm(magVect);
            gravMag = norm(gravVect);
            projMagMag = norm(projMagVect);
            
            projMag_hat = projMagVect / projMagMag;
            grav_hat = gravVect / gravMag;
            jO_B = cross(grav_hat, projMag_hat);
            
            OcB = [
                projMag_hat(1)  projMag_hat(2)  projMag_hat(3)
                jO_B(1)         jO_B(2)         jO_B(3)
                grav_hat(1)     grav_hat(2)     grav_hat(3)
                ];
            
            magVect_O = transpose(OcB*transpose(projMagVect));
            gravVect_O = transpose(OcB*transpose(gravVect));
            jO_O = transpose(OcB*transpose(jO_B));
            
            
            magHat_O = magVect_O / norm(magVect_O);
            gravHat_O = gravVect_O / norm(gravVect_O);
            jOHat_O = jO_O / norm(jO_O);
            
            magMag_error = abs((norm(magVect_O) - projMagMag) / projMagMag);
            gravMag_error = abs((norm(gravVect_O) - gravMag) / gravMag);
            jMag_error = abs((norm(jO_O) - norm(jO_B))/ norm(jO_B));
            
            magAngle_error = acos(dot(magHat_O,[1 0 0]));
            gravAngle_error = acos(dot(gravHat_O,[0 0 1]));
            jOAngle_error = acos(dot(jOHat_O,[0 1 0]));
            
            if ~(isnan(magMag_error) || isnan(gravMag_error) || isnan(jMag_error) || isnan(magAngle_error) || isnan(gravAngle_error) || isnan(jOAngle_error))
                i = i + 1;
                
                timeVect(i,:) = commonTime;
                
                mag_O(i,:) = [magVect_O(1) magVect_O(2) magVect_O(3)];
                grav_O(i,:) = [gravVect_O(1) gravVect_O(2) gravVect_O(3)];
                j_O(i,:) = [jO_O(1) jO_O(2) jO_O(3)];
                
                magnet_O(i,1) = norm(transpose(OcB*transpose(magVect)));
                
                mMag_error(i,:) = magMag_error;
                gMag_error(i,:) = gravMag_error;
                jOMag_error(i,:) = jMag_error;
                
                mAngle_error(i,:) = magAngle_error;
                gAngle_error(i,:) = gravAngle_error;
                jAngle_error(i,:) = jOAngle_error;
            end
        end
    end
    line = fgetl(inputFID);
end
%%
i = 1;
while timeVect(i,:) < 56805
    i = i + 1;
end
flight1_start = i;
while timeVect(i,:) < 57195
    i = i + 1;
end
flight1_end = i - 1;
while timeVect(i,:) < 57640
    i = i + 1;
end
flight2_start = i;
while timeVect(i,:) < 57940
    i = i + 1;
end
flight2_end = i - 1;

flight_magO = [mag_O(flight1_start:flight1_end,:) ; mag_O(flight2_start:flight2_end,:)];
flight_gravO = [grav_O(flight1_start:flight1_end,:) ; grav_O(flight2_start:flight2_end,:)];
flight_jO = [j_O(flight1_start:flight1_end,:) ; j_O(flight2_start:flight2_end,:)];

flight_mMagError = [mMag_error(flight1_start:flight1_end) ; mMag_error(flight2_start:flight2_end)];
flight_gMagError = [gMag_error(flight1_start:flight1_end) ; gMag_error(flight2_start:flight2_end)];
flight_jMagError = [jOMag_error(flight1_start:flight1_end) ; jOMag_error(flight2_start:flight2_end)];

flight_mAngError = [mAngle_error(flight1_start:flight1_end) ; mAngle_error(flight2_start:flight2_end)];
flight_gAngError = [gAngle_error(flight1_start:flight1_end) ; gAngle_error(flight2_start:flight2_end)];
flight_jAngError = [jAngle_error(flight1_start:flight1_end) ; jAngle_error(flight2_start:flight2_end)];

mMagError_mean = mean(flight_mMagError)
mMagError_sigma = std(flight_mMagError)

gMagError_mean = mean(flight_gMagError)
gMagError_sigma = std(flight_gMagError)

jMagError_mean = mean(flight_jMagError)
jMagError_sigma = std(flight_jMagError)

mAngError_mean = mean(flight_mAngError)
mAngError_sigma = std(flight_mAngError)

gAngError_mean = mean(flight_gAngError)
gAngError_sigma = std(flight_gAngError)

jAngError_mean = mean(flight_jAngError)
jAngError_sigma = std(flight_jAngError)

for i = 1:size(flight_magO,1)
    magMagPlot(i,1) = norm(flight_magO(i,:));
end

subplot(2,2,1);
plot3(flight_magO(:,1) , flight_magO(:,2) , flight_magO(:,3));
title("projected magnetometer_O");
subplot(2,2,2);
plot3(flight_gravO(:,1) , flight_gravO(:,2) , flight_gravO(:,3));
title("gravVect_O");
subplot(2,2,3);
plot3(flight_jO(:,1) , flight_jO(:,2) , flight_jO(:,3));
title("j_O");
subplot(2,2,4);
plot(magnet_O);
title("projected magMag");

fclose(inputFID);
fclose(rawOutput);
fclose(errorOutput);
            