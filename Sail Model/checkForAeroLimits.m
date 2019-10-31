function [aeroFlag] = checkForAeroLimits(sailStates,triggers)

    aeroFlag = 0;
    
    alpha1 = sailStates.alpha;
    beta1 = sailStates.beta;
    de1 = sailStates.de;
    vel1 = sailStates.windspeed;
    p1 = sailStates.p;
    q1 = sailStates.q;
    r1 = sailStates.r;
    
    alphaMax = triggers.alpha_max;
    betaMax = triggers.beta_max;
    deMax = triggers.de_max;
    velMax = triggers.vel_max;
    pMax = triggers.p_max;
    qMax = triggers.q_max;
    rMax = triggers.r_max;
    
    alphaMin = triggers.alpha_min;
    betaMin = triggers.beta_min;
    deMin = triggers.de_min;
    velMin = triggers.vel_min;
    pMin = triggers.p_min;
    qMin = triggers.q_min;
    rMin = triggers.r_min;
    
    alphaFlag = outsideBoundsCheck(alpha1,alphaMin,alphaMax);
    betaFlag = outsideBoundsCheck(beta1,betaMin,betaMax);
    deFlag = outsideBoundsCheck(de1,deMin,deMax);
    velFlag = outsideBoundsCheck(vel1,velMin,velMax);
    pFlag = outsideBoundsCheck(p1,pMin,pMax);
    qFlag = outsideBoundsCheck(q1,qMin,qMax);
    rFlag = outsideBoundsCheck(r1,rMin,rMax);
    
    totFlag = alphaFlag || betaFlag || deFlag || velFlag || ...
        pFlag || qFlag || rFlag;
    
    if totFlag
        aeroFlag = 1;
    end
end