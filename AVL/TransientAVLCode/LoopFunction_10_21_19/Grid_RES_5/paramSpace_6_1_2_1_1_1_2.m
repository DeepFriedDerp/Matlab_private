function [aeroForces] = paramSpace_6_1_2_1_1_1_2(sailStates,airStates)

	CL = (4.464739)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.123546)*sailStates.p + (40.730385)*sailStates.q + (-1.459065)*sailStates.r + (0.011631)*sailStates.de;
	CD = -0.607100;
	CY = (-0.226498)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.557867)*sailStates.p + (-0.839978)*sailStates.q + (-0.038980)*sailStates.r + (-0.000183)*sailStates.de;

	Cl = (1.354305)*sailStates.alpha + (0.312873)*sailStates.beta + (-1.642766)*sailStates.p + (14.080769)*sailStates.q + (-1.305463)*sailStates.r + (0.001048)*sailStates.de;
	Cm = (-13.248197)*sailStates.alpha + (0.000000)*sailStates.beta + (10.270293)*sailStates.p + (-151.784744)*sailStates.q + (4.965168)*sailStates.r + (-0.071706)*sailStates.de;
	Cn = (0.500226)*sailStates.alpha + (0.021878)*sailStates.beta + (1.171366)*sailStates.p + (-4.272553)*sailStates.q + (-0.001437)*sailStates.r + (0.000135)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end