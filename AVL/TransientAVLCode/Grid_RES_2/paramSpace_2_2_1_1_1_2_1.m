function [aeroForces] = paramSpace_2_2_1_1_1_2_1(sailStates,airStates)

	CL = (5.225409)*sailStates.alpha + (-3.779477)*sailStates.beta + (-3.438822)*sailStates.p + (47.147984)*sailStates.q + (2.131337)*sailStates.r + (0.010451)*sailStates.de;
	CD = -5.787940;
	CY = (1.759435)*sailStates.alpha + (-0.247181)*sailStates.beta + (0.276387)*sailStates.p + (15.458940)*sailStates.q + (-0.027628)*sailStates.r + (0.002942)*sailStates.de;

	Cl = (-5.236667)*sailStates.alpha + (-1.201044)*sailStates.beta + (-1.665428)*sailStates.p + (14.109409)*sailStates.q + (2.368614)*sailStates.r + (0.001215)*sailStates.de;
	Cm = (4.995845)*sailStates.alpha + (17.052837)*sailStates.beta + (10.733473)*sailStates.p + (-151.177109)*sailStates.q + (-7.561485)*sailStates.r + (-0.055256)*sailStates.de;
	Cn = (-1.800184)*sailStates.alpha + (0.346782)*sailStates.beta + (-0.832479)*sailStates.p + (-9.022040)*sailStates.q + (-0.194967)*sailStates.r + (-0.003852)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end