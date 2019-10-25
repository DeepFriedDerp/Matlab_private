function [aeroForces] = paramSpace_2_4_4_3_3_3_2(sailStates,airStates)

	CL = (4.124331)*sailStates.alpha + (-0.097168)*sailStates.beta + (-2.525451)*sailStates.p + (33.924824)*sailStates.q + (0.204416)*sailStates.r + (0.010761)*sailStates.de;
	CD = -0.119400;
	CY = (0.061051)*sailStates.alpha + (-0.024413)*sailStates.beta + (0.175037)*sailStates.p + (0.498142)*sailStates.q + (0.011525)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.150192)*sailStates.alpha + (-0.120885)*sailStates.beta + (-1.141668)*sailStates.p + (8.909241)*sailStates.q + (0.316085)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.767551)*sailStates.alpha + (0.488927)*sailStates.beta + (8.782691)*sailStates.p + (-135.916275)*sailStates.q + (-0.730799)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (0.084798)*sailStates.alpha + (-0.006209)*sailStates.beta + (-0.455621)*sailStates.p + (1.774146)*sailStates.q + (-0.004626)*sailStates.r + (-0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end