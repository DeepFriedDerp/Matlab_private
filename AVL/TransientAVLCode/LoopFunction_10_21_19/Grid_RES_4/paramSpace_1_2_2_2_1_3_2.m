function [aeroForces] = paramSpace_1_2_2_2_1_3_2(sailStates,airStates)

	CL = (4.276994)*sailStates.alpha + (0.016156)*sailStates.beta + (-2.424918)*sailStates.p + (31.579519)*sailStates.q + (0.225749)*sailStates.r + (0.009881)*sailStates.de;
	CD = -0.400730;
	CY = (-0.086542)*sailStates.alpha + (-0.024146)*sailStates.beta + (0.359938)*sailStates.p + (-0.756270)*sailStates.q + (0.071623)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.398906)*sailStates.alpha + (-0.144915)*sailStates.beta + (-1.168146)*sailStates.p + (9.115913)*sailStates.q + (0.415159)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-15.299512)*sailStates.alpha + (-0.063094)*sailStates.beta + (9.094331)*sailStates.p + (-135.926239)*sailStates.q + (-0.648542)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (0.436231)*sailStates.alpha + (-0.033590)*sailStates.beta + (-1.003705)*sailStates.p + (5.855211)*sailStates.q + (-0.070903)*sailStates.r + (0.000302)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end