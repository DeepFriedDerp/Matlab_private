function [aeroForces] = paramSpace_4_2_2_2_1_1_2(sailStates,airStates)

	CL = (4.092570)*sailStates.alpha + (-0.004966)*sailStates.beta + (-2.380978)*sailStates.p + (31.780050)*sailStates.q + (0.153057)*sailStates.r + (0.009962)*sailStates.de;
	CD = -0.235210;
	CY = (-0.090515)*sailStates.alpha + (-0.025754)*sailStates.beta + (-0.134049)*sailStates.p + (-0.756270)*sailStates.q + (0.026691)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.206671)*sailStates.alpha + (0.100322)*sailStates.beta + (-1.140721)*sailStates.p + (9.192499)*sailStates.q + (-0.120837)*sailStates.r + (0.000324)*sailStates.de;
	Cm = (-14.942728)*sailStates.alpha + (0.048127)*sailStates.beta + (8.586106)*sailStates.p + (-133.768066)*sailStates.q + (-0.553001)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (-0.180054)*sailStates.alpha + (-0.020799)*sailStates.beta + (0.518430)*sailStates.p + (-2.424914)*sailStates.q + (-0.034043)*sailStates.r + (0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end