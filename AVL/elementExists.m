function [TF_fill_mat, FilledCoordsList, EmptyCoordsList] = elementExists(target_mat)
    mat_dims = size(target_mat);
    
    TF_fill_mat = zeros(mat_dims);
    FilledCoordsList = zeros(1,7);
    EmptyCoordsList = zeros(1,7);
    elementsFilled = 0;
    elementsEmpty = 0;
    
    try % ******************** try block *******************************
        
        for i = 1:mat_dims(1)
            for j = 1:mat_dims(2)
                for k = 1:mat_dims(3)
                    for l = 1:mat_dims(4)
                        for m = 1:mat_dims(5)
                            for n = 1:mat_dims(6)
                                for o = 1:mat_dims(7)
                                    if isempty(target_mat(i,j,k,l,m,n,o).cLa)
                                        TF_fill_mat(i,j,k,l,m,n,o) = 0;
                                        elementsEmpty = elementsEmpty + 1;
                                        EmptyCoordsList(elementsEmpty,:) = [i j k l m n o];
                                    else
                                        TF_fill_mat(i,j,k,l,m,n,o) = 0;
                                        elementsFilled = elementsFilled + 1;
                                        FilledCoordsList(elementsFilled,:) = [i j k l m n o];
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        
        sprintf("Number of Filled Elements: %s",string(elementsFilled))
        sprintf("Number of Empty Elements: %s",string(elementsEmpty))
        
    catch % **************** catch block ******************************
        
        sprintf("elementExist function failed, try block failure, treat results as suspect...\n")
        sprintf("Number of Filled Elements: %s",string(elementsFilled))
        sprintf("Number of Empty Elements: %s",string(elementsEmpty))
        
    end
end