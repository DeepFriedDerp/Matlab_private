function [success, AeroFuncName,aeroTriggers] = findAeroConfig(settings,currentAeroConfig)
    success = 1;
    
    try
        addpath(settings.gridFolder);
    catch
        success = 0;
        AeroFuncName = 'OVER9000';
        aeroTriggers = 'yourmom';
        disp("no gridfolder found")
        fprintf(" current settings [alpha,beta,de,vel,p,q,r] = [%f,%f,%f,%f,%f,%f,%f]\n", ...
                    currentAeroConfig.alpha,currentAeroConfig.beta,currentAeroConfig.de, ... 
                    currentAeroConfig.vel,currentAeroConfig.p,currentAeroConfig.q, ... 
                    currentAeroConfig.r);
        return;
    end

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

    alpha = currentAeroConfig.alpha;
    beta = currentAeroConfig.beta;
    de = currentAeroConfig.de;
    vel = currentAeroConfig.windspeed;
    p = currentAeroConfig.p;
    q = currentAeroConfig.q;
    r = currentAeroConfig.r;

    alpha_finder = i_min;
    beta_finder = j_min;
    de_finder = k_min;
    vel_finder = l_min;
    p_finder = m_min;
    q_finder = n_min;
    r_finder = o_min;
    
    i_found = findTheValue(alpha,i_min,i_max,i_step,i_res);
    j_found = findTheValue(beta,j_min,j_max,j_step,j_res);
    k_found = findTheValue(de,k_min,k_max,k_step,k_res);
    l_found = findTheValue(vel,l_min,l_max,l_step,l_res);
    m_found = findTheValue(p,m_min,m_max,m_step,m_res);
    n_found = findTheValue(q,n_min,n_max,n_step,n_res);
    o_found = findTheValue(r,o_min,o_max,o_step,o_res);
    
    allFound = i_found && j_found && k_found && l_found && m_found && ...
        n_found && o_found;
    
%     if ~allFound
%         success = 0;
%         AeroFuncName = 'OVER9000';
%         aeroTriggers = 'yourmom';
%         
%         disp("iters not found")
%         return;
%     end
        
    newAeroFilename = append("paramSpace_",string(i_found),"_",string(j_found),"_", ...
        string(k_found),"_",string(l_found),"_",string(m_found),"_",string(n_found),"_",string(o_found));
    
    if ~exist(append(".\",settings.gridFolder,"\",newAeroFilename,".m"),'file')
        success = 0;
        AeroFuncName = 'OVER9000';
        aeroTriggers = 'yourmom';
        disp("aeroFile not found")
        disp(string(newAeroFilename))
        return;
    end
    
    [aeroTriggers.alpha_min , aeroTriggers.alpha_max] = findLinPtBounds(i_min, ... 
           i_step,i_found);
    [aeroTriggers.beta_min , aeroTriggers.beta_max]  = findLinPtBounds(j_min, ... 
           j_step,j_found);
    [aeroTriggers.de_min , aeroTriggers.de_max]  = findLinPtBounds(k_min, ... 
           k_step,k_found);
    [aeroTriggers.vel_min , aeroTriggers.vel_max]  = findLinPtBounds(l_min, ... 
           l_step,l_found);
    [aeroTriggers.p_min , aeroTriggers.p_max]  = findLinPtBounds(m_min, ... 
           m_step,m_found);
    [aeroTriggers.q_min , aeroTriggers.q_max]  = findLinPtBounds(n_min, ... 
           n_step,n_found);
    [aeroTriggers.r_min , aeroTriggers.r_max]  = findLinPtBounds(o_min, ... 
           o_step,o_found);
       
    AeroFuncName = newAeroFilename;
    
end


    
% ************************************************************************
%                   EXTRA FUNCTIONS NEEDED BELOW
% ************************************************************************

function [foundIterLetter] = findTheValue(val,val_min,val_max,val_step,val_res)
    foundIterLetter = 0;
    val_finder = val_min;
    foundFlag = 0;

    while ~(foundFlag)
        foundIterLetter = foundIterLetter + 1;
        if foundIterLetter < 2
            val_finder = val_finder + (val_step / 2);
        else
            val_finder = val_finder + (val_step);
        end
        
        windowMin = val_finder - (val_step / 2);
        windowMax = val_finder + (val_step / 2);
        
        if (val <= windowMax) && (val > windowMin)
            foundFlag = 1;
        end
    end
    
    if foundIterLetter > val_res
        foundIterLetter = 0;
        return;
    end
end

function [linPtMin,linPtMax] = findLinPtBounds(val_min, ... 
       val_step,iterNum)

    linPtMid = val_min;

    for g = 1:iterNum
        if g < 2
            linPtMid = linPtMid + (val_step / 2);
        else
            linPtMid = linPtMid + val_step;
        end
    end

    linPtMax = linPtMid + (val_step / 2);
    linPtMin = linPtMid - (val_step / 2);
end

       