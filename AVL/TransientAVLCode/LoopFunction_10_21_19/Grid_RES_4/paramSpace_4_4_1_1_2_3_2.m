function [aeroForces] = paramSpace_4_4_1_1_2_3_2(sailStates,airStates)

	CL = (6.488231)*sailStates.alpha + (-0.694721)*sailStates.beta + (-2.632416)*sailStates.p + (42.873306)*sailStates.q + (3.217847)*sailStates.r + (0.012163)*sailStates.de;
	CD = -2.362550;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (1.230486)*sailStates.p + (-0.000001)*sailStates.q + (-0.244759)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.877551)*sailStates.alpha + (-0.817280)*sailStates.beta + (-1.161332)*sailStates.p + (11.328401)*sailStates.q + (2.716379)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-10.762110)*sailStates.alpha + (2.535625)*sailStates.beta + (6.651246)*sailStates.p + (-133.820877)*sailStates.q + (-10.619067)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.233027)*sailStates.alpha + (0.114185)*sailStates.beta + (-2.631237)*sailStates.p + (11.305625)*sailStates.q + (0.028822)*sailStates.r + (0.000234)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end