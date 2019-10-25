function [aeroForces] = paramSpace_1_3_1_2_2_3_3(sailStates,airStates)

	CL = (4.028442)*sailStates.alpha + (-0.007053)*sailStates.beta + (-2.806733)*sailStates.p + (35.148003)*sailStates.q + (-0.006090)*sailStates.r + (0.010059)*sailStates.de;
	CD = -0.272870;
	CY = (0.067815)*sailStates.alpha + (-0.024090)*sailStates.beta + (0.211413)*sailStates.p + (0.267957)*sailStates.q + (0.037252)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.316568)*sailStates.alpha + (-0.112892)*sailStates.beta + (-1.422628)*sailStates.p + (11.506386)*sailStates.q + (0.209066)*sailStates.r + (0.000734)*sailStates.de;
	Cm = (-14.380370)*sailStates.alpha + (0.008617)*sailStates.beta + (10.115541)*sailStates.p + (-145.513718)*sailStates.q + (0.102565)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.122394)*sailStates.alpha + (-0.014197)*sailStates.beta + (-0.726420)*sailStates.p + (4.017233)*sailStates.q + (-0.047131)*sailStates.r + (0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end