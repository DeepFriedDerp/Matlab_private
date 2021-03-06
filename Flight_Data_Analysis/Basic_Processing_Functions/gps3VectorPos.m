function gps3VectorPos(InputFile,OtherElevFile)
    if ~exist(InputFile)
        error("inputFile does not exist")
    end
    if contains(InputFile,'.TXT')
        input_substring = extractBefore(InputFile,'.TXT');
    else
        input_substring = extractBefore(InputFile,'.txt');
    end
    OutputFile = append(input_substring,"_GPS3VectPos.txt");

    if nargin > 1
        OtherElevFID = fopen(OtherElevFile,'r');
        inputFID = fopen(InputFile,'r');
        outputFID = fopen(OutputFile,'w');
        
        workingSetInput = [0 0 0 0];
        workingSetElev = [0 0];
        
        inputLine = fgetl(inputFID);
        ElevLine = fgetl(OtherElevFID);
        
        i = 0;
        j = 0;
        while ischar(inputLine) || ischar(ElevLine)
            i = i+1;
            
            if ischar(inputLine) && contains(inputLine,'GGA')
                
                
                commaIndex = strfind(inputLine,",");
                if size(commaIndex,2) > 9 
                    commonTime = str2double(extractAfter(extractBefore(inputLine,commaIndex(1,2)),"GGA,"));
                    latString = extractAfter(extractBefore(inputLine,commaIndex(1,4)),commaIndex(1,2));
                    lonString = extractAfter(extractBefore(inputLine,commaIndex(1,6)),commaIndex(1,4));
                    elev = str2double(extractAfter(extractBefore(inputLine,commaIndex(1,10)),commaIndex(1,9)));

                    if contains(latString,',') && contains(lonString,',') && length(latString) > 8 && length(lonString) > 8 && ~contains(latString,'A') && ~contains(lonString,'A') && ~contains(lonString,'N')
                        j = j + 1;
                        latDeg = extractBefore(latString,3);
                        latMinute = extractAfter(extractBefore(latString,","),2);
                        lonDeg = extractBefore(lonString,4);
                        lonMinute = extractAfter(extractBefore(lonString,","),3);
                        latNum = str2double(latDeg) + (str2double(latMinute)/60);
                        lonNum =  str2double(lonDeg) + (str2double(lonMinute)/60);

                        if contains(latString,"E")
                            latNum = (-1)*latNum;
                        end
                        if contains(lonString,'W')
                            lonNum = (-1)*lonNum;
                        end

                        workingSetInput(j,:) = [commonTime latNum lonNum elev];
                    end

                    %fprintf(outputFID,"%s,%.6f,%.6f,%s\n",commonTime,latNum,lonNum,elevString);
            
                end
            end
            
            commonTime = str2double(extractBefore(ElevLine,','));
            altElev = str2double(extractAfter(ElevLine,','));
            
            workingSetElev(i,:) = [commonTime altElev];
            
            inputLine = fgetl(inputFID);
            ElevLine = fgetl(OtherElevFID);
        end
        
        elevTimeLo = workingSetElev(1,1);
        elevTimeHi = workingSetElev(size(workingSetElev,1),1);
        
        h = 1;
        for k = 1:j
            inputTime = workingSetInput(k,1);
            if inputTime < elevTimeLo || inputTime > elevTimeHi
                fprintf(outputFID,"%.3f,%.6f,%.6f,%.1f\n",workingSetInput(k,1),workingSetInput(k,2),workingSetInput(k,3),workingSetInput(k,4));
            else
                h = 1;
                while workingSetElev(h,1) < inputTime
                    h = h + 1;
                end
                h = h - 1;
                avgElev = mean(workingSetElev(h:h+1,2));
                fprintf(outputFID,"%.3f,%.6f,%.6f,%.3f\n",workingSetInput(k,1),workingSetInput(k,2),workingSetInput(k,3),avgElev);
            end
        end
        fclose(OtherElevFID);
    else
        inputFID = fopen(InputFile,'r');
        outputFID = fopen(OutputFile,'w');
        
        inputLine = fgetl(inputFID);
        
        i = 0;
        while ischar(inputLine) 
            i = i+1;
            if ischar(inputLine) && contains(inputLine,'GGA')
                commaIndex = strfind(inputLine,",");
                commonTime = extractAfter(extractBefore(inputLine,commaIndex(1,2)),"GGA,");
                latString = extractAfter(extractBefore(inputLine,commaIndex(1,4)),commaIndex(1,2));
                lonString = extractAfter(extractBefore(inputLine,commaIndex(1,6)),commaIndex(1,4));
                elevString = extractAfter(extractBefore(inputLine,commaIndex(1,10)),commaIndex(1,9));

                latDeg = extractBefore(latString,3);
                latMinute = extractAfter(extractBefore(latString,","),2);
                lonDeg = extractBefore(lonString,4);
                lonMinute = extractAfter(extractBefore(lonString,","),3);
                latNum = str2double(latDeg) + (str2double(latMinute)/60);
                lonNum =  str2double(lonDeg) + (str2double(lonMinute)/60);

                if contains(latString,"E")
                    latNum = (-1)*latNum;
                end
                if contains(lonString,'W')
                    lonNum = (-1)*lonNum;
                end

                fprintf(outputFID,"%s,%.6f,%.6f,%s\n",commonTime,latNum,lonNum,elevString);
                inputLine = fgetl(inputFID);
            end
        end
    end
    fclose(inputFID);
    fclose(outputFID);
end
