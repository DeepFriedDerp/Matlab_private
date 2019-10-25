function [aeroForces] = paramSpace_10_1_2_1_2_2_1(sailStates,airStates)

	CL = (4.510845)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.103849)*sailStates.p + (32.441692)*sailStates.q + (1.307389)*sailStates.r + (0.011164)*sailStates.de;
	CD = -0.586260;
	CY = (0.037291)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.498732)*sailStates.p + (1.113124)*sailStates.q + (-0.034914)*sailStates.r + (0.000238)*sailStates.de;

	Cl = (0.926900)*sailStates.alpha + (-0.294345)*sailStates.beta + (-0.809621)*sailStates.p + (6.342589)*sailStates.q + (1.164812)*sailStates.r + (-0.000299)*sailStates.de;
	Cm = (-13.444027)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.870724)*sailStates.p + (-123.764404)*sailStates.q + (-4.436093)*sailStates.r + (-0.068848)*sailStates.de;
	Cn = (0.490506)*sailStates.alpha + (0.020583)*sailStates.beta + (-1.116911)*sailStates.p + (4.188201)*sailStates.q + (0.000654)*sailStates.r + (-0.000230)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end