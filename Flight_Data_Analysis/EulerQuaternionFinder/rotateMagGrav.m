function rotateMagGrav(inputFile)
    if exist(inputFile)
        inputFID = fopen(inputFile,'r');
        outputFID = fopen('rotatedMagGrav.txt','w');
    else
        error("inputFile doesnt exist");
    end
    
    rotatedMag = [0,0,0];
    rotatedGrav = [0,0,0];
    i = 0;
    line = fgetl(inputFID);
    while ischar(line)
        i = i+1;
        colonIndex = strfind(line,":");
        eulerAngles_string = extractBefore(line,colonIndex(1));
        magInit_string = extractAfter(extractBefore(line,colonIndex(3)),colonIndex(2));
        gravInit_string = extractAfter(extractBefore(line,colonIndex(4)),colonIndex(3));
        
        index_eul = strfind(eulerAngles_string,",");
        index_mag = strfind(magInit_string,",");
        index_grav = strfind(gravInit_string,",");
        
        eulX = (extractBefore(eulerAngles_string,index_eul(1)));
        eulY = (extractAfter(extractBefore(eulerAngles_string,index_eul(2)),index_eul(1)));
        eulZ = (extractAfter(eulerAngles_string,index_eul(2)));
        eulX = str2double(eulX);
        eulY = str2double(eulY);
        eulZ = str2double(eulZ);
        
        magX = (extractBefore(magInit_string,index_mag(1)));
        magY = (extractAfter(extractBefore(magInit_string,index_mag(2)),index_mag(1)));
        magZ = (extractAfter(magInit_string,index_mag(2)));
        magX = str2double(magX);
        magY = str2double(magY);
        magZ = str2double(magZ);

        gravX = (extractBefore(gravInit_string,index_grav(1)));
        gravY = (extractAfter(extractBefore(gravInit_string,index_grav(2)),index_grav(1)));
        gravZ = (extractAfter(gravInit_string,index_grav(2)));
        gravX = str2double(gravX);
        gravY = str2double(gravY);
        gravZ = str2double(gravZ);
        
        euler = [eulX,eulY,eulZ];
        mag = [magX,magY,magZ];
        grav = [gravX,gravY,gravZ];
        
        rotMag = TrueEulerRotationMatrix(euler,mag,'O');
        rotGrav = TrueEulerRotationMatrix(euler,grav,'O');
        
        if ~isnan(norm(rotMag)) && ~isnan(norm(rotGrav))
            rotatedMag(i,:) = grav;
            rotatedGrav(i,:) = rotGrav;

            fprintf(outputFID,"%f,%f,%f:%f,%f,%f\n",rotMag(1),rotMag(2),rotMag(3),rotGrav(1),rotGrav(2),rotGrav(3));
        end
        line = fgetl(inputFID);
    end
    fclose(outputFID);
    fclose(inputFID);
    
    hold on;
    scatter3(rotatedMag(:,1),rotatedMag(:,2),rotatedMag(:,3),'.');
    scatter3(rotatedGrav(:,1),rotatedGrav(:,2),rotatedGrav(:,3),'.');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    
end
        
        
        