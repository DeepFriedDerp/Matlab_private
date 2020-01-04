function [results,success] = retry_AVL_Grid_2(settings,targetCoords) 
    success = 0;
    
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
    
    % calculate the condition to test based on the target coordinates
    alpha = i_min;
    beta = j_min;
    de = k_min;
    vel = l_min;
    p = m_min;
    q = n_min;
    r = o_min;
    
    for i = 1:targetCoords(1)
        if i < 2
            alpha = alpha + (i_step / 2);
        else
            alpha = alpha + (i_step);
        end
    end
        
    for j = 1:targetCoords(2)
        if j < 2
            beta = beta + (j_step / 2);
        else
            beta = beta + (j_step);
        end
    end
            
    for k = 1:targetCoords(3)
        if k < 2
            de = de + (k_step / 2);
        else
            de = de + (k_step);
        end
    end

    for l = 1:targetCoords(4)
        if l < 2
            vel = vel + (l_step / 2);
        else
            vel = vel + (l_step);
        end
    end
                    
    for m = 1:targetCoords(5)
        if m < 2
            p = p + (m_step / 2);
        else
            p = p + (m_step);
        end
    end
                        
    for n = 1:targetCoords(6)
        if n < 2
            q = q + (n_step / 2);
        else
            q = q + (n_step);
        end
    end
                            
    for o = 1:targetCoords(7)
        if o < 2
            r = r + (o_step / 2);
        else
            r = r + (o_step);
        end
    end

    
    %cut the path into increasingly higher resolution steps starting from 
    % 0 0 0 0 0 0 0.
    for numTries = 3:13
        targetParams = [alpha beta de p q r vel];
        targetSteps = targetParams / numTries;
        targetPath = [0 0 0 0 0 0 0];
        for z = 2:numTries
            targetPath(z,:) = targetPath(1,:) + targetSteps*(z-1);
        end
        targetPath(numTries+1,:) = targetParams;
        
        for z = 1:numTries+1
            alpha = targetPath(z,1);
            beta = targetPath(z,2);
            de = targetPath(z,3);
            p = targetPath(z,4);
            q = targetPath(z,5);
            r = targetPath(z,6);
            vel = targetPath(z,7);
            
            fprintf(" alpha = %f, beta = %f, de = %f\n vel = %f, p = %f, q = %f, q = %f, r = %f",alpha,beta,de,vel,p,q,r);
            avlSuccess = AVLMainTwo(alpha, beta, de, p, q, r, vel);
            if avlSuccess
                [parseResults,done] = parseAVLdat('augustModel.stabs');
            else
                break;
            end
            if done && (z == (numTries + 1))
                results = parseResults;
                success = 1;
                return;
            end
        end
    end
    if ~done
        results = [];
        return;
    end
end
            
            
            
        