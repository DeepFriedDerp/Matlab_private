function other3VectorsExtract(InputFile)
    if exist(InputFile)
        if contains(InputFile,'.TXT')
            input_substring = extractBefore(InputFile,'.TXT');
        else
            input_substring = extractBefore(InputFile,'.txt');
        end
            OutputFileAcc = append(input_substring,"_Other3VectAcc.txt");
            OutputFileGyro = append(input_substring,"_Other3VectGyro.txt");
            OutputFileMag = append(input_substring,"_Other3VectMag.txt");
            OutputFileGrav = append(input_substring,"_Other3VectGrav.txt");
            OutputFileEuler = append(input_substring,"_Other3VectEuler.txt");
            
        inputFID = fopen(InputFile,'r');
        outputFID_acc = fopen(OutputFileAcc,'w');
        outputFID_gyro = fopen(OutputFileGyro,'w');
        outputFID_mag = fopen(OutputFileMag,'w');
        outputFID_grav = fopen(OutputFileGrav,'w');
        outputFID_euler = fopen(OutputFileEuler,'w');
    end
    
    line = '11';
    j = 0;
    commonTime = "0";
    accX = "0";
    accY = "0";
    accZ = "0";
    gyroX = "0";
    gyroY = "0";
    gyroZ = "0";
    magX = "0";
    magY = "0";
    magZ = "0";
    gravX = "0";
    gravY = "0";
    gravZ = "0";
    eulX = "0";
    eulY = "0";
    eulZ = "0";
    
    while ischar(line)
        j = j+1;
        line = fgetl(inputFID);
        if ischar(line)
            commaIndex = strfind(line,",");
            if size(commaIndex,2) > 15
                commonTime = extractBefore(line,commaIndex(1,1));
                if contains(line," : ")
                    accX = extractAfter(extractBefore(line,commaIndex(1,2))," : ");
                else
                    accX = extractAfter(extractBefore(line,commaIndex(1,2)),":");
                end
                accY = extractAfter(extractBefore(line,commaIndex(1,3)),commaIndex(1,2));
                accZ = extractAfter(extractBefore(line,commaIndex(1,4)),commaIndex(1,3));
                gyroX = extractAfter(extractBefore(line,commaIndex(1,5)),commaIndex(1,4));
                gyroY = extractAfter(extractBefore(line,commaIndex(1,6)),commaIndex(1,5));
                gyroZ = extractAfter(extractBefore(line,commaIndex(1,7)),commaIndex(1,6));
                magX = extractAfter(extractBefore(line,commaIndex(1,8)),commaIndex(1,7));
                magY = extractAfter(extractBefore(line,commaIndex(1,9)),commaIndex(1,8));
                magZ = extractAfter(extractBefore(line,commaIndex(1,10)),commaIndex(1,9));
                eulX = extractAfter(extractBefore(line,commaIndex(1,11)),commaIndex(1,10));
                eulY = extractAfter(extractBefore(line,commaIndex(1,12)),commaIndex(1,11));
                eulZ = extractAfter(extractBefore(line,commaIndex(1,13)),commaIndex(1,12));
                gravX = extractAfter(extractBefore(line,commaIndex(1,14)),commaIndex(1,13));
                gravY = extractAfter(extractBefore(line,commaIndex(1,15)),commaIndex(1,14));
                gravZ = extractAfter(extractBefore(line,commaIndex(1,16)),commaIndex(1,15));

                fprintf(outputFID_acc,"%s,%s,%s,%s\n",commonTime,accX,accY,accZ);
                fprintf(outputFID_gyro,"%s,%s,%s,%s\n",commonTime,gyroX,gyroY,gyroZ);
                fprintf(outputFID_mag,"%s,%s,%s,%s\n",commonTime,magX,magY,magZ);
                fprintf(outputFID_grav,"%s,%s,%s,%s\n",commonTime,gravX,gravY,gravZ);
                fprintf(outputFID_euler,"%s,%s,%s,%s\n",commonTime,eulX,eulY,eulZ);
            end
        end
    end
    fclose(inputFID);
    fclose(outputFID_acc);
    fclose(outputFID_gyro);
    fclose(outputFID_mag);
    fclose(outputFID_grav);
    fclose(outputFID_euler);
end
