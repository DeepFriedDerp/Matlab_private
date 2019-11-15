function xdot=testfile(t,x,otherstuff)
    
    persistent currentConfig aeroTriggers aeroTriggersLast settings results ...
        CLa CLb CLde CLp CLq CLr ...
        CDtot ...
        CYa CYb CYde CYp CYq CYr ...
        Cla Clb Clde Clp Clq Clr ...
        Cma Cmb Cmde Cmp Cmq Cmr ...
        Cna Cnb Cnde Cnp Cnq Cnr ...
        vWO_X vWO_Y vWO_Z rCB_X de...
        ;
        
    if t == 0
        settings = otherstuff.settings;
        results = otherstuff.results;
        de = otherstuff.de;
        vWO_X = otherstuff.vWO_X; 
        vWO_Y = otherstuff.vWO_Y; 
        vWO_Z = otherstuff.vWO_Z;
    end
        

    ExtraEQ_string_final_1
    [
        alpha
        beta
        windspeed
        p
        q
        r
    ];

    currentConfig.alpha = alpha;
    currentConfig.beta = beta;
    currentConfig.de = de;
    currentConfig.windspeed = windspeed;
    currentConfig.p = p;
    currentConfig.q = q;
    currentConfig.r = r;
    
    if t == 0
        findAeroFlag = 1;
    else
        [findAeroFlag] = checkForAeroLimits(currentConfig,aeroTriggersLast);
    end
    
    if findAeroFlag
       [successFindAero, resultsCoords ,aeroTriggers] = findAeroConfig( ... 
           settings,currentConfig);
        if successFindAero
            aeroTriggersLast = aeroTriggers;
            
            CLa = results(resultsCoords).cLa;
            CLb = results(resultsCoords).cLb;
            CLde = results(resultsCoords).cLde;
            CLp = results(resultsCoords).cLp;
            CLq = results(resultsCoords).cLq;
            CLr = results(resultsCoords).cLr;
            
            CDtot = results(resultsCoords).cDtot;
            
            CYa = results(resultsCoords).cYa;
            CYb = results(resultsCoords).cYb;
            CYde = results(resultsCoords).cYde;
            CYp = results(resultsCoords).cYp;
            CYq = results(resultsCoords).cYq;
            CYr = results(resultsCoords).cYr;
            
            Cla = results(resultsCoords).cla;
            Clb = results(resultsCoords).clb;
            Clde = results(resultsCoords).clde;
            Clp = results(resultsCoords).clp;
            Clq = results(resultsCoords).clq;
            Clr = results(resultsCoords).clr;
            
            Cma = results(resultsCoords).cma;
            Cmb = results(resultsCoords).cmb;
            Cmde = results(resultsCoords).cmde;
            Cmp = results(resultsCoords).cmp;
            Cmq = results(resultsCoords).cmq;
            Cmr = results(resultsCoords).cmr;
            
            Cna = results(resultsCoords).cna;
            Cnb = results(resultsCoords).cnb;
            Cnde = results(resultsCoords).cnde;
            Cnp = results(resultsCoords).cnp;
            Cnq = results(resultsCoords).cnq;
            Cnr = results(resultsCoords).cnr;
            rCB_X = results(resultsCoords).npX;
        end
    end
    
    EQ_string_final_1
    
    xdot=xdot';
    
end

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

function [isOutside] = outsideBoundsCheck(val, val_min, val_max)
    isOutside = 0;
    
    if val > val_max
        isOutside = 1;
        return;
    elseif val <= val_min
        isOutside = 1;
        return;
    end
end
    