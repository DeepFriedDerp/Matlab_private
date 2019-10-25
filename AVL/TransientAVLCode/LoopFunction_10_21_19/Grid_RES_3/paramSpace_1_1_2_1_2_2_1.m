function [aeroForces] = paramSpace_1_1_2_1_2_2_1(sailStates,airStates)

	CL = (3.586312)*sailStates.alpha + (-0.124971)*sailStates.beta + (-1.626001)*sailStates.p + (27.762094)*sailStates.q + (-0.568692)*sailStates.r + (0.010220)*sailStates.de;
	CD = 0.047610;
	CY = (-0.034402)*sailStates.alpha + (-0.023346)*sailStates.beta + (-0.102930)*sailStates.p + (-0.589407)*sailStates.q + (-0.018149)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (0.643865)*sailStates.alpha + (0.048534)*sailStates.beta + (-0.504100)*sailStates.p + (3.621795)*sailStates.q + (-0.357549)*sailStates.r + (-0.000668)*sailStates.de;
	Cm = (-12.862889)*sailStates.alpha + (0.459594)*sailStates.beta + (5.460881)*sailStates.p + (-110.634644)*sailStates.q + (1.925852)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (-0.088283)*sailStates.alpha + (0.011635)*sailStates.beta + (0.193352)*sailStates.p + (-0.356419)*sailStates.q + (-0.013279)*sailStates.r + (0.000159)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end