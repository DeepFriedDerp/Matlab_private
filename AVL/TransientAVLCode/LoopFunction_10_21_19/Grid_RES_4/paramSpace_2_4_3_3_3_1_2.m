function [aeroForces] = paramSpace_2_4_3_3_3_1_2(sailStates,airStates)

	CL = (4.349910)*sailStates.alpha + (0.228537)*sailStates.beta + (-2.559261)*sailStates.p + (35.503029)*sailStates.q + (-1.109266)*sailStates.r + (0.011044)*sailStates.de;
	CD = -0.243740;
	CY = (0.063227)*sailStates.alpha + (-0.024307)*sailStates.beta + (-0.456475)*sailStates.p + (0.498142)*sailStates.q + (-0.029901)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.325351)*sailStates.alpha + (0.277864)*sailStates.beta + (-1.152320)*sailStates.p + (9.322330)*sailStates.q + (-0.928685)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.346081)*sailStates.alpha + (-0.841088)*sailStates.beta + (8.489475)*sailStates.p + (-135.916275)*sailStates.q + (3.742809)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.188351)*sailStates.alpha + (0.012209)*sailStates.beta + (0.950956)*sailStates.p + (-4.528366)*sailStates.q + (0.006362)*sailStates.r + (-0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end