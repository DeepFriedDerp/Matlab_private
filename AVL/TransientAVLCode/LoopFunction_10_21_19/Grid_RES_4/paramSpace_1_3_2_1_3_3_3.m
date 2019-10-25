function [aeroForces] = paramSpace_1_3_2_1_3_3_3(sailStates,airStates)

	CL = (4.787408)*sailStates.alpha + (-0.066954)*sailStates.beta + (-3.112824)*sailStates.p + (34.913406)*sailStates.q + (0.491914)*sailStates.r + (0.009437)*sailStates.de;
	CD = -1.443240;
	CY = (0.427310)*sailStates.alpha + (-0.022421)*sailStates.beta + (0.433289)*sailStates.p + (2.326707)*sailStates.q + (0.086103)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (1.278169)*sailStates.alpha + (-0.316347)*sailStates.beta + (-1.762300)*sailStates.p + (14.438948)*sailStates.q + (0.771710)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-14.280691)*sailStates.alpha + (0.279367)*sailStates.beta + (11.820589)*sailStates.p + (-156.352325)*sailStates.q + (-1.544627)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-0.549881)*sailStates.alpha + (-0.059124)*sailStates.beta + (-1.387085)*sailStates.p + (5.841856)*sailStates.q + (-0.052549)*sailStates.r + (-0.000521)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end