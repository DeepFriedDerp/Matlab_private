function getIRF_Grav_Mag(rotationFuncFolder,inputDataFile)
    if ~exist(rotationFuncFolder,'dir') || ~exist(inputDataFile,'file')
        error("some of the inputs don't exist");
    end
    
    outputGravFolder = 'IRF_Gravity_datasets';
    outputMagFolder = 'IRF_Magnetometer_datasets';
    if ~exist(outputGravFolder,'dir')
        mkdir(outputGravFolder);
    end
    if ~exist(outputMagFolder,'dir')
        mkdir(outputMagFolder);
    end
    
    inputBaseFileName = 'rotationFunction_';
    rotation_sequence(1,:) = 'xyz';
    rotation_sequence(2,:) = 'xzy';
    rotation_sequence(3,:) = 'yxz';
    rotation_sequence(4,:) = 'yzx';
    rotation_sequence(5,:) = 'zxy';
    rotation_sequence(6,:) = 'zyx';
    rotation_sequence(7,:) = 'xyx';
    rotation_sequence(8,:) = 'xzx';
    rotation_sequence(9,:) = 'yxy';
    rotation_sequence(10,:) = 'yzy';
    rotation_sequence(11,:) = 'zxz';
    rotation_sequence(12,:) = 'zyz'; 
    hold on;

    for i = 1:size(rotation_sequence,1)
        rotationFuncName = append(inputBaseFileName,rotation_sequence(i,:));
        outputFilepathMag = append("./",outputMagFolder,"/IRFmag_",rotation_sequence(i,:),".txt");
        outputFilepathGrav = append("./",outputGravFolder,"/IRFgrav_",rotation_sequence(i,:),".txt");
        inputFID = fopen(inputDataFile,'r');
        %inputFID_eul = fopen("constructedEulerAngles_zyx.txt",'r');
        outputFID_mag = fopen(outputFilepathMag,'w');
        outputFID_grav = fopen(outputFilepathGrav,'w');
        
        pmagO = [0, 0 , 0];
        gravO = [0, 0 , 0];
        j = 0;
    
        line = fgetl(inputFID);
        %line_eul = fgetl(inputFID_eul);
        while ischar(line)
            j = j + 1;
            colonIndex = strfind(line,":");
            %colonIndex_eul = strfind(line_eul,":");
            eulerVect_string = extractBefore(line,colonIndex(1,1));
            %eulerVect_string = extractAfter(extractBefore(line_eul,colonIndex_eul(1,3)),colonIndex_eul(1,2));
            magVect_string = extractAfter(extractBefore(line,colonIndex(1,3)),colonIndex(1,2));
            gravVect_string = extractAfter(extractBefore(line,colonIndex(1,4)),colonIndex(1,3));
            
            commaIndex_eul = strfind(eulerVect_string,",");
            commaIndex_mag = strfind(magVect_string,",");
            commaIndex_grav = strfind(gravVect_string,",");
            
            eulX = str2double(extractBefore(eulerVect_string,commaIndex_eul(1,1)));
            eulX = ((2*pi())/360)*eulX;
            eulY = str2double(extractAfter(extractBefore(eulerVect_string,commaIndex_eul(1,2)),commaIndex_eul(1,1)));
            eulY = ((2*pi())/360)*eulY;
            eulZ = str2double(extractAfter(eulerVect_string,commaIndex_eul(1,2)));
            eulZ = ((2*pi())/360)*eulZ;
            
            magX = str2double(extractBefore(magVect_string,commaIndex_mag(1,1)));
            magY = str2double(extractAfter(extractBefore(magVect_string,commaIndex_mag(1,2)),commaIndex_mag(1,1)));
            magZ = str2double(extractAfter(magVect_string,commaIndex_mag(1,2)));
            magVect_B = [magX;magY;magZ];

            
            gravX = str2double(extractBefore(gravVect_string,commaIndex_grav(1,1)));
            gravY = str2double(extractAfter(extractBefore(gravVect_string,commaIndex_grav(1,2)),commaIndex_grav(1,1)));
            gravZ = str2double(extractAfter(gravVect_string,commaIndex_grav(1,2)));
            gravVect_B = [gravX;gravY;gravZ];
            
            %project magnetometer onto gravity vector normal plane
            grav_magnitude = norm(gravVect_B);
            mag_magnitude = norm(magVect_B);
            projMagVect_B = magVect_B - (dot(magVect_B,gravVect_B)/(grav_magnitude^2))*gravVect_B;
            
            if eulX ~= 0 && eulY ~= 0 && eulZ ~= 0
            
                [pmagX_O,pmagY_O,pmagZ_O] = feval(rotationFuncName,eulZ,eulY,eulX,projMagVect_B(1),projMagVect_B(2),projMagVect_B(3));
                [gravX_O,gravY_O,gravZ_O] = feval(rotationFuncName,eulZ,eulY,eulX,gravX,gravY,gravZ);

                pmagO(j,:) = [pmagX_O,pmagY_O,pmagZ_O];
                gravO(j,:) = [gravX_O,gravY_O,gravZ_O];

                fprintf(outputFID_mag,"%.3f,%.3f,%.3f\n",pmagX_O,pmagY_O,pmagZ_O);
                fprintf(outputFID_grav,"%.3f,%.3f,%.3f\n",gravX_O,gravY_O,gravZ_O);

                
                %line_eul = fgetl(inputFID_eul);
            end
            line = fgetl(inputFID);
        end
        
        fclose(inputFID);
        fclose(outputFID_mag);
        fclose(outputFID_grav);
        subplot(3,4,i);
        scatter3(gravO(:,1),gravO(:,2),gravO(:,3),'.')
        %scatter3(pmagO(:,1),pmagO(:,2),pmagO(:,3),'.')
        title(rotation_sequence(i,:))
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
    end
end
        
                                            