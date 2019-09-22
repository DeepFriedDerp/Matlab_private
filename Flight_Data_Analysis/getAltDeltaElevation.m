function getAltDeltaElevation(inputFile,xtraGndFile)
    if ~exist(inputFile) || ~exist(xtraGndFile)
        error("one of the files doesn't exist");
    end
    
    if contains(inputFile,".TXT")
        filename = extractBefore(inputFile,".TXT");
    elseif contains(inputFile,".txt")
        filename = extractBefore(inputFile,".txt");
    else
        error("inputFile is wrong file extension");
    end
    
    outputFile = append(filename,"_relativeAltElev.txt");
    
    inputFID = fopen(inputFile,'r');
    gndStnFID = fopen(xtraGndFile,'r');
    
    workingDataInput = [0 0 0 0];
    workingDataGnd = [0 0 0];
    
    i = 0;
    lineInput = fgetl(inputFID);
    lineGnd = fgetl(gndStnFID);
    
    while ischar(lineInput) || ischar(lineGnd)
        i = i + 1;
        
        if ischar(lineInput)
            commaIndex = strfind(lineInput,',');
            time = str2double(extractBefore(lineInput,commaIndex(1)));
            officialElev = str2double(extractAfter(extractBefore(lineInput,':'),commaIndex(1)));
            altElev = str2double(extractAfter(extractBefore(lineInput,commaIndex(size(commaIndex,2))),commaIndex(size(commaIndex,2)-1)));
            workingDataInput(i,:) = [time,altElev,0,officialElev];
            lineInput = fgetl(inputFID);
        end
        
        if ischar(lineGnd)
            commaIndex = strfind(lineGnd,',');
            time = str2double(extractBefore(lineGnd,commaIndex(1)));
            officialElev = str2double(extractAfter(extractBefore(lineGnd,':'),commaIndex(1)));
            altElev = str2double(extractAfter(extractBefore(lineGnd,commaIndex(size(commaIndex,2))),commaIndex(size(commaIndex,2)-1)));
            workingDataGnd(i,:) = [time,officialElev,altElev];
            lineGnd = fgetl(gndStnFID);
        end
    end
    
    avgGPS_ElevStandard = mean(workingDataGnd(:,2));
    inputSize = size(workingDataInput,1);
    gndSize = size(workingDataGnd,1);
    gndTimeLo = workingDataGnd(1,1);
    gndTimeHi = workingDataGnd(gndSize,1);
    gndDT = gndTimeHi - gndTimeLo;
    
    if (workingDataInput(1,1) < gndTimeLo) || (workingDataInput(inputSize,1) > gndTimeHi)
        error("timespan of input data is not enveloped by time span of gndStn data");
    end
    
    outputFID = fopen(outputFile,'w');
    k = 1;
    for j = 1:inputSize
        inputTime = workingDataInput(j,1);
        gndTime = workingDataGnd(k,1);
        
        while inputTime > gndTime
            k = k + 1;
            gndTime = workingDataGnd(k,1);
        end
        
        k = k - 1;
        avgGnd_altElev = mean(workingDataGnd(k:k+1,3));
        workingDataInput(j,3) = avgGPS_ElevStandard + (workingDataInput(j,2) - avgGnd_altElev);
        
        fprintf(outputFID,"%.3f,%.2f\n",workingDataInput(j,1),workingDataInput(j,3));
    end
    
    fclose(inputFID);
    fclose(gndStnFID);
    fclose(outputFID);
    
    hold on;
    plot(workingDataInput(:,4))
    plot(workingDataInput(:,2))
    plot(workingDataInput(:,3))
end
    
   
        
            