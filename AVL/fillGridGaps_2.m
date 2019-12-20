function [resultsNew] = fillGridGaps_2(resultsOld,settings)

    i_res = settings.alpha_res;
    j_res = settings.beta_res;
    k_res = settings.de_res;
    l_res = settings.vel_res;
    m_res = settings.p_res;
    n_res = settings.q_res; 
    o_res = settings.r_res;
    
    for i = 1:i_res
        for j = 1:j_res
            for k = 1:k_res
                for l = 1:l_res
                    for m = 1:m_res
                        for n = 1:n_res
                            for o = 1:o_res
                                catchFlag = 0;
                                try 
                                    derp = resultsOld(i,j,k,l,m,n,o).cLa;
                                    disp(derp)
                                catch
                                    catchFlag = 1;
                                    derp = 1;
                                    oldCoord = [i,j,k,l,m,n,o];
                                    [newResults,resultsFound] = retry_AVL_Grid_2(settings,oldCoord);
                                    if resultsFound > 0
                                        resultsNew(i,j,k,l,m,n,o) = newResults;
                                    end
                                end
                                if ~catchFlag
                                    resultsNew(i,j,k,l,m,n,o) = resultsOld(i,j,k,l,m,n,o);
                                end
                                
                                if isempty(derp)
                                    oldCoord = [i,j,k,l,m,n,o];
                                    [newResults,resultsFound] = retry_AVL_Grid_2(settings,oldCoord);
                                    if resultsFound > 0
                                        resultsNew(i,j,k,l,m,n,o) = newResults;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


function [nearestCoord] = findNearest(oldCoord,resultsOld,settings)
    nearestCoord = [50 50 50 50 50 50];
    
    i_res = settings.alpha_res;
    j_res = settings.beta_res;
    k_res = settings.de_res;
    l_res = settings.vel_res;
    m_res = settings.p_res;
    n_res = settings.q_res; 
    o_res = settings.r_res;
    
    maxVect = [i_res j_res k_res l_res m_res n_res o_res];
    MinDist = norm(maxVect);
    
    
    for i = 1:i_res
        for j = 1:j_res
            for k = 1:k_res
                for l = 1:l_res
                    for m = 1:m_res
                        for n = 1:n_res
                            for o = 1:o_res
                                catchFlag = 0;
                                try
                                    derp = resultsOld(i,j,k,l,m,n,o).cLa;
                                catch
                                    catchFlag = 1; 
                                end
                                
                                if ~catchFlag && ~isempty(derp)
                                    currentVect = [i j k l m n o];
                                    
                                    deltaVect = currentVect - oldCoord;
                                    deltaNorm = norm(deltaVect);
                                    
                                    if deltaNorm < MinDist
                                        nearestCoord = currentVect;
                                        MinDist = deltaNorm;
                                    elseif deltaNorm == MinDist
                                        deltaAlpha = currentVect(1) - oldCoord(1);
                                        lastDeltaAlpha = nearestCoord(1) - oldCoord(1);
                                        if deltaAlpha < lastDeltaAlpha
                                            nearestCoord = currentVect;
                                            MinDist = deltaNorm;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    success = 1;
    for i = 1:7
        if nearestCoord(i) == 50
            success = 0;
        end
    end
    
    if ~success
        error("one of the nearest coords is 50");
    end
end
    
        
                                    
                                    
                                    
                                

           