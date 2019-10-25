function [aeroForces] = paramSpace_3_4_3_2_1_3_3(sailStates,airStates)

	CL = (4.719357)*sailStates.alpha + (-0.350401)*sailStates.beta + (-2.967773)*sailStates.p + (39.219933)*sailStates.q + (1.598558)*sailStates.r + (0.011299)*sailStates.de;
	CD = -0.619290;
	CY = (0.005038)*sailStates.alpha + (-0.023766)*sailStates.beta + (0.700075)*sailStates.p + (-0.870359)*sailStates.q + (-0.045916)*sailStates.r + (-0.000188)*sailStates.de;

	Cl = (1.665226)*sailStates.alpha + (-0.417377)*sailStates.beta + (-1.481998)*sailStates.p + (12.489369)*sailStates.q + (1.387268)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.104148)*sailStates.alpha + (1.362179)*sailStates.beta + (9.718369)*sailStates.p + (-146.834106)*sailStates.q + (-5.417057)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.158774)*sailStates.alpha + (0.018025)*sailStates.beta + (-1.453366)*sailStates.p + (6.895043)*sailStates.q + (0.010699)*sailStates.r + (0.000373)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end