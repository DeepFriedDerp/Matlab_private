clear all;

filename = './GENERATED_DATA/TestFlight_Aug30_19/Sail1/AODATA00_TimeConvert_Sorted.txt';

inputFID = fopen(filename,'r');

line = fgetl(inputFID);

i = 0;

while ischar(line)
    checkIndex1 = strfind(line,":");
    checkIndex2 = strfind(line,"--");
    commaIndex = strfind(line,",");
    
    if size(commaIndex,2) > 13 && size(checkIndex1,2) < 2 && size(checkIndex2,2) < 2 && contains(line,":") && contains(line,"--") && (commaIndex(1) < checkIndex1(1))
        commonTime = str2double(extractBefore(line,commaIndex(1)));
        if (commonTime > 56900 && commonTime < 57100) || (commonTime > 57700 && commonTime < 57900)  
            gX = (str2double(extractAfter(extractBefore(line,commaIndex(5)),commaIndex(4))));
            gY = (str2double(extractAfter(extractBefore(line,commaIndex(6)),commaIndex(5))));
            gZ = (str2double(extractAfter(extractBefore(line,commaIndex(7)),commaIndex(6))));
            if ~(isnan(gX) && isnan(gY) && isnan(gZ))
                i = i + 1;
                gyroX(i,1) = gX;
                gyroY(i,1) = gY;
                gyroZ(i,1) = gZ;
            else
                disp(i);
                error("nans detected");
            end
        end
    end
    line = fgetl(inputFID);
end

fclose(inputFID);

avgX = mean(gyroX);
avgY = mean(gyroY);
avgZ = mean(gyroZ);

sdX = std(gyroX);
sdY = std(gyroY);
sdZ = std(gyroZ);

maxX = max(abs(gyroX));
maxY = max(abs(gyroY));
maxZ = max(abs(gyroZ));

average = [avgX avgY avgZ]
stanDev = [sdX sdY sdZ]
maximum = [maxX maxY maxZ]
size = [size(gyroX,1) size(gyroY,1) size(gyroZ,1)]