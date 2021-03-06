function filterRawData(inputFile,cutoffFreq)
    %check for inputs
    if ~exist(inputFile)
        error("inputfile does not exist");
    end
    %extract inputfile base name
    if contains(inputFile,".TXT")
        filename = extractBefore(inputFile,'.TXT');
    elseif contains(inputFile,'.txt')
        filename = extractBefore(inputFile,'.txt');
    end
    %construct output filename
    outputFile = append(filename,"_FilteredRaw.txt");
    
    %open the inputfile
    inputFID = fopen(inputFile,'r');
    i = 0;
    dt = 0.0303030303;
    newTime = 0;
    oldTime = 0;
    line = fgetl(inputFID);
     while ischar(line)
        i = i+1;
        commaIndex = strfind(line,",");
        newTime = str2double(extractBefore(line,commaIndex(1)));
        if oldTime > 0
            dt = [dt; newTime - oldTime];
        end
        oldTime = newTime;
        line = fgetl(inputFID);
     end
     fclose(inputFID);
     
     avgDt = mean(dt);
     avgFreq = 1/avgDt;
     
     normCutOffFreq = cutoffFreq/avgFreq;
     
     if normCutOffFreq > 1 || normCutOffFreq <= 0
         error("whoa dummy, try a better cutoff frequency")
     end
     
     filterDef = designfilt('lowpassfir', 'FilterOrder', 25, 'CutoffFrequency', normCutOffFreq);
     
     inputFID = fopen(inputFile,'r');
     outputFID = fopen(outputFile,'w');
     
     i = 0;
     line = fgetl(inputFID);
     accRaw = [0,0,0];
     gyroRaw = [0,0,0];
     magRaw = [0,0,0];
     
     while ischar(line)
        i = i + 1;
        
        commaIndex = strfind(line,",");
        
        accX = str2double(extractAfter(extractBefore(line,commaIndex(2)),":"));
        accY = str2double(extractAfter(extractBefore(line,commaIndex(3)),commaIndex(2)));
        accZ = str2double(extractAfter(extractBefore(line,commaIndex(4)),commaIndex(3)));

        gyroX = str2double(extractAfter(extractBefore(line,commaIndex(5)),commaIndex(4)));
        gyroY = str2double(extractAfter(extractBefore(line,commaIndex(6)),commaIndex(5)));
        gyroZ = str2double(extractAfter(extractBefore(line,commaIndex(7)),commaIndex(6)));

        magX = str2double(extractAfter(extractBefore(line,commaIndex(8)),commaIndex(7)));
        magY = str2double(extractAfter(extractBefore(line,commaIndex(9)),commaIndex(8)));
        magZ = str2double(extractAfter(extractBefore(line,commaIndex(10)),commaIndex(9)));
        
        %assemble the individual points into vectors
        accRaw(i,:) = [accX;accY;accZ];
        gyroRaw(i,:) = [gyroX;gyroY;gyroZ];
        magRaw(i,:) = [magX;magY;magZ];
        
        line = fgetl(inputFID);
     end
     
     fclose(inputFID);
     
     accFilt = filtfilt(filterDef, accRaw);
     gyroFilt = filtfilt(filterDef, gyroRaw);
     magFilt = filtfilt(filterDef, magRaw);
     
%      subplot(2,3,1);
%      plot(accRaw)
%      title("accel Raw");
%      subplot(2,3,2);
%      plot(accFilt)
%      title("accel filtered");
%      subplot(2,3,3);
%      plot(gyroRaw)
%      title("gyro Raw");
%      subplot(2,3,4);
%      plot(gyroFilt)
%      title("gyro filtered");
%      subplot(2,3,5);
%      plot(magRaw)
%      title("mag Raw");
%      subplot(2,3,6);
%      plot(magFilt)
%      title("mag filtered");
     
     accRaw = string(accRaw);
     gyroRaw = string(gyroRaw);
     magRaw = string(magRaw);
     
     accFilt = string(accFilt);
     gyroFilt = string(gyroFilt);
     magFilt = string(magFilt);
     
     inputFID = fopen(inputFile,'r');
     
     i = 0;
     line = fgetl(inputFID);
     while ischar(line)
         i = i + 1;
         
         accOldString = append(accRaw(i,1),',',accRaw(i,2),',',accRaw(i,3));
         gyroOldString = append(gyroRaw(i,1),',',gyroRaw(i,2),',',gyroRaw(i,3));
         magOldString = append(magRaw(i,1),',',magRaw(i,2),',',magRaw(i,3));
         
         accNewString = append(accFilt(i,1),',',accFilt(i,2),',',accFilt(i,3));
         gyroNewString = append(gyroFilt(i,1),',',gyroFilt(i,2),',',gyroFilt(i,3));
         magNewString = append(magFilt(i,1),',',magFilt(i,2),',',magFilt(i,3));
         
         line = strrep(line,accOldString,accNewString);
         line = strrep(line,gyroOldString,gyroNewString);
         line = strrep(line,magOldString,magNewString);
         
         fprintf(outputFID,"%s\n",line);
         
         line = fgetl(inputFID);
     end
     
     fclose(inputFID);
     fclose(outputFID);
end
     
     
     
     