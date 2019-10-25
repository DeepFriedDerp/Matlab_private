function [aeroForces] = paramSpace_1_3_2_3_1_2_2(sailStates,airStates)

	CL = (3.836168)*sailStates.alpha + (0.146736)*sailStates.beta + (-2.498755)*sailStates.p + (34.931988)*sailStates.q + (-0.748188)*sailStates.r + (0.010608)*sailStates.de;
	CD = 0.065600;
	CY = (-0.061225)*sailStates.alpha + (-0.026070)*sailStates.beta + (-0.118532)*sailStates.p + (-0.491627)*sailStates.q + (-0.020900)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.107704)*sailStates.alpha + (0.119940)*sailStates.beta + (-1.132488)*sailStates.p + (9.267995)*sailStates.q + (-0.489255)*sailStates.r + (0.000246)*sailStates.de;
	Cm = (-13.784886)*sailStates.alpha + (-0.533555)*sailStates.beta + (8.409977)*sailStates.p + (-135.234604)*sailStates.q + (2.532996)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.166068)*sailStates.alpha + (0.017474)*sailStates.beta + (0.114974)*sailStates.p + (0.416578)*sailStates.q + (-0.030786)*sailStates.r + (0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end