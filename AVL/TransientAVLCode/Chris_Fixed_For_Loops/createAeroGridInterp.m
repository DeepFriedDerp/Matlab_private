function [success,NP_X] = createAeroGridInterp(settings)
    i_max = settings.alpha_max;
    j_max = settings.beta_max;
    k_max = settings.de_max;
    l_max = settings.vel_max;
    m_max = settings.p_max;
    n_max = settings.q_max;
    o_max = settings.r_max;
    
    i_min = settings.alpha_min;
    j_min = settings.beta_min;
    k_min = settings.de_min;
    l_min = settings.vel_min;
    m_min = settings.p_min;
    n_min = settings.q_min; 
    o_min = settings.r_min;
    
    i_res = settings.alpha_res;
    j_res = settings.beta_res;
    k_res = settings.de_res;
    l_res = settings.vel_res;
    m_res = settings.p_res;
    n_res = settings.q_res; 
    o_res = settings.r_res;
    
    i_step = (i_max - i_min) / (i_res);
    j_step = (j_max - j_min) / (j_res);
    k_step = (k_max - k_min) / (k_res);
    l_step = (l_max - l_min) / (l_res);
    m_step = (m_max - m_min) / (m_res);
    n_step = (n_max - n_min) / (n_res);
    o_step = (o_max - o_min) / (o_res);
   
    NP_X = zeros(i_res,j_res,k_res,l_res,m_res,n_res,o_res);
    
    success = 1;
    runNum = 0;
    totNum = i_res * j_res * k_res * l_res * m_res * n_res * o_res; 
    
    alpha = i_min;
    beta = j_min;
    de = k_min;
    vel = l_min;
    p = m_min;
    q = n_min;
    r = o_min;
    
    posXNP = 0;
    negXNP = 0;
    
    for i = 1:i_res
        if i < 2
            alpha = alpha + (i_step / 2);
        else
            alpha = alpha + (i_step);
        end
        
        for j = 1:j_res
            if j < 2
                beta = beta + (j_step / 2);
            else
                beta = beta + (j_step);
            end
            
            for k = 1:k_res
                if k < 2
                    de = de + (k_step / 2);
                else
                    de = de + (k_step);
                end

                for l = 1:l_res
                    if l < 2
                        vel = vel + (l_step / 2);
                    else
                        vel = vel + (l_step);
                    end
                    
                    for m = 1:m_res
                        if m < 2
                            p = p + (m_step / 2);
                        else
                            p = p + (m_step);
                        end
                        
                        for n = 1:n_res
                            if n < 2
                                q = q + (n_step / 2);
                            else
                                q = q + (n_step);
                            end
                            
                            for o = 1:o_res
                                if o < 2
                                    r = r + (o_step / 2);
                                else
                                    r = r + (o_step);
                                end
                                
                                done = 0;
                                attempt = 0;
                                while (~done) && attempt < 4
                                    attempt = attempt + 1;
                                    avlSuccess = AVL_Main(settings.runfile , alpha , beta , de , vel , p , q , r);
                                    if avlSuccess
                                        [results,done] = parseAVLdat('.\AVL_output\sail1.stabs');
                                    end
                                    if done
                                        convertStabsToMFile(results,settings.gridFolder,[i,j,k,l,m,n,o]);
                                        NP_X(i,j,k,l,m,n,o) = results.npX;
                                        if results.npX > 0
                                            posXNP = posXNP + 1;
                                        elseif results.npX < 0
                                            negXNP = negXNP + 1;
                                        end
                                    end
                                end
                                runNum = runNum + 1;
                                sprintf("Run : %1.0f of %1.0f complete",runNum,totNum)
                                success = success && done;
                            end
                        end
                    end
                end
            end
        end
    end
    
    tot = posXNP + negXNP;
    negPercent = (negXNP / tot)
    posPercent = (posXNP / tot)
end
                                        
                                        
                                        
                            