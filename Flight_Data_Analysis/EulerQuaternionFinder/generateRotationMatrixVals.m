function generateRotationMatrixVals(InputFile_Grav,InputFile_Mag)
    if exist(InputFile_Grav) && contains(InputFile_Grav,"_Gravity")
        filename = extractBefore(InputFile_Grav,"_Gravity");
    else
        error("InputFile is not a Gravity Vector File.");
    end
    if exist(InputFile_Mag) && contains(InputFile_Mag,"_Magnet")
        filename = extractBefore(InputFile_Mag,"_Magnet");
        outputFilename = append(filename,"_RotationMatrix.txt");
    else
        error("InputFile is not a Gravity Vector File.");
    end

    inputFID_Grav = fopen(InputFile_Grav,'r');
    inputFID_Mag = fopen(InputFile_Mag,'r');
    outputFID = fopen(outputFilename,'w');
    
    line_grav = fgetl(inputFID_Grav);
    line_mag = fgetl(inputFID_Mag);
    i = 0;
    magRotated = [0,0,0];
    gravRotated = [0,0,0];
    while ischar(line_grav) && ischar(line_mag)
        i = i + 1;
        commaIndex_grav = strfind(line_grav,',');
        if size(commaIndex_grav,2) == 2
            gravX = str2double(extractBefore(line_grav,commaIndex_grav(1,1)));
            gravY = str2double(extractAfter(extractBefore(line_grav,commaIndex_grav(1,2)),commaIndex_grav(1,1)));
            gravZ = str2double(extractAfter(line_grav,commaIndex_grav(1,2)));
            gravVect = [gravX;gravY;gravZ];
        else
            sprintf("line %u in inputfile\n",i);
            error("gravity vector has too many components");
        end
        
        commaIndex_mag = strfind(line_mag,',');
        if size(commaIndex_mag,2) == 2
            magX = str2double(extractBefore(line_mag,commaIndex_mag(1,1)));
            magY = str2double(extractAfter(extractBefore(line_mag,commaIndex_mag(1,2)),commaIndex_mag(1,1)));
            magZ = str2double(extractAfter(line_mag,commaIndex_mag(1,2)));
            magVect = [magX;magY;magZ];
        else
            sprintf("line %u in inputfile\n",i);
            error("magnetometer vector has too many components");
        end
       
        grav_magnitude = norm(gravVect);
        mag_magnitude = norm(magVect);

        %project magnetometer onto gravity vector normal plane
        projMag = magVect - (dot(magVect,gravVect)/(grav_magnitude^2))*gravVect;
        projMag_magnitude = norm(projMag);
        
        grav_X_mag = cross(gravVect,projMag);
        cross_magnitude = norm(grav_X_mag);
        
        grav_hat = gravVect/grav_magnitude;
        pmag_hat = projMag/projMag_magnitude;
        jo_hat = grav_X_mag/cross_magnitude;
        
        rotMatrix = [transpose(pmag_hat);transpose(jo_hat);transpose(grav_hat)];
        
        magRotated(i,:) = transpose(rotMatrix*magVect);
        gravRotated(i,:) = transpose(rotMatrix*gravVect);
        
        for j = 1:3
            for k = 1:3
                if k == 3 && j == 3
                    fprintf(outputFID,"%.4f\n",rotMatrix(j,k));
                else
                    if k == 3
                        fprintf(outputFID,"%.4f:",rotMatrix(j,k));
                    else
                        fprintf(outputFID,"%.4f,",rotMatrix(j,k));
                    end
                end
            end
        end
        line_grav = fgetl(inputFID_Grav);
        line_mag = fgetl(inputFID_Mag);
    end
    hold on
    plot3(magRotated(:,1),magRotated(:,2),magRotated(:,3))
    plot3(gravRotated(:,1),gravRotated(:,2),gravRotated(:,3))
    fclose(inputFID_Grav);
    fclose(inputFID_Mag);
    fclose(outputFID);