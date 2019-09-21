function extractData(InputFile)
    if exist(InputFile)
        if contains(InputFile,'.TXT')
            input_substring = extractBefore(InputFile,'.TXT');
        else
            input_substring = extractBefore(InputFile,'.txt');
        end
        OutputFile_Quat = append(input_substring,"_Quaternions.txt");
        OutputFile_Eul = append(input_substring,"_RawEuler.txt");
        OutputFile_2Eul = append(input_substring,"_ToEuler.txt");
        OutputFile_Grav = append(input_substring,"_Gravity.txt");
        OutputFile_Mag = append(input_substring,"_Magnet.txt");

        InputFID = fopen(InputFile,'r');
        OutputFID_Eul = fopen(OutputFile_Eul,'w');
        OutputFID_2Eul = fopen(OutputFile_2Eul,'w');
        OutputFID_Grav = fopen(OutputFile_Grav,'w');
        OutputFID_Mag= fopen(OutputFile_Mag,'w');
        OutputFID_Quat = fopen(OutputFile_Quat,'w');

        line = fgetl(InputFID);
        while ischar(line)
            colonIndex = strfind(line,":");
            eulVect = extractBefore(line,colonIndex(1,1));
            toeulVect = extractAfter(extractBefore(line,colonIndex(1,2)),colonIndex(1,1));
            magVect = extractAfter(extractBefore(line,colonIndex(1,3)),colonIndex(1,2));
            gravVect = extractAfter(extractBefore(line,colonIndex(1,4)),colonIndex(1,3));
            quatVect = extractAfter(line,colonIndex(1,4));

            fprintf(OutputFID_Eul,"%s\n",eulVect);
            fprintf(OutputFID_2Eul,"%s\n",toeulVect);
            fprintf(OutputFID_Grav,"%s\n",gravVect);
            fprintf(OutputFID_Mag,"%s\n",magVect);
            fprintf(OutputFID_Quat,"%s\n",quatVect);

            line = fgetl(InputFID);
        end
    end
end

            