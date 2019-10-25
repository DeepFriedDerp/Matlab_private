function [aeroForces] = paramSpace_1_1_3_3_2_3_1(sailStates,airStates)

	CL = (3.996287)*sailStates.alpha + (0.009408)*sailStates.beta + (-2.189032)*sailStates.p + (30.743235)*sailStates.q + (-0.114565)*sailStates.r + (0.010180)*sailStates.de;
	CD = -0.112370;
	CY = (-0.037854)*sailStates.alpha + (-0.024437)*sailStates.beta + (0.154228)*sailStates.p + (-0.173373)*sailStates.q + (0.027178)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.151131)*sailStates.alpha + (-0.075044)*sailStates.beta + (-0.987982)*sailStates.p + (7.822036)*sailStates.q + (0.109490)*sailStates.r + (0.000114)*sailStates.de;
	Cm = (-14.780272)*sailStates.alpha + (-0.132340)*sailStates.beta + (7.832551)*sailStates.p + (-127.559647)*sailStates.q + (0.400202)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (0.295243)*sailStates.alpha + (-0.016682)*sailStates.beta + (-0.475446)*sailStates.p + (2.653551)*sailStates.q + (-0.034039)*sailStates.r + (0.000076)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end