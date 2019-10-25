function [aeroTriggers,aeroSimMatrix,cDtot] = findAeroMatrix(settings,currentAeroConfig)
    %NOTE : Need to build in the return matrix for AeroSimMatrix

    success = 1;

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
    
    [aeroTriggers.alpha_min , aeroTriggers.alpha , aeroTriggers.alpha_max] = findLinPtBounds(i_min, ... 
           i_step,i_found);
    [aeroTriggers.beta_min , aeroTriggers.beta , aeroTriggers.beta_max]  = findLinPtBounds(j_min, ... 
           j_step,j_found);
    [aeroTriggers.de_min , aeroTriggers.de , aeroTriggers.de_max]  = findLinPtBounds(k_min, ... 
           k_step,k_found);
    [aeroTriggers.vel_min , aeroTriggers.vel , aeroTriggers.vel_max]  = findLinPtBounds(l_min, ... 
           l_step,l_found);
    [aeroTriggers.p_min , aeroTriggers.p , aeroTriggers.p_max]  = findLinPtBounds(m_min, ... 
           m_step,m_found);
    [aeroTriggers.q_min , aeroTriggers.q , aeroTriggers.q_max]  = findLinPtBounds(n_min, ... 
           n_step,n_found);
    [aeroTriggers.r_min , aeroTriggers.r , aeroTriggers.r_max]  = findLinPtBounds(o_min, ... 
           o_step,o_found);
    
    allFound = [i_found j_found k_found l_found m_found n_found o_found];

    [aeroSimMatrix,cDtot] = generateMatrix(allFound,settings);
    
    
    
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

function [linPtMin,linPtMid,linPtMax] = findLinPtBounds(val_min, ... 
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

function [theMatrix,cDtot] = generateMatrix(structCoords,settings)
    i = structCoords(1);
    j = structCoords(2);
    k = structCoords(3);
    l = structCoords(4);
    m = structCoords(5);
    n = structCoords(6);
    o = structCoords(7);
    
    structMatrix = settings.resultsGrid;
    aeroCoeffStruct = structMatrix(i,j,k,l,m,n,o);
    
    rho = settings.rho;
    
    cLa = aeroCoeffStruct.cLa;
    cLb = aeroCoeffStruct.cLb;
    cLp = aeroCoeffStruct.cLp;
    cLq = aeroCoeffStruct.cLq;
    cLr = aeroCoeffStruct.cLr;
    cLde = aeroCoeffStruct.cLde;
    
    cDtot = aeroCoeffStruct.cDtot;
    
    cYa = aeroCoeffStruct.cYa;
    cYb = aeroCoeffStruct.cYb;
    cYp = aeroCoeffStruct.cYp;
    cYq = aeroCoeffStruct.cYq;
    cYr = aeroCoeffStruct.cYr;
    cYde = aeroCoeffStruct.cYde;
    
    cla = aeroCoeffStruct.cla;
    clb = aeroCoeffStruct.clb;
    clp = aeroCoeffStruct.clp;
    clq = aeroCoeffStruct.clq;
    clr = aeroCoeffStruct.clr;
    clde = aeroCoeffStruct.clde;
    
    cma = aeroCoeffStruct.cma;
    cmb = aeroCoeffStruct.cmb;
    cmp = aeroCoeffStruct.cmp;
    cmq = aeroCoeffStruct.cmq;
    cmr = aeroCoeffStruct.cmr;
    cmde = aeroCoeffStruct.cmde;
    
    cna = aeroCoeffStruct.cna;
    cnb = aeroCoeffStruct.cnb;
    cnp = aeroCoeffStruct.cnp;
    cnq = aeroCoeffStruct.cnq;
    cnr = aeroCoeffStruct.cnr;
    cnde = aeroCoeffStruct.cnde;
    
    theMatrix = [
        cLa cLb cLp cLq cLr cLde
        cYa cYb cYp cYq cYr cYde
        cla clb clp clq clr clde
        cma cmb cmp cmq cmr cmde
        cna cnb cnp cnq cnr cnde
        ];
    
%     
%     Sref = aeroCoeffStruct.Sref;
%     Bref = aeroCoeffStruct.Bref;
%     Cref = aeroCoeffStruct.Cref;
    
%     syms L D Y l m n a b de v p q r; % Lift Drag Side torqes alph beta d_elev vel p q r
%     syms CL CD CY Cl Cm Cn;
%     
%     CL = cLa*a + cLb*b + cLp*p + cLq*q + cLr*r + cLde*de;
%     CD = cDtot;
%     CY = cYa*a + cYb*b + cYp*p + cYq*q + cYr*r + cYde*de;
%     Cl = cla*a + clb*b + clp*p + clq*q + clr*r + clde*de;
%     Cm = cma*a + cmb*b + cmp*p + cmq*q + cmr*r + cmde*de;
%     Cn = cna*a + cnb*b + cnp*p + cnq*q + cnr*r + cnde*de;
% 
%     EQNsim(1) = CL == cLa*a + cLb*b + cLp*p + cLq*q + cLr*r + cLde*de;
%     EQNsim(2) = CY == cYa*a + cYb*b + cYp*p + cYq*q + cYr*r + cYde*de;
%     EQNsim(3) = Cl == cla*a + clb*b + clp*p + clq*q + clr*r + clde*de;
%     EQNsim(4) = Cm == cma*a + cmb*b + cmp*p + cmq*q + cmr*r + cmde*de;
%     EQNsim(5) = Cn == cna*a + cnb*b + cnp*p + cnq*q + cnr*r + cnde*de;
    
%    EQNsim = simplify(EQNsim);
    
%     EQNctrl(1) = L == CL * q * Sref;
%     EQNctrl(2) = D == CD * q * Sref;
%     EQNctrl(3) = Y == CY * q * Sref;
%     EQNctrl(4) = l == Cl * q * Sref * Bref;
%     EQNctrl(5) = m == Cm * q * Sref * Cref;
%     EQNctrl(6) = n == Cn * q * Sref * Bref;
%     vars = symvar(EQNsim)
%     theMatrix = equationsToMatrix(EQNsim,vars)
    
end
    
       