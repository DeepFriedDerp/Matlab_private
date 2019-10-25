function [aeroForces] = paramSpace_4_4_2_2_1_1_1(sailStates,airStates)

	CL = (3.965498)*sailStates.alpha + (0.037688)*sailStates.beta + (-1.974609)*sailStates.p + (28.209244)*sailStates.q + (-0.010012)*sailStates.r + (0.009628)*sailStates.de;
	CD = -0.253370;
	CY = (-0.021849)*sailStates.alpha + (-0.023385)*sailStates.beta + (-0.183469)*sailStates.p + (-0.455226)*sailStates.q + (0.036511)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (0.840527)*sailStates.alpha + (0.116260)*sailStates.beta + (-0.750855)*sailStates.p + (5.261889)*sailStates.q + (-0.265843)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-14.596539)*sailStates.alpha + (-0.220621)*sailStates.beta + (7.272318)*sailStates.p + (-121.885399)*sailStates.q + (-0.011631)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.315667)*sailStates.alpha + (-0.018243)*sailStates.beta + (0.544654)*sailStates.p + (-2.351334)*sailStates.q + (-0.025824)*sailStates.r + (0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end