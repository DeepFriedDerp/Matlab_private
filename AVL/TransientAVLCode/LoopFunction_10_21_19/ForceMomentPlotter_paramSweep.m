clear all;

load res4.mat;

settings.alpha_max = deg2rad(settings.alpha_max);
settings.alpha_min = deg2rad(settings.alpha_min);

settings.beta_max = deg2rad(settings.beta_max);
settings.beta_min = deg2rad(settings.beta_min);

%initial conditions
alpha_minimum = -14;    % deg
alpha_maximum = 14;     % deg

beta_minimum = 0;       % deg
beta_maximum = 0;       % deg

de_minimum = 0;         % deg
de_maximum = 0;         % deg

vel_minimum = 5;        % m/s
vel_maximum = 5;        % m/s

sweepTime = 5;          %seconds
resolution_Time = 1000; % steps per second

alpha_minimum = deg2rad(alpha_minimum);
alpha_maximum = deg2rad(alpha_maximum);

beta_minimum = deg2rad(beta_minimum);
beta_maximum = deg2rad(beta_maximum);

alpha_sweep = alpha_maximum - alpha_minimum;
beta_sweep = beta_maximum - beta_minimum;
de_sweep = (de_maximum - de_minimum);
vel_sweep = vel_maximum - vel_minimum;

p = 0;
q = alpha_sweep / sweepTime;
r = beta_sweep / sweepTime;
de_dot = de_sweep / sweepTime;
vel_dot = vel_sweep / sweepTime;

currentConfig.alpha = alpha_minimum;
currentConfig.beta = beta_minimum;
currentConfig.de = de_minimum;
currentConfig.windspeed = vel_minimum;
currentConfig.p = 0;
currentConfig.q = 0;
currentConfig.r = 0;

airState.rho = 1.225; % kg/m^3

[successFindAero, AeroFuncName, aeroTriggers] = findAeroConfig(settings,currentConfig);

if ~successFindAero
    error("initial findAero didn't work");
else
    aeroTriggersLast = aeroTriggers;
    AeroFuncNameLast = AeroFuncName;
end

t = 0;
timeStep = 1 / resolution_Time;
currentConfig.Sref = 0.4;
currentConfig.Bref = 1.4;
currentConfig.Cref = 0.3;
forcesMoments = [t,0,0,0,0,0,0];
iter = 0;

while t < sweepTime
    iter = iter + 1;
    [findAeroFlag] = checkForAeroLimits(currentConfig,aeroTriggersLast);
    
    if findAeroFlag
       [successFindAero, AeroFuncName,aeroTriggers] = findAeroConfig(settings,currentConfig);
        if successFindAero
            aeroTriggersLast = aeroTriggers;
            AeroFuncNameLast = AeroFuncName;
            fprintf("%sn\",AeroFuncNameLast);
        end
    end
    
    try
        aeroForces = feval(AeroFuncNameLast,currentConfig,airState);
        forcesMoments(iter,:) = [t,aeroForces.L,aeroForces.D,aeroForces.Y, ...
        aeroForces.l,aeroForces.m,aeroForces.n];
    catch
        forcesMoments(iter,:) = [t,0,0,0,0,0,0];
    end
    
    t = t + timeStep;
    
    alphaDot = (q);
    betaDot = (r);
    
    currentConfig.alpha = currentConfig.alpha + (alphaDot * timeStep);
    currentConfig.beta = currentConfig.beta + (betaDot * timeStep);
    currentConfig.de = currentConfig.de + (de_dot * timeStep);
    currentConfig.windspeed = currentConfig.windspeed + (vel_dot * timeStep);
    
    fprintf("%.3f : %.3f,\n",t,currentConfig.alpha);
end

hold on;
plot(forcesMoments(:,1),forcesMoments(:,2))
plot(forcesMoments(:,1),forcesMoments(:,3))
plot(forcesMoments(:,1),forcesMoments(:,4))
plot(forcesMoments(:,1),forcesMoments(:,5))
plot(forcesMoments(:,1),forcesMoments(:,6))
plot(forcesMoments(:,1),forcesMoments(:,7))
legend("L","D","Y","l","m","n","L4","D4","Y4","l4","m4","n4");



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
