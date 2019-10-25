function [aeroForces] = paramSpace_2_3_4_2_1_1_1(sailStates,airStates)

	CL = (4.338702)*sailStates.alpha + (0.079332)*sailStates.beta + (-2.198851)*sailStates.p + (32.850845)*sailStates.q + (-1.076600)*sailStates.r + (0.011142)*sailStates.de;
	CD = -0.340670;
	CY = (-0.045944)*sailStates.alpha + (-0.025194)*sailStates.beta + (-0.389437)*sailStates.p + (-0.870359)*sailStates.q + (-0.025617)*sailStates.r + (-0.000186)*sailStates.de;

	Cl = (0.989099)*sailStates.alpha + (0.252714)*sailStates.beta + (-0.876469)*sailStates.p + (6.840055)*sailStates.q + (-0.929097)*sailStates.r + (-0.000209)*sailStates.de;
	Cm = (-13.934160)*sailStates.alpha + (-0.284658)*sailStates.beta + (7.282679)*sailStates.p + (-126.510948)*sailStates.q + (3.633088)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (-0.315411)*sailStates.alpha + (0.014916)*sailStates.beta + (0.873253)*sailStates.p + (-3.338039)*sailStates.q + (0.000008)*sailStates.r + (0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end