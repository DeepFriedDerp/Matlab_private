function [success] = createAeroGridInterp(settings)
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
    
    i_step = (i_max - i_min) / i_res;
    j_step = (j_max - j_min) / j_res;
    k_step = (k_max - k_min) / k_res;
    l_step = (l_max - l_min) / l_res;
    m_step = (m_max - m_min) / m_res;
    n_step = (n_max - n_min) / n_res;
    o_step = (o_max - o_min) / o_res;
   
    xMatrix = zeros(8,i_res,j_res,k_res,l_res,m_res,n_res,o_res);
    
    success = 1;
    
    for i = 1:i_res
        alpha = i_step * i;
        
        for j = 1:j_res
            beta = j_step * j;
            
            for k = 1:k_res
                de = k_step * k;
                
                for l = 1:l_res
                    vel = l_step * l;
                    
                    for m = 1:m_res
                        p = m_step * m;
                        
                        for n = 1:n_res
                            q = n_step * n;
                            
                            for o = 1:o_res
                                r = o_step * o;
                                
                                done = 0;
                                attempt = 0;
                                while (~done) && attempt < 4
                                    attempt = attempt + 1;
                                    Gerrit_slim(settings.runfile , alpha , beta , de , vel , p , q , r);
                                    [results,done] = parseAVLdat('cm_calc.stabs');
                                    if done
                                        convertStabsToMFile(results,sail.stabsFolder,[i,j,k,l,m,n,o]);
                                    end
                                end
                                success = success && done;
                            end
                        end
                    end
                end
            end
        end
    end
    
end
                                        
                                        
                                        
                            