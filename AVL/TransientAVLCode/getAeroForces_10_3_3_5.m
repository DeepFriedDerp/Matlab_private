function [aeroForces] = getAeroForces_10_3_3_5(sailStates,airStates)
    CL = (cLo) + (cLa)*sailStates.alpha + (cLb)*sailStates.beta + (cLy)*sailStates.gamma + (cLp)*sailStates.p + (cLq)*sailStates.q + (cLr)*sailStates.r + (cLde)*sailStates.de;
    CD = (cDo) + (k)*(CL^2) + (cDa)*sailStates.alpha + (cDb)*sailStates.beta + (cDy)*sailStates.gamma + (cDp)*sailStates.p + (cDq)*sailStates.q + (cDr)*sailStates.r + (cDde)sailStates.de;
    CY = (cYo) + (cYa)*sailStates.alpha + (cYb)*sailStates.beta + (cYy)*sailStates.gamma + (cYp)*sailStates.p + (cYq)*sailStates.q + (cYr)*sailStates.r + (cYde)*sailStates.de;
    
    Cl = (clo) + (cla)*sailStates.alpha + (clb)*sailStates.beta + (cly)*sailStates.gamma + (clp)*sailStates.p + (clq)*sailStates.q + (clr)*sailStates.r + (clde)*sailStates.de;
    Cm = (cmo) + (cma)*sailStates.alpha + (cmb)*sailStates.beta + (cmy)*sailStates.gamma + (cmp)*sailStates.p + (cmq)*sailStates.q + (cmr)*sailStates.r + (cmde)*sailStates.de;
    Cn = (cno) + (cna)*sailStates.alpha + (cnb)*sailStates.beta + (cny)*sailStates.gamma + (cnp)*sailStates.p + (cnq)*sailStates.q + (cnr)*sailStates.r + (cnde)*sailStates.de;
    
    q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);
    
    L = CL * q * sailStates.Sref;
    D = CD * q * sailStates.Sref;
    Y = CY * q * sailStates.Sref;
    
    l = Cl * q * sailStates.Sref * sailStates.b;
    m = Cm * q * sailStates.Sref * sailStates.c;
    n = Cn * q * sailStates.Sref * sailStates.b;
    
end