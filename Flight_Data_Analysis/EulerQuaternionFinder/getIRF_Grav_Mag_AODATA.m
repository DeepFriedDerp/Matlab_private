rotationFuncFolder = 'Twelve_OcB_RotationFunctions';

addpath Twelve_OcB_RotationFunctions;

inputDataFile = 'AODATA00_TimeConvert_Sorted.txt';
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
    
    heading = 0;
    pitch = 0;
    roll = 0;
    
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
    
    euler_angles(1,:) = [heading,pitch,roll];
    euler_angles(2,:) = [heading,roll,pitch];
    euler_angles(3,:) = [pitch,heading,roll];
    euler_angles(4,:) = [pitch,roll,heading];
    euler_angles(5,:) = [roll,heading,pitch];
    euler_angles(6,:) = [roll,pitch,heading];
    euler_angles(7,:) = [heading,pitch,roll];
    euler_angles(8,:) = [heading,roll,pitch];
    euler_angles(9,:) = [pitch,heading,roll];
    euler_angles(10,:) = [pitch,roll,heading];
    euler_angles(11,:) = [roll,heading,pitch];
    euler_angles(12,:) = [roll,pitch,heading];
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
        for k = 1:40000
            line = fgetl(inputFID);
            j = j+1;
        end
        %line_eul = fgetl(inputFID_eul);
        while ischar(line) && j < 60000
            j = j + 1;
            commaIndex = strfind(line,",");
            
            time = str2double(extractBefore(line,commaIndex(1)));
            
            heading = str2double(extractAfter(extractBefore(line,commaIndex(11)),commaIndex(10)));
            pitch = str2double(extractAfter(extractBefore(line,commaIndex(12)),commaIndex(11)));
            roll = str2double(extractAfter(extractBefore(line,commaIndex(13)),commaIndex(12)));
            heading = ((2*pi())/360)*heading;
            pitch = ((2*pi())/360)*pitch;
            roll = ((2*pi())/360)*roll;
            
            euler_angles(1,:) = [heading,roll,pitch];
            euler_angles(2,:) = [heading,pitch,roll];
            euler_angles(3,:) = [pitch,roll,heading];
            euler_angles(4,:) = [pitch,heading,roll];
            euler_angles(5,:) = [roll,pitch,heading];
            euler_angles(6,:) = [roll,heading,pitch];
            euler_angles(7,:) = [heading,roll,pitch];
            euler_angles(8,:) = [heading,pitch,roll];
            euler_angles(9,:) = [pitch,roll,heading];
            euler_angles(10,:) = [pitch,heading,roll];
            euler_angles(11,:) = [roll,pitch,heading];
            euler_angles(12,:) = [roll,heading,roll];
    
            accX = str2double(extractAfter(extractBefore(line,commaIndex(2)),":"));
            accY = str2double(extractAfter(extractBefore(line,commaIndex(3)),commaIndex(2)));
            accZ = str2double(extractAfter(extractBefore(line,commaIndex(4)),commaIndex(3)));

            gyroX = str2double(extractAfter(extractBefore(line,commaIndex(5)),commaIndex(4)));
            gyroY = str2double(extractAfter(extractBefore(line,commaIndex(6)),commaIndex(5)));
            gyroZ = str2double(extractAfter(extractBefore(line,commaIndex(7)),commaIndex(6)));

            magX = str2double(extractAfter(extractBefore(line,commaIndex(8)),commaIndex(7)));
            magY = str2double(extractAfter(extractBefore(line,commaIndex(9)),commaIndex(8)));
            magZ = str2double(extractAfter(extractBefore(line,commaIndex(10)),commaIndex(9)));
            magVect_B = [magX;magY;magZ];
            
            gravX = str2double(extractAfter(extractBefore(line,commaIndex(14)),commaIndex(13)));
            gravY = str2double(extractAfter(extractBefore(line,commaIndex(15)),commaIndex(14)));
            gravZ = str2double(extractAfter(extractBefore(line,commaIndex(16)),commaIndex(15)));
            gravVect_B = [gravX;gravY;gravZ];
            
            
            %project magnetometer onto gravity vector normal plane
%             grav_magnitude = norm(gravVect_B);
%             mag_magnitude = norm(magVect_B);
%             projMagVect_B = magVect_B - (dot(magVect_B,gravVect_B)/(grav_magnitude^2))*gravVect_B;
%             
            if heading ~= 0 && pitch ~= 0 && roll ~= 0
            
                [pmagX_O,pmagY_O,pmagZ_O] = feval(rotationFuncName,euler_angles(i,1),euler_angles(i,2),euler_angles(i,3),magVect_B(1),magVect_B(2),magVect_B(3));
                [gravX_O,gravY_O,gravZ_O] = feval(rotationFuncName,euler_angles(i,1),euler_angles(i,2),euler_angles(i,3),gravVect_B(1),gravVect_B(2),gravVect_B(3));

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
        
                                            