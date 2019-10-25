function [aeroForces] = paramSpace_1_2_2_2_3_1_3(sailStates,airStates)

	CL = (4.796199)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.942560)*sailStates.p + (41.852440)*sailStates.q + (-2.234583)*sailStates.r + (0.011586)*sailStates.de;
	CD = -0.644400;
	CY = (0.000145)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.832844)*sailStates.p + (1.027327)*sailStates.q + (-0.146853)*sailStates.r + (0.000220)*sailStates.de;

	Cl = (1.790370)*sailStates.alpha + (0.375442)*sailStates.beta + (-1.504526)*sailStates.p + (13.829396)*sailStates.q + (-1.825907)*sailStates.r + (0.000810)*sailStates.de;
	Cm = (-12.960948)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.762258)*sailStates.p + (-145.469635)*sailStates.q + (7.439661)*sailStates.r + (-0.069407)*sailStates.de;
	Cn = (0.375024)*sailStates.alpha + (0.066201)*sailStates.beta + (1.627558)*sailStates.p + (-7.202993)*sailStates.q + (0.011803)*sailStates.r + (-0.000441)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end