function [aeroForces] = paramSpace_1_1_1_2_2_3_3(sailStates,airStates)

	CL = (4.028443)*sailStates.alpha + (0.007053)*sailStates.beta + (-2.806733)*sailStates.p + (35.147995)*sailStates.q + (-0.006090)*sailStates.r + (0.010059)*sailStates.de;
	CD = -0.272870;
	CY = (0.067815)*sailStates.alpha + (-0.025572)*sailStates.beta + (0.211413)*sailStates.p + (0.267957)*sailStates.q + (0.037252)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.436554)*sailStates.alpha + (-0.121255)*sailStates.beta + (-1.507246)*sailStates.p + (12.567256)*sailStates.q + (0.194045)*sailStates.r + (0.000963)*sailStates.de;
	Cm = (-14.380368)*sailStates.alpha + (-0.008617)*sailStates.beta + (10.115542)*sailStates.p + (-145.513718)*sailStates.q + (0.102564)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.115685)*sailStates.alpha + (-0.027089)*sailStates.beta + (-0.741341)*sailStates.p + (4.204293)*sailStates.q + (-0.049780)*sailStates.r + (0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end