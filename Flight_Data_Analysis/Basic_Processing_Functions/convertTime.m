function convertTime(InputFile)
    if ~exist(InputFile)
        error("that input filename/path does not exist")
    end
    
    if ~exist("GENERATED_DATA")
        mkdir GENERATED_DATA;
    end
    
    if contains(InputFile,'.TXT')
        input_substring = extractBefore(InputFile,'.TXT');
    else
        input_substring = extractBefore(InputFile,'.txt');
    end
    if contains(input_substring,"./")
        filepath = extractAfter(input_substring,'./');
        OutputFile = append("./GENERATED_DATA/",filepath,"_TimeConvert.txt");
    else
        OutputFile = append(input_substring,"_TimeConvert.txt");
    end
        
    inputFID = fopen(InputFile,'r');
    outputFID = fopen(OutputFile,'w');

    line = fgetl(inputFID);
    line = '11';
    GPS = 1;
    GND_STN = 0;
    j = 0;
    while ischar(line)

        j = j + 1;
        line = fgetl(inputFID);
        if size(line,2) > 1
            if (j == 1) && (contains(line,"MS") || contains(line,"ms"))
                GPS = 0;
                if contains(line,"ms")
                    GND_STN = 1;
                end
            end

            utc_time = "";
            utc_add = "";
            leftovers = "";
            if GND_STN
                plus_ind = strfind(line,"+");
                if plus_ind > 5
                    utc_time = extractBefore(line," + ");
                    utc_add = extractBefore(extractAfter(line," + ")," ms");
                    leftovers = extractAfter(line,"ms, ");
                end
            else
                if GPS == 0
                    timestuff = extractBefore(line,"MS");
                    if contains(timestuff,".")
                        utc_time = extractBefore(timestuff,",");
                        utc_add = extractAfter(timestuff,",");
                        leftovers = extractAfter(line,"MS,");
                    end
                else
                    if contains(line,"$GP") && (size(line,2) > 60)
                        commaIndex = strfind(line,",");
                        utc_time = extractBefore(line,commaIndex(1,2));
                        gpsType = extractBefore(utc_time,",");
                        utc_time = extractAfter(utc_time,",");
                        leftovers = extractAfter(line,commaIndex(1,2));
                    end
                end
            end
            
            if size(utc_time,2) > 1
                utc_front = (extractBefore(utc_time,"."));
                utc_back = (extractAfter(utc_time,"."));
                missingDigits = 6 - size(utc_front,2);
                if (2 - missingDigits) > 0
                    hours = str2double(extractBefore(utc_front, (3 - missingDigits)));
                    minutes = str2double(extractAfter(extractBefore(utc_front,(5 - missingDigits)),(2 - missingDigits)));
                    seconds = str2double(extractAfter(utc_front,(4 - missingDigits)));
                    milliSeconds = str2double(utc_back);
                    if GPS == 0
                        milliSeconds = milliSeconds + str2double(utc_add);
                    end

                    commonTime = milliSeconds / 1000;
                    commonTime = commonTime + seconds;
                    commonTime = commonTime + (minutes * 60);
                    commonTime = commonTime + (hours * 3600);

                    newline = append(string(commonTime),",",leftovers);
                    if GPS
                        newline = append(gpsType,",",newline);
                    end

                    fprintf(outputFID,"%s\n",convertStringsToChars(newline));
                end
            end
        end
    end   

    fclose(inputFID);
    fclose(outputFID);
end