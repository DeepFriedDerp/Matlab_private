function [aeroFlag] = checkForAeroLimits(sailStates,theTriggers)

    aeroFlag = 0;
    
    alpha1 = sailStates.alpha;
    beta1 = sailStates.beta;
    de1 = sailStates.de;
    vel1 = sailStates.windspeed;
    p1 = sailStates.p;
    q1 = sailStates.q;
    r1 = sailStates.r;
    
    alphaMax = theTriggers.alpha_max;
    betaMax = theTriggers.beta_max;
    deMax = theTriggers.de_max;
    velMax = theTriggers.vel_max;
    pMax = theTriggers.p_max;
    qMax = theTriggers.q_max;
    rMax = theTriggers.r_max;
    
    alphaMin = theTriggers.alpha_min;
    betaMin = theTriggers.beta_min;
    deMin = theTriggers.de_min;
    velMin = theTriggers.vel_min;
    pMin = theTriggers.p_min;
    qMin = theTriggers.q_min;
    rMin = theTriggers.r_min;
    
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