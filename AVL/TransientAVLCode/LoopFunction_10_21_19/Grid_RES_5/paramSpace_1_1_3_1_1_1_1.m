function [aeroForces] = paramSpace_1_1_3_1_1_1_1(sailStates,airStates)

	CL = (4.367966)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.105124)*sailStates.p + (36.730488)*sailStates.q + (-2.039393)*sailStates.r + (0.011346)*sailStates.de;
	CD = -0.588610;
	CY = (-0.056510)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.630212)*sailStates.p + (-1.423509)*sailStates.q + (-0.157181)*sailStates.r + (-0.000296)*sailStates.de;

	Cl = (0.873322)*sailStates.alpha + (0.371059)*sailStates.beta + (-0.801340)*sailStates.p + (7.527368)*sailStates.q + (-1.635916)*sailStates.r + (-0.000227)*sailStates.de;
	Cm = (-10.391792)*sailStates.alpha + (0.000000)*sailStates.beta + (5.663008)*sailStates.p + (-121.603668)*sailStates.q + (6.706203)*sailStates.r + (-0.065245)*sailStates.de;
	Cn = (-0.479717)*sailStates.alpha + (0.092515)*sailStates.beta + (1.347915)*sailStates.p + (-4.535593)*sailStates.q + (-0.021930)*sailStates.r + (0.000296)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end