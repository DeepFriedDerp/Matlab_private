function otherWindSpeedExtract(InputFile,calibfile)
    if exist(InputFile)
        if contains(InputFile,'.TXT')
            input_substring = extractBefore(InputFile,'.TXT');
        else
            input_substring = extractBefore(InputFile,'.txt');
        end
            OutputFile = append(input_substring,"_otherWindspeed.txt");
        
        inputFID = fopen(InputFile,'r');
        outputFID = fopen(OutputFile,'w');
        if ~exist(calibfile)
            error("calibration file doesn't exist");
        end
    else
        error("input file doesn't exist");
    end
    
    
    line = '11';
    j = 0;
    binNum = 0;
    velocityNum = 0;
    load(calibfile);
    while ischar(line)
        j = j+1;
        line = fgetl(inputFID);
        if ischar(line) && size(strfind(line,"--"),2) < 2
            commaIndex = strfind(line,",");
            if size(commaIndex,2) < length(line)
                commonTime = extractBefore(line,commaIndex(1,1));
                binNum = str2double(extractAfter(extractBefore(line,"--"),commaIndex(1,size(commaIndex,2))));
                velocityNum = pitotCurveFit(binNum);
                fprintf(outputFID,"%s,%.3f\n",commonTime,velocityNum);
            end
        end
    end
     fclose(inputFID);
     fclose(outputFID);
end