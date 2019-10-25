function [aeroForces] = paramSpace_2_1_1_1_1_1_2(sailStates,airStates)

	CL = (4.249621)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.090897)*sailStates.p + (44.348045)*sailStates.q + (-2.332444)*sailStates.r + (0.011682)*sailStates.de;
	CD = -0.604340;
	CY = (-0.245351)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.764018)*sailStates.p + (-0.550478)*sailStates.q + (-0.162338)*sailStates.r + (-0.000118)*sailStates.de;

	Cl = (1.254711)*sailStates.alpha + (0.403813)*sailStates.beta + (-1.609858)*sailStates.p + (15.060901)*sailStates.q + (-1.934519)*sailStates.r + (0.001055)*sailStates.de;
	Cm = (-10.633975)*sailStates.alpha + (0.000000)*sailStates.beta + (9.086597)*sailStates.p + (-149.810104)*sailStates.q + (7.778769)*sailStates.r + (-0.069050)*sailStates.de;
	Cn = (0.786023)*sailStates.alpha + (0.085833)*sailStates.beta + (1.444461)*sailStates.p + (-4.719623)*sailStates.q + (-0.031858)*sailStates.r + (0.000036)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end