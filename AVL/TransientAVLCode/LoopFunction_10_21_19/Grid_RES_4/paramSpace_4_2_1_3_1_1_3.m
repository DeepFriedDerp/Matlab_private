function [aeroForces] = paramSpace_4_2_1_3_1_1_3(sailStates,airStates)

	CL = (3.966519)*sailStates.alpha + (0.017491)*sailStates.beta + (-2.667637)*sailStates.p + (35.097141)*sailStates.q + (0.537976)*sailStates.r + (0.010428)*sailStates.de;
	CD = -0.050800;
	CY = (-0.083589)*sailStates.alpha + (-0.025633)*sailStates.beta + (0.005612)*sailStates.p + (-0.684401)*sailStates.q + (-0.001043)*sailStates.r + (-0.000146)*sailStates.de;

	Cl = (1.310747)*sailStates.alpha + (0.036880)*sailStates.beta + (-1.360421)*sailStates.p + (11.494207)*sailStates.q + (0.217007)*sailStates.r + (0.000675)*sailStates.de;
	Cm = (-14.652230)*sailStates.alpha + (-0.019486)*sailStates.beta + (9.261057)*sailStates.p + (-141.172913)*sailStates.q + (-1.803582)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (-0.137993)*sailStates.alpha + (-0.006350)*sailStates.beta + (0.229189)*sailStates.p + (-1.301955)*sailStates.q + (-0.035364)*sailStates.r + (0.000194)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end