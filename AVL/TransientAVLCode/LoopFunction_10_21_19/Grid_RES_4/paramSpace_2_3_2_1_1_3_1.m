function [aeroForces] = paramSpace_2_3_2_1_1_3_1(sailStates,airStates)

	CL = (6.978105)*sailStates.alpha + (-0.172181)*sailStates.beta + (-1.640946)*sailStates.p + (25.056654)*sailStates.q + (2.443343)*sailStates.r + (0.010105)*sailStates.de;
	CD = -2.821570;
	CY = (-0.690247)*sailStates.alpha + (-0.025727)*sailStates.beta + (1.276683)*sailStates.p + (-1.915495)*sailStates.q + (0.083746)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (2.021604)*sailStates.alpha + (-0.615100)*sailStates.beta + (-0.461228)*sailStates.p + (2.146973)*sailStates.q + (2.295987)*sailStates.r + (-0.000810)*sailStates.de;
	Cm = (-16.687542)*sailStates.alpha + (0.660253)*sailStates.beta + (6.489911)*sailStates.p + (-113.694908)*sailStates.q + (-8.245961)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (2.655159)*sailStates.alpha + (-0.034583)*sailStates.beta + (-2.832389)*sailStates.p + (14.322146)*sailStates.q + (-0.033272)*sailStates.r + (0.000750)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end