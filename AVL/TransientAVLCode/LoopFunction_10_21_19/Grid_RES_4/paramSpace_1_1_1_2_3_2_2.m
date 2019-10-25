function [aeroForces] = paramSpace_1_1_1_2_3_2_2(sailStates,airStates)

	CL = (3.862161)*sailStates.alpha + (-0.261609)*sailStates.beta + (-2.437937)*sailStates.p + (35.210457)*sailStates.q + (-1.184948)*sailStates.r + (0.010340)*sailStates.de;
	CD = 0.058980;
	CY = (0.097537)*sailStates.alpha + (-0.027428)*sailStates.beta + (-0.361672)*sailStates.p + (0.756270)*sailStates.q + (-0.072022)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.350827)*sailStates.alpha + (0.070595)*sailStates.beta + (-1.187009)*sailStates.p + (10.468076)*sailStates.q + (-0.875457)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-13.242172)*sailStates.alpha + (1.021242)*sailStates.beta + (7.835984)*sailStates.p + (-132.741776)*sailStates.q + (3.986256)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.021674)*sailStates.alpha + (0.029813)*sailStates.beta + (0.582709)*sailStates.p + (-2.294949)*sailStates.q + (-0.011413)*sailStates.r + (-0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end