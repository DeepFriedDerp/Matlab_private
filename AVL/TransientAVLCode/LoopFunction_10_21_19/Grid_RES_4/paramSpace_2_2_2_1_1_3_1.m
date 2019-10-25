function [aeroForces] = paramSpace_2_2_2_1_1_3_1(sailStates,airStates)

	CL = (6.978105)*sailStates.alpha + (0.172181)*sailStates.beta + (-1.640946)*sailStates.p + (25.056650)*sailStates.q + (2.443344)*sailStates.r + (0.010105)*sailStates.de;
	CD = -2.821570;
	CY = (-0.690247)*sailStates.alpha + (-0.024226)*sailStates.beta + (1.276683)*sailStates.p + (-1.915495)*sailStates.q + (0.083746)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (2.086659)*sailStates.alpha + (-0.505836)*sailStates.beta + (-0.493875)*sailStates.p + (2.550850)*sailStates.q + (2.293833)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-16.687542)*sailStates.alpha + (-0.660254)*sailStates.beta + (6.489911)*sailStates.p + (-113.694908)*sailStates.q + (-8.245961)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (2.610279)*sailStates.alpha + (-0.038887)*sailStates.beta + (-2.834528)*sailStates.p + (14.348618)*sailStates.q + (-0.033413)*sailStates.r + (0.000750)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end