function [aeroForces] = paramSpace_2_2_1_2_2_2_1(sailStates,airStates)

	CL = (5.415661)*sailStates.alpha + (-3.919780)*sailStates.beta + (-3.478584)*sailStates.p + (47.780838)*sailStates.q + (2.259257)*sailStates.r + (0.010548)*sailStates.de;
	CD = -6.279210;
	CY = (1.816684)*sailStates.alpha + (-0.251272)*sailStates.beta + (0.323429)*sailStates.p + (15.739373)*sailStates.q + (-0.033662)*sailStates.r + (0.002998)*sailStates.de;

	Cl = (-5.651209)*sailStates.alpha + (-1.264724)*sailStates.beta + (-1.691774)*sailStates.p + (14.406412)*sailStates.q + (2.495562)*sailStates.r + (0.001255)*sailStates.de;
	Cm = (6.141590)*sailStates.alpha + (17.613262)*sailStates.beta + (10.791928)*sailStates.p + (-152.113388)*sailStates.q + (-7.995020)*sailStates.r + (-0.055361)*sailStates.de;
	Cn = (-1.904186)*sailStates.alpha + (0.354163)*sailStates.beta + (-0.944178)*sailStates.p + (-8.740505)*sailStates.q + (-0.196813)*sailStates.r + (-0.003911)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end