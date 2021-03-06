function generateQuaternionsFromGravity(InputFile_Grav,InputFile_Mag)
    if exist(InputFile_Grav) && contains(InputFile_Grav,"_Gravity")
        filename = extractBefore(InputFile_Grav,"_Gravity");
    else
        error("InputFile is not a Gravity Vector File.");
    end
    if exist(InputFile_Mag) && contains(InputFile_Mag,"_Magnet")
        filename = extractBefore(InputFile_Mag,"_Magnet");
        outputFilename = append(filename,"_QuatsFromGrav.txt");
    else
        error("InputFile is not a Gravity Vector File.");
    end
        
    inputFID_Grav = fopen(InputFile_Grav,'r');
    inputFID_Mag = fopen(InputFile_Mag,'r');
    outputFID = fopen(outputFilename,'w');
    
%     syms q1 q2 q3 q4
%     
%     eqn1 = q1^2 + q2^2 + q3^2 + q4^2;
%     
%     eqn2 = 2*(q2*q4 - q1*q3);
%     eqn3 = 2*(q3*q4 + q1*q2);
%     eqn4 = q4^2 + q1^2 - q3^2 - q2^2;
%     
%     eqn5 = q1^2 + q2^2 - q3^2 - q4^2;
%     eqn6 = 2*(q2*q3-q1*q4);
%     eqn7 = 2*(q2*q4 + q1*q3);
%     
%     eqn8 = 2*(q2*q4 + q1*q4);
%     eqn9 = q1^2 - q2^2 + q3^2 - q4^2;
%     eqn10 = 2*(q3*q4 - q1*q2);
%     
%     BcO = [eqn5,eqn6,eqn7;eqn8,eqn9,eqn10;eqn2,eqn3,eqn4];
%     OcB = transpose(BcO);
    syms ph th ps;
    BcO = BcA_RotationMatrix('zyx',[ps th ph]);
    OcB = transpose(BcO);
    
    line_grav = fgetl(inputFID_Grav);
    line_mag = fgetl(inputFID_Mag);
    i = 0;
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
        
        EquationRHS = OcB*(grav_hat+pmag_hat+jo_hat);
%         EquationRHS = [EquationRHS;eqn1];
%         EquationLHS = [1;1;1;1];
        EquationLHS = [1;1;1];
        TheEquation = EquationLHS == EquationRHS;
        
        solveQuats = solve(TheEquation,[ph th ps],'Real',true,'IgnoreAnalyticConstraints',true);
        
        fprintf(outputFID,"%s,%s,%s\n",string(simplify(solveQuats.ph)),string(simplify(solveQuats.th)),string(simplify(solveQuats.ps)));
        
        line_grav = fgetl(inputFID_Grav);
        line_mag = fgetl(inputFID_Mag);
    end
end
        
        
        