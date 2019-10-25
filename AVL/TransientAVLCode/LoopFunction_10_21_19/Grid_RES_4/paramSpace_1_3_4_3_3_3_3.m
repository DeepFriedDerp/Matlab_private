function [aeroForces] = paramSpace_1_3_4_3_3_3_3(sailStates,airStates)

	CL = (3.966519)*sailStates.alpha + (0.017491)*sailStates.beta + (-2.667637)*sailStates.p + (35.097141)*sailStates.q + (-0.537975)*sailStates.r + (0.010428)*sailStates.de;
	CD = -0.050800;
	CY = (0.083589)*sailStates.alpha + (-0.024320)*sailStates.beta + (-0.005612)*sailStates.p + (0.684401)*sailStates.q + (-0.001043)*sailStates.r + (0.000146)*sailStates.de;

	Cl = (1.264583)*sailStates.alpha + (-0.012235)*sailStates.beta + (-1.328872)*sailStates.p + (11.097239)*sailStates.q + (-0.210775)*sailStates.r + (0.000589)*sailStates.de;
	Cm = (-14.652231)*sailStates.alpha + (-0.019486)*sailStates.beta + (9.261057)*sailStates.p + (-141.172913)*sailStates.q + (1.803582)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (0.131023)*sailStates.alpha + (-0.003419)*sailStates.beta + (-0.222913)*sailStates.p + (1.222993)*sailStates.q + (-0.034125)*sailStates.r + (-0.000194)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end