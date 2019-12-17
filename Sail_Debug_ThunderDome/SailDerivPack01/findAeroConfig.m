function [success, resultCoords, theAeroTriggers] = findAeroConfig(theSettings,currentAeroConfig)
    success = 1;
    
%     try
%         addpath(settings.gridFolder);
%     catch
%         success = 0;
%         AeroFuncName = 'OVER9000';
%         aeroTriggers = 'yourmom';
%         disp("no gridfolder found")
%         fprintf(" current settings [alpha,beta,de,vel,p,q,r] = [%f,%f,%f,%f,%f,%f,%f]\n", ...
%                     currentAeroConfig.alpha,currentAeroConfig.beta,currentAeroConfig.de, ... 
%                     currentAeroConfig.vel,currentAeroConfig.p,currentAeroConfig.q, ... 
%                     currentAeroConfig.r);
%         return;
%     end

    i_max = theSettings.alpha_max;
    j_max = theSettings.beta_max;
    k_max = theSettings.de_max;
    l_max = theSettings.vel_max;
    m_max = theSettings.p_max;
    n_max = theSettings.q_max;
    o_max = theSettings.r_max;
    
    i_min = theSettings.alpha_min;
    j_min = theSettings.beta_min;
    k_min = theSettings.de_min;
    l_min = theSettings.vel_min;
    m_min = theSettings.p_min;
    n_min = theSettings.q_min; 
    o_min = theSettings.r_min;
    
    i_res = theSettings.alpha_res;
    j_res = theSettings.beta_res;
    k_res = theSettings.de_res;
    l_res = theSettings.vel_res;
    m_res = theSettings.p_res;
    n_res = theSettings.q_res; 
    o_res = theSettings.r_res;
    
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
        n_found && o_found && 1;
    
    if allFound
        resultCoords = [i_found j_found k_found l_found m_found n_found ...
            o_found];
    else
        success = 0;
        resultCoords = [0 0 0 0 0 0 0];
        theAeroTriggers.alpha_max = 0;
        theAeroTriggers.beta_max = 0;
        theAeroTriggers.de_max = 0;
        theAeroTriggers.vel_max = 0;
        theAeroTriggers.p_max = 0;
        theAeroTriggers.q_max = 0;
        theAeroTriggers.r_max = 0;
        theAeroTriggers.alpha_min = 0;
        theAeroTriggers.beta_min = 0;
        theAeroTriggers.de_min = 0;
        theAeroTriggers.vel_min = 0;
        theAeroTriggers.p_min = 0;
        theAeroTriggers.q_min = 0;
        theAeroTriggers.r_min = 0;
        return;
    end
    
%     if ~allFound
%         success = 0;
%         AeroFuncName = 'OVER9000';
%         aeroTriggers = 'yourmom';
%         
%         disp("iters not found")
%         return;
%     end
%         
%     newAeroFilename = append("paramSpace_",string(i_found),"_",string(j_found),"_", ...
%         string(k_found),"_",string(l_found),"_",string(m_found),"_",string(n_found),"_",string(o_found));
%     
%     if ~exist(append(".\",settings.gridFolder,"\",newAeroFilename,".m"),'file')
%         success = 0;
%         AeroFuncName = 'OVER9000';
%         aeroTriggers = 'yourmom';
%         disp("aeroFile not found")
%         disp(string(newAeroFilename))
%         return;
%     end
    
    [theAeroTriggers.alpha_min , theAeroTriggers.alpha_max] = findLinPtBounds(i_min, ... 
           i_step,i_found);
    [theAeroTriggers.beta_min , theAeroTriggers.beta_max]  = findLinPtBounds(j_min, ... 
           j_step,j_found);
    [theAeroTriggers.de_min , theAeroTriggers.de_max]  = findLinPtBounds(k_min, ... 
           k_step,k_found);
    [theAeroTriggers.vel_min , theAeroTriggers.vel_max]  = findLinPtBounds(l_min, ... 
           l_step,l_found);
    [theAeroTriggers.p_min , theAeroTriggers.p_max]  = findLinPtBounds(m_min, ... 
           m_step,m_found);
    [theAeroTriggers.q_min , theAeroTriggers.q_max]  = findLinPtBounds(n_min, ... 
           n_step,n_found);
    [theAeroTriggers.r_min , theAeroTriggers.r_max]  = findLinPtBounds(o_min, ... 
           o_step,o_found);
       
%     AeroFuncName = newAeroFilename;
    
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
        
        if foundIterLetter > val_res
            break;
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

       