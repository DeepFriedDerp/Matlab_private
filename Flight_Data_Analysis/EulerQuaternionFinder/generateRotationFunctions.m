function generateRotationFunctions(outputFolder)

    if ~exist(outputFolder,'dir')
        mkdir(outputFolder)
    end
    filePath = append("./",outputFolder,"/");
    
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
    
    syms ps th ph xB yB zB xO yO zO;
    
    rB = [xB;yB;zB];
    rO = [xO;yO;zO];
    
    for i = 1:12
        eulerAngles = [ps th ph];
        for j = 1:3
            sequence_Axis = rotation_sequence(i,j);
            if sequence_Axis == 'x'
                eulerAngles(1,j) = ph;
            else
                if sequence_Axis == 'y'
                    eulerAngles(1,j) = th;
                else
                    if sequence_Axis == 'z'
                        eulerAngles(1,j) = ps;
                    else
                        sprintf("line %u:\n",i);
                        error("rotationSequence not found");
                    end
                end
            end
        end
        
        outputfilename = append(filePath,"rotationFunction_",rotation_sequence(i,:),".m");
        outputFID = fopen(outputfilename,'w');
        
        BcA = simplify(BcA_RotationMatrix(rotation_sequence(i,:),eulerAngles));
        AcB = transpose(BcA);
        
        Equations = rO == simplify(AcB*rB);
        
        fprintf(outputFID,"function [xO,yO,zO] = rotationFunction_%s(ph,th,ps,xB,yB,zB)\n\n",rotation_sequence(i,:));
        for j = 1:size(Equations,1)
            nextString = strrep(string(Equations(j,:)),'==','=');
            fprintf(outputFID,"%s;\n",nextString);
        end
        fprintf(outputFID,"\nend");
        fclose(outputFID);
    end
end