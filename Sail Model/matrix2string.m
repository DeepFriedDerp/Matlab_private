function [matrixString] = ...
    matrix2string(matrixTarget,labelTarget)

    dimensions = size(matrixTarget);
    
    if size(dimensions) > 2
        error("matrix2string : This function can only handle 2 dimensional matrices");
    end
    
    rows = dimensions(1);
    cols = dimensions(2);
    
    matrixString = append(labelTarget," = [");
    
    for i = 1:rows
        for j = 1:cols
            matrixString = append(matrixString,string(matrixTarget(i,j)));
            
            if j < cols
                matrixString = append(matrixString," ");
            elseif j == cols
                if i == rows
                   matrixString = append(matrixString,"];");
                else
                   matrixString = append(matrixString," ; ");
                end
            end
        end
    end         
end

