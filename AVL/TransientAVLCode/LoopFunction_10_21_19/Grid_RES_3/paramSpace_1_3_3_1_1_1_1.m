function [aeroForces] = paramSpace_1_3_3_1_1_1_1(sailStates,airStates)

	CL = (5.307612)*sailStates.alpha + (0.510603)*sailStates.beta + (-1.822643)*sailStates.p + (34.520569)*sailStates.q + (-2.373805)*sailStates.r + (0.011704)*sailStates.de;
	CD = -1.784250;
	CY = (0.007404)*sailStates.alpha + (-0.029968)*sailStates.beta + (-0.853419)*sailStates.p + (-2.260756)*sailStates.q + (-0.150696)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (0.477128)*sailStates.alpha + (0.642557)*sailStates.beta + (-0.495273)*sailStates.p + (4.344798)*sailStates.q + (-2.046161)*sailStates.r + (-0.000796)*sailStates.de;
	Cm = (-9.208541)*sailStates.alpha + (-1.912117)*sailStates.beta + (4.669295)*sailStates.p + (-112.748650)*sailStates.q + (7.904609)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (-1.450579)*sailStates.alpha + (0.088922)*sailStates.beta + (1.971025)*sailStates.p + (-7.309040)*sailStates.q + (0.002338)*sailStates.r + (0.000495)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end