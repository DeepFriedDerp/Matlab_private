function [aeroForces] = paramSpace_3_1_4_1_1_1_2(sailStates,airStates)

	CL = (5.318405)*sailStates.alpha + (-0.355950)*sailStates.beta + (-2.471751)*sailStates.p + (32.161850)*sailStates.q + (-1.435922)*sailStates.r + (0.010294)*sailStates.de;
	CD = -1.651970;
	CY = (-0.201017)*sailStates.alpha + (-0.027130)*sailStates.beta + (-0.678894)*sailStates.p + (-1.693496)*sailStates.q + (0.044318)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (1.237775)*sailStates.alpha + (0.311475)*sailStates.beta + (-1.218558)*sailStates.p + (9.645028)*sailStates.q + (-1.451804)*sailStates.r + (0.000430)*sailStates.de;
	Cm = (-14.284779)*sailStates.alpha + (1.368349)*sailStates.beta + (8.984325)*sailStates.p + (-135.354233)*sailStates.q + (4.858499)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (-0.145998)*sailStates.alpha + (-0.027462)*sailStates.beta + (1.664700)*sailStates.p + (-6.701027)*sailStates.q + (-0.008631)*sailStates.r + (0.000323)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end