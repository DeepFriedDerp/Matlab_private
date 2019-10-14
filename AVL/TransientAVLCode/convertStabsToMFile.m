function convertStabsToMFile(stabsData,outputFolderName,paramSpaceCoords)
    if ~exist(outputFolderName,'dir')
        mkdir(outputFolderName);
    end
    
    outputFileName = "paramSpace";
    for i = 1:size(paramSpaceCoords,2)
        outputFileName = append(outputFileName,"_",string(paramSpaceCoords(i)));
    end
    totalOutputFileName = append("./",outputFolderName,"/",outputFileName,".m");
    
    outputFID = fopen(totalOutputFileName,'w');
    
    
    fprintf(outputFID,"function [aeroForces] = %s(sailStates,airStates)\n",outputFileName);
    fprintf(outputFID,"\tCL = (%.6f) + (%.6f)*sailStates.alpha + (%.6f)*sailStates.beta + (%.6f)*sailStates.gamma + (%.6f)*sailStates.p + (%.6f)*sailStates.q + (%.6f)*sailStates.r + (%.6f)*sailStates.de;\n",
    
    fprintf(outputFID,"\tCL = (cLo) + (cLa)*sailStates.alpha + (cLb)*sailStates.beta + (cLy)*sailStates.gamma + (cLp)*sailStates.p + (cLq)*sailStates.q + (cLr)*sailStates.r + (cLde)*sailStates.de;\n",
    
    
