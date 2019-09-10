function gps2VectorVelocityHeading(InputFile)
    if exist(InputFile)
        if contains(InputFile,'.TXT')
            input_substring = extractBefore(InputFile,'.TXT');
        else
            input_substring = extractBefore(InputFile,'.txt');
        end
            OutputFile = append(input_substring,"_GPS2VectVelHeading.txt");
        
        inputFID = fopen(InputFile,'r');
        outputFID = fopen(OutputFile,'w');
    end
    
    line = '11';
    j = 0;
    commonTime = "0";
    velocityString = "0";
    headingString = "0";
   
    while ischar(line)
        j = j+1;
        line = fgetl(inputFID);
        if ischar(line) && contains(line,'RMC')
            commaIndex = strfind(line,",");
            commonTime = extractAfter(extractBefore(line,commaIndex(1,2)),"RMC,");
            velocityString = extractAfter(extractBefore(line,commaIndex(1,8)),commaIndex(1,7));
            headingString = extractAfter(extractBefore(line,commaIndex(1,9)),commaIndex(1,8));
            
            velocityString = string(0.514444*str2double(velocityString));
            
            fprintf(outputFID,"%s,%s,%s\n",commonTime,velocityString,headingString);
        end
    end
    fclose(inputFID);
    fclose(outputFID);
end
