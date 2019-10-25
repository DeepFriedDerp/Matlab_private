function [aeroForces] = paramSpace_1_4_1_1_1_3_1(sailStates,airStates)

	CL = (6.313483)*sailStates.alpha + (-0.396105)*sailStates.beta + (-1.487542)*sailStates.p + (19.614042)*sailStates.q + (2.031802)*sailStates.r + (0.008429)*sailStates.de;
	CD = -2.590950;
	CY = (-0.663906)*sailStates.alpha + (-0.032916)*sailStates.beta + (1.160487)*sailStates.p + (-2.326709)*sailStates.q + (0.231085)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (1.734890)*sailStates.alpha + (-0.630180)*sailStates.beta + (-0.383911)*sailStates.p + (0.322835)*sailStates.q + (2.022406)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-17.870121)*sailStates.alpha + (1.421991)*sailStates.beta + (7.387501)*sailStates.p + (-112.315697)*sailStates.q + (-6.568845)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (2.613173)*sailStates.alpha + (-0.076256)*sailStates.beta + (-2.639055)*sailStates.p + (13.678456)*sailStates.q + (-0.108003)*sailStates.r + (0.000849)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end