inputBaseFileName = 'IRFgrav_';
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

fromInd = 47261;
toInd = 55907;

rotGrav = zeros(1,3,12);

for i = 1:size(rotation_sequence,1)
    
    rotationFuncName = append(inputBaseFileName,rotation_sequence(i,:),".txt");
    inputFID = fopen(rotationFuncName,'r');
    for k = 1:fromInd
        line = fgetl(inputFID);
    end
    j =0;
    while ischar(line) && j <= toInd
        j = j + 1;
        commaIndex = strfind(line,",");
        gravX = str2double(extractBefore(line,commaIndex(1)));
        gravY = str2double(extractAfter(extractBefore(line,commaIndex(2)),commaIndex(1)));
        gravZ = str2double(extractAfter(line,commaIndex(2)));
        rotGrav(j,1,i) = gravX;
        rotGrav(j,2,i) = gravY;
        rotGrav(j,3,i) = gravZ;
        line = fgetl(inputFID);
    end
    subplot(4,3,i);
    scatter(rotGrav(:,1,i),rotGrav(:,2,i),rotGrav(:,3,i),'.')
    title(rotation_sequence(i,:))
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    fclose(inputFID);
end
        
        