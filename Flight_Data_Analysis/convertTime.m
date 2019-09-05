function convertTime(InputFile)
    if exist(InputFile)
        input_substring = extractBefore(InputFile,'.');
        OutputFile = append(input_substring,"_TimeConvert.txt");
        inputFID = fopen(InputFile,'r');
        outputFID = fopen(OutputFile,'w');
    else
        error("that input filename/path does not exist")
    end

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
                    if contains(line,"$GP")
                        commaIndex = strfind(line,",");
                        utc_time = extractBefore(line,commaIndex(1,2));
                        utc_time = extractAfter(utc_time,",");
                        leftovers = extractAfter(line,commaIndex(1,2));
                    end
                end
            end
            
            if j > 5000
                
            end
            
            if size(utc_time,2) > 1
                utc_front = (extractBefore(utc_time,"."));
                utc_back = (extractAfter(utc_time,"."));
                missingDigits = 6 - size(utc_front,2);
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

                fprintf(outputFID,"%s\n",newline);
            end
        end
    end   

    fclose(inputFID);
    fclose(outputFID);
end