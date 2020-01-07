% create_AVL_Grid_3 is basically create_AVL_Grid_2 but run in reverse to
% see if running through in a different direction can get complimentary AVL
% results. 

function [success,resultsGrid] = create_AVL_Grid_3(settings)
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
    
    success = 1;
    runNum = 0;
    totNum = i_res * j_res * k_res * l_res * m_res * n_res * o_res; 
    
%     alpha = i_min;
%     beta = j_min;
%     de = k_min;
%     vel = l_min;
%     p = m_min;
%     q = n_min;
%     r = o_min;

    alpha = i_max;
    beta = j_max;
    de = k_max;
    vel = l_max;
    p = m_max;
    q = n_max;
    r = o_max;

    
    posXNP = 0;
    negXNP = 0;
    
    for i = i_res:-1:1
        if i >= i_res
            alpha = alpha - (i_step / 2);
        else
            alpha = alpha - (i_step);
        end
        beta = j_max;
        
        for j = j_res:-1:1
            if j >= j_res
                beta = beta - (j_step / 2);
            else
                beta = beta - (j_step);
            end
            de = k_max;
            
            for k = k_res:-1:1
                if k >= k_res
                    de = de - (k_step / 2);
                else
                    de = de - (k_step);
                end
                vel = l_max;

                for l = l_res:-1:1
                    if l >= l_res
                        vel = vel - (l_step / 2);
                    else
                        vel = vel - (l_step);
                    end
                    p = m_max;
                    
                    for m = m_res:-1:1
                        if m >= m_res
                            p = p - (m_step / 2);
                        else
                            p = p - (m_step);
                        end
                        q = n_max;
                        
                        for n = n_res:-1:1
                            if n >= n_res
                                q = q - (n_step / 2);
                            else
                                q = q - (n_step);
                            end
                            r = o_max;
                            
                            for o = o_res:-1:1
                                if o >= o_res
                                    r = r - (o_step / 2);
                                else
                                    r = r - (o_step);
                                end
                                
                                done = 0;
                                attempt = 0;
                                while (~done) && attempt < 1
                                    attempt = attempt + 1;
                                    fprintf(" alpha = %f, beta = %f, de = %f\n vel = %f, p = %f, q = %f, q = %f, r = %f",alpha,beta,de,vel,p,q,r);
                                    avlSuccess = AVLMainTwo(alpha, beta, de, p, q, r, vel);
                                    if avlSuccess
                                        [results,done] = parseAVLdat('augustModel.stabs');
                                    else
                                        [results,done] = retry_AVL_Grid_2(settings,[i,j,k,l,m,n,o]);
                                    end
                                    if done
                                        resultsGrid(i,j,k,l,m,n,o) = results;
%                                         convertStabsToMFile(results,settings.gridFolder,[i,j,k,l,m,n,o]);
%                                         NP_X(i,j,k,l,m,n,o) = results.npX;
                                        if results.npX > 0
                                            posXNP = posXNP + 1;
                                        elseif results.npX < 0
                                            negXNP = negXNP + 1;
                                        end
                                    end
                                end
                                runNum = runNum + 1;
                                fprintf("Run : %1.0f of %1.0f complete\n",runNum,totNum)
                                success = success && done;
                                fclose('all');
                            end
                        end
                        clc;
                    end
                    clc
                end
                clc
            end
            clc
        end
        clc;
    end
    
    tot = posXNP + negXNP;
    negPercent = (negXNP / tot)
    posPercent = (posXNP / tot)
end
                                        
                                        
                                        
                            