function [aeroForces] = paramSpace_15_1_2_2_2_1_1(sailStates,airStates)

	CL = (3.819136)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.193364)*sailStates.p + (31.246115)*sailStates.q + (0.462551)*sailStates.r + (0.009904)*sailStates.de;
	CD = -0.024010;
	CY = (0.078304)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.075334)*sailStates.p + (0.596614)*sailStates.q + (0.018761)*sailStates.r + (0.000125)*sailStates.de;

	Cl = (1.072626)*sailStates.alpha + (0.014216)*sailStates.beta + (-0.964532)*sailStates.p + (7.700161)*sailStates.q + (0.152886)*sailStates.r + (0.000093)*sailStates.de;
	Cm = (-14.280872)*sailStates.alpha + (0.000000)*sailStates.beta + (7.804085)*sailStates.p + (-128.528122)*sailStates.q + (-1.620705)*sailStates.r + (-0.065887)*sailStates.de;
	Cn = (-0.328122)*sailStates.alpha + (-0.003545)*sailStates.beta + (0.348968)*sailStates.p + (-2.650620)*sailStates.q + (-0.065178)*sailStates.r + (-0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end