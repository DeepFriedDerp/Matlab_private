function [aeroForces] = paramSpace_2_3_2_2_2_3_1(sailStates,airStates)

	CL = (4.398255)*sailStates.alpha + (-0.054212)*sailStates.beta + (-2.138024)*sailStates.p + (30.510946)*sailStates.q + (0.724362)*sailStates.r + (0.010597)*sailStates.de;
	CD = -0.409220;
	CY = (-0.080772)*sailStates.alpha + (-0.025016)*sailStates.beta + (0.410118)*sailStates.p + (-0.100924)*sailStates.q + (0.026884)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.096161)*sailStates.alpha + (-0.217307)*sailStates.beta + (-0.854773)*sailStates.p + (6.217329)*sailStates.q + (0.747864)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-14.990506)*sailStates.alpha + (0.209490)*sailStates.beta + (7.636613)*sailStates.p + (-126.149185)*sailStates.q + (-2.443645)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.525975)*sailStates.alpha + (-0.012530)*sailStates.beta + (-0.968809)*sailStates.p + (4.640272)*sailStates.q + (-0.010829)*sailStates.r + (0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end