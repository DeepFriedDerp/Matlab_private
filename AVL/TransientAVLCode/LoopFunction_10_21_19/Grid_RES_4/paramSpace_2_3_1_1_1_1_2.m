function [aeroForces] = paramSpace_2_3_1_1_1_1_2(sailStates,airStates)

	CL = (5.609891)*sailStates.alpha + (0.186841)*sailStates.beta + (-2.641306)*sailStates.p + (37.559570)*sailStates.q + (-2.126499)*sailStates.r + (0.011534)*sailStates.de;
	CD = -1.841580;
	CY = (-0.221175)*sailStates.alpha + (-0.025759)*sailStates.beta + (-0.874287)*sailStates.p + (-1.693498)*sailStates.q + (-0.057125)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.135230)*sailStates.alpha + (0.551366)*sailStates.beta + (-1.220484)*sailStates.p + (10.258306)*sailStates.q + (-1.981223)*sailStates.r + (0.000339)*sailStates.de;
	Cm = (-12.446527)*sailStates.alpha + (-0.762658)*sailStates.beta + (8.452370)*sailStates.p + (-137.990799)*sailStates.q + (7.261855)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (-0.060271)*sailStates.alpha + (0.033087)*sailStates.beta + (1.931503)*sailStates.p + (-7.171955)*sailStates.q + (0.001350)*sailStates.r + (0.000337)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end