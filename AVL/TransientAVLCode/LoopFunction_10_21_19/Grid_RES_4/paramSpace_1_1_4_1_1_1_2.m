function [aeroForces] = paramSpace_1_1_4_1_1_1_2(sailStates,airStates)

	CL = (5.472174)*sailStates.alpha + (-0.635429)*sailStates.beta + (-2.681565)*sailStates.p + (42.599041)*sailStates.q + (-2.791553)*sailStates.r + (0.012175)*sailStates.de;
	CD = -1.813250;
	CY = (-0.238243)*sailStates.alpha + (-0.020007)*sailStates.beta + (-0.965913)*sailStates.p + (-1.664518)*sailStates.q + (-0.192311)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.152479)*sailStates.alpha + (0.361497)*sailStates.beta + (-1.286311)*sailStates.p + (12.429561)*sailStates.q + (-2.385192)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-9.673852)*sailStates.alpha + (2.340011)*sailStates.beta + (7.221484)*sailStates.p + (-136.195908)*sailStates.q + (9.241733)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.219944)*sailStates.alpha + (0.108167)*sailStates.beta + (2.054336)*sailStates.p + (-7.282082)*sailStates.q + (-0.014842)*sailStates.r + (0.000271)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end