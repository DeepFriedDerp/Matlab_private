function [aeroForces] = paramSpace_1_4_4_3_3_1_1(sailStates,airStates)

	CL = (4.291036)*sailStates.alpha + (0.330008)*sailStates.beta + (-2.247050)*sailStates.p + (35.214596)*sailStates.q + (-1.652462)*sailStates.r + (0.010937)*sailStates.de;
	CD = -0.249490;
	CY = (0.100855)*sailStates.alpha + (-0.023940)*sailStates.beta + (-0.548487)*sailStates.p + (0.294835)*sailStates.q + (-0.109069)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.192964)*sailStates.alpha + (0.363095)*sailStates.beta + (-0.908549)*sailStates.p + (7.892928)*sailStates.q + (-1.261815)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-12.895783)*sailStates.alpha + (-1.136417)*sailStates.beta + (6.713356)*sailStates.p + (-126.097916)*sailStates.q + (5.463521)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (-0.368332)*sailStates.alpha + (0.049256)*sailStates.beta + (1.113296)*sailStates.p + (-4.931771)*sailStates.q + (0.006099)*sailStates.r + (-0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end