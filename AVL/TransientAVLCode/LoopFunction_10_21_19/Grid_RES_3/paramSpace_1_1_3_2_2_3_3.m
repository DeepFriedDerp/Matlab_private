function [aeroForces] = paramSpace_1_1_3_2_2_3_3(sailStates,airStates)

	CL = (4.155639)*sailStates.alpha + (0.056114)*sailStates.beta + (-2.808645)*sailStates.p + (35.032013)*sailStates.q + (0.017981)*sailStates.r + (0.010270)*sailStates.de;
	CD = -0.335310;
	CY = (0.074489)*sailStates.alpha + (-0.025440)*sailStates.beta + (0.250346)*sailStates.p + (0.267957)*sailStates.q + (0.044168)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.442948)*sailStates.alpha + (-0.137599)*sailStates.beta + (-1.508193)*sailStates.p + (12.562026)*sailStates.q + (0.257678)*sailStates.r + (0.000963)*sailStates.de;
	Cm = (-14.855808)*sailStates.alpha + (-0.326518)*sailStates.beta + (10.140405)*sailStates.p + (-145.513718)*sailStates.q + (-0.038435)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.090848)*sailStates.alpha + (-0.030124)*sailStates.beta + (-0.799744)*sailStates.p + (4.233953)*sailStates.q + (-0.049002)*sailStates.r + (-0.000027)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end