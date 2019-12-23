function [numberOfFilled,numberOfEmpty] = nD_matrixFilled_counter(targetMatrix)

    if exist('nD_matrixFilled_counter_temp.m', 'file')
        rm('nD_matrixFilled_counter_temp.m');
    end

    FID = fopen("nD_matrixFilled_counter_temp.m",'w');
    
    fprintf(FID,"function [numberEmpty,numberFilled] = nD_matrixFilled_counter_temp(targetMatrix)\n\n");
    matrixSize = size(targetMatrix);
    matrixDims = size(matrixSize,2);
    %matrixExp = "";
    
    fprintf(FID,"\tnumberFilled = 0;\n");
    fprintf(FID,"\tnumberEmpty = 0;\n\n");
    
    for i = 1:matrixDims
        dim_ident = append("matrixDimiension",string(i));
        fprintf(FID,"\tfor %s = 1:%.0f\n",dim_ident,matrixSize(i));
        for k = 1:i
             fprintf(FID,"\t");
        end
    end
    
    fprintf(FID,"\ttry\n");
    for l = 1:matrixDims+1
        fprintf(FID,"\t");
    end
    
    fprintf(FID,"\tcLa = targetMatrix(");
    for j = 1:matrixDims
        dim_ident = append("matrixDimiension",string(j));
        if j == matrixDims
            fprintf(FID,"%s).cLa;\n",dim_ident);
        else
            fprintf(FID,"%s, ",dim_ident);
        end
    end
    
    for l = 1:matrixDims+1
        fprintf(FID,"\t");
    end
    fprintf(FID,"\tif ~isEmpty(cLa)\n");
    for l = 1:matrixDims+2
        fprintf(FID,"\t");
    end
    fprintf(FID,"\tnumberFilled = numberFilled + 1;\n");
    for l = 1:matrixDims+1
        fprintf(FID,"\t");
    end
    fprintf(FID,"\tend\n");
    
    for l = 1:matrixDims
        fprintf(FID,"\t");
    end
    fprintf(FID,"\tcatch\n");
    
    for l = 1:matrixDims+1
        fprintf(FID,"\t");
    end
    fprintf(FID,"\tnumberEmpty = numberEmpty + 1;\n");
    
    for l = 1:matrixDims
        fprintf(FID,"\t");
    end
    fprintf(FID,"\tend\n");
    
    for i = 1:matrixDims
        for j = 1:((matrixDims) - i)
           fprintf(FID,"\t");
        end
        fprintf(FID,"\tend\n");
    end
    
    fprintf(FID,"end");

    fclose(FID);
    
    try
       [numberOfEmpty,numberOfFilled] = nD_matrixFilled_counter_temp(targetMatrix);
    catch
        disp("there was an error in the temp run file");
        numberOfEmpty = 0;
        numberOfFilled = 0;
    end
    
    
end