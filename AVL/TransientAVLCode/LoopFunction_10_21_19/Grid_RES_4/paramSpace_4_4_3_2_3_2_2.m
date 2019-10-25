function [aeroForces] = paramSpace_4_4_3_2_3_2_2(sailStates,airStates)

	CL = (3.740591)*sailStates.alpha + (-0.187570)*sailStates.beta + (-2.483233)*sailStates.p + (34.913139)*sailStates.q + (0.789530)*sailStates.r + (0.010435)*sailStates.de;
	CD = 0.083040;
	CY = (0.093556)*sailStates.alpha + (-0.027271)*sailStates.beta + (0.107007)*sailStates.p + (0.756270)*sailStates.q + (-0.021258)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.066625)*sailStates.alpha + (-0.131831)*sailStates.beta + (-1.120761)*sailStates.p + (9.199169)*sailStates.q + (0.515532)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-13.432718)*sailStates.alpha + (0.712376)*sailStates.beta + (8.363423)*sailStates.p + (-134.899979)*sailStates.q + (-2.688079)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.216458)*sailStates.alpha + (0.022674)*sailStates.beta + (-0.072794)*sailStates.p + (-0.921371)*sailStates.q + (-0.043790)*sailStates.r + (-0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end