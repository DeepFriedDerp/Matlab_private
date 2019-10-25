function [aeroForces] = paramSpace_4_1_3_2_1_3_2(sailStates,airStates)

	CL = (4.760706)*sailStates.alpha + (0.478976)*sailStates.beta + (-2.515800)*sailStates.p + (38.764565)*sailStates.q + (2.199497)*sailStates.r + (0.011134)*sailStates.de;
	CD = -0.638080;
	CY = (-0.105280)*sailStates.alpha + (-0.027271)*sailStates.beta + (0.816026)*sailStates.p + (-0.756269)*sailStates.q + (-0.162345)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.702895)*sailStates.alpha + (-0.229916)*sailStates.beta + (-1.211778)*sailStates.p + (11.416953)*sailStates.q + (1.800650)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-12.345432)*sailStates.alpha + (-1.797027)*sailStates.beta + (7.176809)*sailStates.p + (-132.741776)*sailStates.q + (-7.300154)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.093437)*sailStates.alpha + (0.079119)*sailStates.beta + (-1.627466)*sailStates.p + (7.065279)*sailStates.q + (0.013495)*sailStates.r + (0.000339)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end