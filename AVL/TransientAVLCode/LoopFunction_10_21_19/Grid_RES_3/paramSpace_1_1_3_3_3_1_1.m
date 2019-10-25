function [aeroForces] = paramSpace_1_1_3_3_3_1_1(sailStates,airStates)

	CL = (4.320211)*sailStates.alpha + (-0.278268)*sailStates.beta + (-2.265313)*sailStates.p + (34.961868)*sailStates.q + (-1.559422)*sailStates.r + (0.010994)*sailStates.de;
	CD = -0.250160;
	CY = (0.101409)*sailStates.alpha + (-0.025554)*sailStates.beta + (-0.532825)*sailStates.p + (0.318251)*sailStates.q + (-0.093921)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.335758)*sailStates.alpha + (0.162905)*sailStates.beta + (-1.008137)*sailStates.p + (8.939605)*sailStates.q + (-1.219499)*sailStates.r + (0.000085)*sailStates.de;
	Cm = (-13.220544)*sailStates.alpha + (0.967564)*sailStates.beta + (6.912876)*sailStates.p + (-126.937798)*sailStates.q + (5.177818)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.282229)*sailStates.alpha + (0.046168)*sailStates.beta + (1.069394)*sailStates.p + (-4.670261)*sailStates.q + (0.004630)*sailStates.r + (-0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end