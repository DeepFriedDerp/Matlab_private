function [aeroForces] = paramSpace_3_3_4_1_1_1_2(sailStates,airStates)

	CL = (5.378626)*sailStates.alpha + (0.118692)*sailStates.beta + (-2.491283)*sailStates.p + (32.428173)*sailStates.q + (-1.433284)*sailStates.r + (0.010456)*sailStates.de;
	CD = -1.650950;
	CY = (-0.202631)*sailStates.alpha + (-0.024193)*sailStates.beta + (-0.678147)*sailStates.p + (-1.693499)*sailStates.q + (0.044269)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.151680)*sailStates.alpha + (0.438497)*sailStates.beta + (-1.162583)*sailStates.p + (8.913302)*sailStates.q + (-1.454146)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-14.513845)*sailStates.alpha + (-0.456110)*sailStates.beta + (9.050932)*sailStates.p + (-136.398376)*sailStates.q + (4.849317)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.211964)*sailStates.alpha + (-0.026388)*sailStates.beta + (1.659401)*sailStates.p + (-6.646285)*sailStates.q + (-0.008372)*sailStates.r + (0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end