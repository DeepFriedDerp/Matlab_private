clear all;

minimums.alpha = -12;
maximums.alpha = 12;

minimums.beta = 0;
maximums.beta = 0;

minimums.de = 0;
maximums.de = 0;

minimums.vel = 5;
maximums.vel = 5;

minimums.p = 0;
maximums.p = 0;

minimums.q = 0;
maximums.q = 0;

minimums.r = 0;
maximums.r = 0;

time = 5;
timeRes = 1000;

minVect = [
    minimums.alpha
    minimums.beta
    minimums.de
    minimums.vel
    minimums.p
    minimums.q
    minimums.r
    ];

maxVect = [
    maximums.alpha
    maximums.beta
    maximums.de
    maximums.vel
    maximums.p
    maximums.q
    maximums.r
    ];

rateVect = (maxVect - minVect) / time;

currentVect = minVect;
iter = 0;
t = 0;
tstep = 1 / timeRes;
airState.rho = 1.225;
forcesMoments = [t,0,0,0,0,0,0];

current.Sref = 0.4;
current.Bref = 1.4;
current.Cref = 0.3;

while t < time
    iter = iter + 1;
    current.alpha = currentVect(1,1);
    current.beta = currentVect(2,1);
    current.de = currentVect(3,1);
    current.windspeed = currentVect(4,1);
    current.p = currentVect(5,1);
    current.q = currentVect(6,1);
    current.r = currentVect(7,1);
    
    aeroForces = paramSpace_1_1_1_1_1_1_1(current,airState);
    forcesMoments(iter,:) = [t,aeroForces.L,aeroForces.D,aeroForces.Y, ...
        aeroForces.l,aeroForces.m,aeroForces.n];
    
    t = t + tstep;
    
    currentVect = currentVect + (rateVect * tstep);
end

hold on;
plot(forcesMoments(:,1),forcesMoments(:,2))
plot(forcesMoments(:,1),forcesMoments(:,3))
plot(forcesMoments(:,1),forcesMoments(:,4))
plot(forcesMoments(:,1),forcesMoments(:,5))
plot(forcesMoments(:,1),forcesMoments(:,6))
plot(forcesMoments(:,1),forcesMoments(:,7))
legend("L","D","Y","l","m","n");
    