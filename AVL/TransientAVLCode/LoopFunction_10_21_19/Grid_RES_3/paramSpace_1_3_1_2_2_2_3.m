function [aeroForces] = paramSpace_1_3_1_2_2_2_3(sailStates,airStates)

	CL = (3.738909)*sailStates.alpha + (0.204001)*sailStates.beta + (-2.875708)*sailStates.p + (38.354397)*sailStates.q + (-1.025791)*sailStates.r + (0.010697)*sailStates.de;
	CD = 0.085810;
	CY = (-0.010447)*sailStates.alpha + (-0.024090)*sailStates.beta + (-0.259196)*sailStates.p + (0.267957)*sailStates.q + (-0.045729)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.260810)*sailStates.alpha + (0.179957)*sailStates.beta + (-1.444455)*sailStates.p + (12.352942)*sailStates.q + (-0.738407)*sailStates.r + (0.000734)*sailStates.de;
	Cm = (-13.256962)*sailStates.alpha + (-0.801686)*sailStates.beta + (9.520294)*sailStates.p + (-145.513718)*sailStates.q + (3.478382)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.237423)*sailStates.alpha + (0.023281)*sailStates.beta + (0.341000)*sailStates.p + (-0.783817)*sailStates.q + (-0.025342)*sailStates.r + (-0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end