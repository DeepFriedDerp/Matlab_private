function [aeroForces] = paramSpace_1_3_1_3_3_2_2(sailStates,airStates)

	CL = (3.874546)*sailStates.alpha + (0.084855)*sailStates.beta + (-2.464667)*sailStates.p + (35.435631)*sailStates.q + (-1.124318)*sailStates.r + (0.010501)*sailStates.de;
	CD = 0.074310;
	CY = (0.063166)*sailStates.alpha + (-0.024405)*sailStates.beta + (-0.321163)*sailStates.p + (0.489619)*sailStates.q + (-0.063936)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.237054)*sailStates.alpha + (0.165125)*sailStates.beta + (-1.137809)*sailStates.p + (9.737178)*sailStates.q + (-0.812252)*sailStates.r + (0.000256)*sailStates.de;
	Cm = (-13.412830)*sailStates.alpha + (-0.333235)*sailStates.beta + (7.989332)*sailStates.p + (-134.148560)*sailStates.q + (3.791795)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (0.023810)*sailStates.alpha + (0.028283)*sailStates.beta + (0.508450)*sailStates.p + (-1.851165)*sailStates.q + (-0.015603)*sailStates.r + (-0.000162)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end