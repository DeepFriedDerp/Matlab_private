function [aeroForces] = paramSpace_1_2_2_3_3_2_2(sailStates,airStates)

	CL = (3.984127)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.489747)*sailStates.p + (35.314438)*sailStates.q + (-1.007049)*sailStates.r + (0.010748)*sailStates.de;
	CD = 0.042190;
	CY = (0.063135)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.276759)*sailStates.p + (0.491626)*sailStates.q + (-0.048800)*sailStates.r + (0.000105)*sailStates.de;

	Cl = (1.267873)*sailStates.alpha + (0.118769)*sailStates.beta + (-1.166609)*sailStates.p + (9.910889)*sailStates.q + (-0.708166)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-13.972915)*sailStates.alpha + (0.000000)*sailStates.beta + (8.166517)*sailStates.p + (-134.907364)*sailStates.q + (3.376442)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (0.021495)*sailStates.alpha + (0.020942)*sailStates.beta + (0.438247)*sailStates.p + (-1.724180)*sailStates.q + (-0.011323)*sailStates.r + (-0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end