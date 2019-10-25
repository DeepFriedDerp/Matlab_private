function [aeroForces] = paramSpace_1_2_3_1_1_2_3(sailStates,airStates)

	CL = (3.510734)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.407763)*sailStates.p + (42.180332)*sailStates.q + (-0.743175)*sailStates.r + (0.011326)*sailStates.de;
	CD = 0.061860;
	CY = (-0.135925)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.005868)*sailStates.p + (-1.081940)*sailStates.q + (-0.001138)*sailStates.r + (-0.000234)*sailStates.de;

	Cl = (1.259420)*sailStates.alpha + (0.046101)*sailStates.beta + (-1.907595)*sailStates.p + (16.537836)*sailStates.q + (-0.469693)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (-12.940129)*sailStates.alpha + (-0.000000)*sailStates.beta + (11.638813)*sailStates.p + (-161.621323)*sailStates.q + (2.505816)*sailStates.r + (-0.071238)*sailStates.de;
	Cn = (0.383480)*sailStates.alpha + (0.008129)*sailStates.beta + (-0.243796)*sailStates.p + (3.041509)*sailStates.q + (-0.066586)*sailStates.r + (0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end