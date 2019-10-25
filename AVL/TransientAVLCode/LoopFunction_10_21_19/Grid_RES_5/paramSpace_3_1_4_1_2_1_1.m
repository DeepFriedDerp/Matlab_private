function [aeroForces] = paramSpace_3_1_4_1_2_1_1(sailStates,airStates)

	CL = (5.255797)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.069767)*sailStates.p + (35.213608)*sailStates.q + (-2.234985)*sailStates.r + (0.011435)*sailStates.de;
	CD = -0.998100;
	CY = (0.277708)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.873856)*sailStates.p + (0.624080)*sailStates.q + (-0.154018)*sailStates.r + (0.000132)*sailStates.de;

	Cl = (1.548305)*sailStates.alpha + (0.412028)*sailStates.beta + (-0.780354)*sailStates.p + (7.122913)*sailStates.q + (-1.831847)*sailStates.r + (-0.000371)*sailStates.de;
	Cm = (-12.636965)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.663588)*sailStates.p + (-120.478767)*sailStates.q + (7.405367)*sailStates.r + (-0.066945)*sailStates.de;
	Cn = (-1.027681)*sailStates.alpha + (0.072652)*sailStates.beta + (1.878294)*sailStates.p + (-8.786056)*sailStates.q + (0.032125)*sailStates.r + (-0.000322)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end