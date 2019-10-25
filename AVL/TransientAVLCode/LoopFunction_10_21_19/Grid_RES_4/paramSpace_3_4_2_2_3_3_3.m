function [aeroForces] = paramSpace_3_4_2_2_3_3_3(sailStates,airStates)

	CL = (4.250248)*sailStates.alpha + (-0.272910)*sailStates.beta + (-2.983547)*sailStates.p + (39.118385)*sailStates.q + (1.187247)*sailStates.r + (0.011333)*sailStates.de;
	CD = -0.360920;
	CY = (0.157630)*sailStates.alpha + (-0.025429)*sailStates.beta + (0.436316)*sailStates.p + (0.668512)*sailStates.q + (-0.028621)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.272840)*sailStates.alpha + (-0.320993)*sailStates.beta + (-1.491768)*sailStates.p + (12.461744)*sailStates.q + (1.034810)*sailStates.r + (0.000756)*sailStates.de;
	Cm = (-13.544702)*sailStates.alpha + (1.034674)*sailStates.beta + (9.898582)*sailStates.p + (-147.557632)*sailStates.q + (-4.020988)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.275391)*sailStates.alpha + (0.015770)*sailStates.beta + (-0.920350)*sailStates.p + (3.428244)*sailStates.q + (-0.001077)*sailStates.r + (-0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end