function [aeroForces] = paramSpace_3_2_1_2_3_3_1(sailStates,airStates)

	CL = (4.338702)*sailStates.alpha + (0.079332)*sailStates.beta + (-2.198851)*sailStates.p + (32.850845)*sailStates.q + (1.076600)*sailStates.r + (0.011142)*sailStates.de;
	CD = -0.340670;
	CY = (0.045944)*sailStates.alpha + (-0.024758)*sailStates.beta + (0.389437)*sailStates.p + (0.870359)*sailStates.q + (-0.025617)*sailStates.r + (0.000186)*sailStates.de;

	Cl = (1.043424)*sailStates.alpha + (-0.206547)*sailStates.beta + (-0.909119)*sailStates.p + (7.243933)*sailStates.q + (0.931195)*sailStates.r + (-0.000122)*sailStates.de;
	Cm = (-13.934161)*sailStates.alpha + (-0.284659)*sailStates.beta + (7.282679)*sailStates.p + (-126.510948)*sailStates.q + (-3.633088)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (0.291708)*sailStates.alpha + (0.015186)*sailStates.beta + (-0.871113)*sailStates.p + (3.311567)*sailStates.q + (-0.000129)*sailStates.r + (-0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end