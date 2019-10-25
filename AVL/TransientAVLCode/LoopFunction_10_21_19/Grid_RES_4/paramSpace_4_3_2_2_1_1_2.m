function [aeroForces] = paramSpace_4_3_2_2_1_1_2(sailStates,airStates)

	CL = (4.092570)*sailStates.alpha + (0.004966)*sailStates.beta + (-2.380978)*sailStates.p + (31.780048)*sailStates.q + (0.153057)*sailStates.r + (0.009962)*sailStates.de;
	CD = -0.235210;
	CY = (-0.090515)*sailStates.alpha + (-0.024198)*sailStates.beta + (-0.134049)*sailStates.p + (-0.756270)*sailStates.q + (0.026691)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.155791)*sailStates.alpha + (0.094044)*sailStates.beta + (-1.109178)*sailStates.p + (8.795531)*sailStates.q + (-0.127097)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-14.942728)*sailStates.alpha + (-0.048127)*sailStates.beta + (8.586106)*sailStates.p + (-133.768066)*sailStates.q + (-0.553001)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (-0.178736)*sailStates.alpha + (-0.017863)*sailStates.beta + (0.512156)*sailStates.p + (-2.345952)*sailStates.q + (-0.032798)*sailStates.r + (0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end