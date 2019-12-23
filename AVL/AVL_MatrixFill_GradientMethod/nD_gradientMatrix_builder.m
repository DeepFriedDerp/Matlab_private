function nD_gradientMatrix_builder(size,dimensions)
    
    %BUILD THE ZERO MATRIX
    exp = "zeros(size";
    for i = 2:dimensions-1
        exp = append(exp,",size");
    end
    exp = append(exp,");");
    theMatrix = eval(exp);
    
    %initialize the first value
    exp = "theMatrix(1";
    for i = 2:dimensions
        exp = append(exp,",1");
    end
    exp = append(exp,") = 1;");
    eval(exp);
    
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
               %nD_randomQuadratic(vectorMatrix,a,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function returnMatrix = nD_randomQuadratic(targetMatrix,a,b)

    returnMatrix = a*(targetMatrix .^ 2) +  


end