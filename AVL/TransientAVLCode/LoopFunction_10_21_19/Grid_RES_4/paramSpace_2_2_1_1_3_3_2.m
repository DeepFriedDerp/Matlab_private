function [aeroForces] = paramSpace_2_2_1_1_3_3_2(sailStates,airStates)

	CL = (5.378626)*sailStates.alpha + (0.118692)*sailStates.beta + (-2.491283)*sailStates.p + (32.428173)*sailStates.q + (1.433284)*sailStates.r + (0.010456)*sailStates.de;
	CD = -1.650950;
	CY = (0.202631)*sailStates.alpha + (-0.025759)*sailStates.beta + (0.678147)*sailStates.p + (1.693499)*sailStates.q + (0.044269)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.204665)*sailStates.alpha + (-0.375946)*sailStates.beta + (-1.195230)*sailStates.p + (9.317176)*sailStates.q + (1.451964)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-14.513845)*sailStates.alpha + (-0.456110)*sailStates.beta + (9.050932)*sailStates.p + (-136.398376)*sailStates.q + (-4.849318)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (0.179733)*sailStates.alpha + (-0.026993)*sailStates.beta + (-1.661541)*sailStates.p + (6.672756)*sailStates.q + (-0.008515)*sailStates.r + (-0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end