function gps3VectorPos(InputFile)
    if exist(InputFile)
        if contains(InputFile,'.TXT')
            input_substring = extractBefore(InputFile,'.TXT');
        else
            input_substring = extractBefore(InputFile,'.txt');
        end
            OutputFile = append(input_substring,"_GPS3VectPos.txt");
        
        inputFID = fopen(InputFile,'r');
        outputFID = fopen(OutputFile,'w');
    end
    
    line = '11';
    j = 0;
    commonTime = "0";
    latString = "0";
    lonString = "0";
    elevString = "0";
    latDeg = "0";
    latMinute = "0";
    lonDeg = "0";
    lonMinute = "0";
    latNum = 0;
    lonNum = 0;
    while ischar(line)
        j = j+1;
        line = fgetl(inputFID);
        if ischar(line) && contains(line,'GGA')
            commaIndex = strfind(line,",");
            commonTime = extractAfter(extractBefore(line,commaIndex(1,2)),"GGA,");
            latString = extractAfter(extractBefore(line,commaIndex(1,4)),commaIndex(1,2));
            lonString = extractAfter(extractBefore(line,commaIndex(1,6)),commaIndex(1,4));
            elevString = extractAfter(extractBefore(line,commaIndex(1,10)),commaIndex(1,9));
            
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
        end
    end
    fclose(inputFID);
    fclose(outputFID);
end
