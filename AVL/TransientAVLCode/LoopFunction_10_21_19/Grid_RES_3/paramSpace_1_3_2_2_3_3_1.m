function [aeroForces] = paramSpace_1_3_2_2_3_3_1(sailStates,airStates)

	CL = (4.009501)*sailStates.alpha + (-0.041197)*sailStates.beta + (-2.005890)*sailStates.p + (28.616653)*sailStates.q + (0.088705)*sailStates.r + (0.009790)*sailStates.de;
	CD = -0.257090;
	CY = (0.024748)*sailStates.alpha + (-0.023593)*sailStates.beta + (0.195225)*sailStates.p + (0.491415)*sailStates.q + (0.034423)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (0.867111)*sailStates.alpha + (-0.126946)*sailStates.beta + (-0.769642)*sailStates.p + (5.419924)*sailStates.q + (0.308194)*sailStates.r + (-0.000336)*sailStates.de;
	Cm = (-14.624249)*sailStates.alpha + (0.201814)*sailStates.beta + (7.351330)*sailStates.p + (-122.751358)*sailStates.q + (-0.258394)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (0.318234)*sailStates.alpha + (-0.017999)*sailStates.beta + (-0.566341)*sailStates.p + (2.450652)*sailStates.q + (-0.021589)*sailStates.r + (-0.000089)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end