function [aeroForces] = paramSpace_1_2_1_1_3_2_1(sailStates,airStates)

	CL = (3.755719)*sailStates.alpha + (-0.082873)*sailStates.beta + (-1.578160)*sailStates.p + (28.363335)*sailStates.q + (-1.080081)*sailStates.r + (0.010118)*sailStates.de;
	CD = -0.012020;
	CY = (0.284071)*sailStates.alpha + (-0.026147)*sailStates.beta + (-0.402258)*sailStates.p + (1.002333)*sailStates.q + (-0.080122)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (0.805009)*sailStates.alpha + (0.141406)*sailStates.beta + (-0.448345)*sailStates.p + (3.458394)*sailStates.q + (-0.783541)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-12.352165)*sailStates.alpha + (0.325112)*sailStates.beta + (4.837563)*sailStates.p + (-108.591942)*sailStates.q + (3.609548)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-0.762857)*sailStates.alpha + (0.034102)*sailStates.beta + (0.815034)*sailStates.p + (-4.272318)*sailStates.q + (0.023907)*sailStates.r + (-0.000319)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end