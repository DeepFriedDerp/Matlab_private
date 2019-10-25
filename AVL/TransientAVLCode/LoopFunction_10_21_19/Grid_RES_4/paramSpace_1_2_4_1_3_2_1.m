function [aeroForces] = paramSpace_1_2_4_1_3_2_1(sailStates,airStates)

	CL = (3.866546)*sailStates.alpha + (-0.062546)*sailStates.beta + (-1.579505)*sailStates.p + (28.219944)*sailStates.q + (-1.058929)*sailStates.r + (0.010374)*sailStates.de;
	CD = -0.044780;
	CY = (0.267851)*sailStates.alpha + (-0.025938)*sailStates.beta + (-0.359663)*sailStates.p + (1.002334)*sailStates.q + (-0.071434)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (0.778877)*sailStates.alpha + (0.119669)*sailStates.beta + (-0.449147)*sailStates.p + (3.451588)*sailStates.q + (-0.715449)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-12.933222)*sailStates.alpha + (0.194700)*sailStates.beta + (4.861187)*sailStates.p + (-108.591942)*sailStates.q + (3.490781)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-0.720706)*sailStates.alpha + (0.029399)*sailStates.beta + (0.750884)*sailStates.p + (-4.238101)*sailStates.q + (0.024377)*sailStates.r + (-0.000329)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end