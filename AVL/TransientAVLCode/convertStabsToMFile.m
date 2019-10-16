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
    
    
    fprintf(outputFID,"function [aeroForces] = %s(sailStates,airStates)\n\n",outputFileName);
    fprintf(outputFID,"\tCL = (%.6f)*sailStates.alpha + (%.6f)*sailStates.beta + (%.6f)*sailStates.p + (%.6f)*sailStates.q + (%.6f)*sailStates.r + (%.6f)*sailStates.de;\n",(stabsData.cLa),(stabsData.cLb),(stabsData.cLp),(stabsData.cLq),(stabsData.cLr),(stabsData.cLde));
    fprintf(outputFID,"\tCD = %.6f;\n",stabsData.cDtot);
    fprintf(outputFID,"\tCY = (%.6f)*sailStates.alpha + (%.6f)*sailStates.beta + (%.6f)*sailStates.p + (%.6f)*sailStates.q + (%.6f)*sailStates.r + (%.6f)*sailStates.de;\n\n",(stabsData.cYa),(stabsData.cYb),(stabsData.cYp),(stabsData.cYq),(stabsData.cYr),(stabsData.cYde));
    
    fprintf(outputFID,"\tCl = (%.6f)*sailStates.alpha + (%.6f)*sailStates.beta + (%.6f)*sailStates.p + (%.6f)*sailStates.q + (%.6f)*sailStates.r + (%.6f)*sailStates.de;\n",(stabsData.cla),(stabsData.clb),(stabsData.clp),(stabsData.clq),(stabsData.clr),(stabsData.clde));
    fprintf(outputFID,"\tCm = (%.6f)*sailStates.alpha + (%.6f)*sailStates.beta + (%.6f)*sailStates.p + (%.6f)*sailStates.q + (%.6f)*sailStates.r + (%.6f)*sailStates.de;\n",(stabsData.cma),(stabsData.cmb),(stabsData.cmp),(stabsData.cmq),(stabsData.cmr),(stabsData.cmde));
    fprintf(outputFID,"\tCn = (%.6f)*sailStates.alpha + (%.6f)*sailStates.beta + (%.6f)*sailStates.p + (%.6f)*sailStates.q + (%.6f)*sailStates.r + (%.6f)*sailStates.de;\n\n",(stabsData.cna),(stabsData.cnb),(stabsData.cnp),(stabsData.cnq),(stabsData.cnr),(stabsData.cnde));
    
    fprintf(outputFID,"\tq = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);\n\n");
    
    fprintf(outputFID,"\taeroForces.L = CL * q * sailStates.Sref;\n");
    fprintf(outputFID,"\taeroForces.D = CD * q * sailStates.Sref;\n");
    fprintf(outputFID,"\taeroForces.Y = CY * q * sailStates.Sref;\n\n");
    
    fprintf(outputFID,"\taeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;\n");
    fprintf(outputFID,"\taeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;\n");
    fprintf(outputFID,"\taeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;\n\n");
    
    fprintf(outputFID,"end");
    