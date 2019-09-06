function sortLines(InputFile)
    if exist(InputFile)
        if contains(InputFile,'.TXT')
            input_substring = extractBefore(InputFile,'.TXT');
        else
            input_substring = extractBefore(InputFile,'.txt');
        end
            OutputFile = append(input_substring,"_Sorted.txt");
        
        inputFID = fopen(InputFile,'r');
        outputFID = fopen(OutputFile,'w');
    else
        error("that input filename/path does not exist")
    end

    line = '11';
    GPS = 0;
    GND_STN = 0;
    j = 0;
    commonTime = [0];
    fullDataLines = ["0"];
    while ischar(line)
        j = j + 1;
        line = fgetl(inputFID);
        if size(line,2) > 1
            if (j == 1) && (contains(line,"$GP"))
                GPS = 1;
            end

            if GPS == 0
                commaIndex = strfind(line,",");
                commonTime(1,j) = str2double(extractBefore(line,commaIndex(1,1)));
            else
                if contains(line,"$GP")
                    commaIndex = strfind(line,",");
                    commonTime(1,j) = str2double(extractAfter(extractBefore(line,commaIndex(1,2)),commaIndex(1,1)));
                end
            end
            
            fullDataLines(1,j) = line;
        end
    end
      
    [~,sortedLineIndex] = sort(commonTime);
    
    for i = 1:size(sortedLineIndex,2)
        lineToWrite = sortedLineIndex(1,i);
        line = fullDataLines(1,lineToWrite);
        fprintf(outputFID,"%s\n",line);
    end
    
    fclose(inputFID);
    fclose(outputFID);
end