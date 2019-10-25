function [aeroForces] = paramSpace_3_1_2_1_1_3_3(sailStates,airStates)

	CL = (7.283088)*sailStates.alpha + (0.653429)*sailStates.beta + (-3.472926)*sailStates.p + (44.615051)*sailStates.q + (3.106457)*sailStates.r + (0.011881)*sailStates.de;
	CD = -2.987800;
	CY = (0.268022)*sailStates.alpha + (-0.026627)*sailStates.beta + (1.427168)*sailStates.p + (-1.915493)*sailStates.q + (-0.093474)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (3.072832)*sailStates.alpha + (-0.424867)*sailStates.beta + (-1.978209)*sailStates.p + (17.754101)*sailStates.q + (2.753065)*sailStates.r + (0.001608)*sailStates.de;
	Cm = (-14.251019)*sailStates.alpha + (-2.477383)*sailStates.beta + (10.957246)*sailStates.p + (-159.650192)*sailStates.q + (-10.489820)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-1.572262)*sailStates.alpha + (0.046330)*sailStates.beta + (-3.032813)*sailStates.p + (14.758700)*sailStates.q + (0.026733)*sailStates.r + (0.000856)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end