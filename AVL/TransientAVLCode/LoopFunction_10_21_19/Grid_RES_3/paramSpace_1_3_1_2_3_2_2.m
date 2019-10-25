function [aeroForces] = paramSpace_1_3_1_2_3_2_2(sailStates,airStates)

	CL = (3.922046)*sailStates.alpha + (0.210918)*sailStates.beta + (-2.464944)*sailStates.p + (35.172947)*sailStates.q + (-1.081153)*sailStates.r + (0.010498)*sailStates.de;
	CD = 0.047970;
	CY = (0.097498)*sailStates.alpha + (-0.022730)*sailStates.beta + (-0.337445)*sailStates.p + (0.759371)*sailStates.q + (-0.059573)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.228321)*sailStates.alpha + (0.198401)*sailStates.beta + (-1.111551)*sailStates.p + (9.328650)*sailStates.q + (-0.784266)*sailStates.r + (0.000172)*sailStates.de;
	Cm = (-13.583269)*sailStates.alpha + (-0.823297)*sailStates.beta + (8.017238)*sailStates.p + (-133.652283)*sailStates.q + (3.645489)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.051335)*sailStates.alpha + (0.023344)*sailStates.beta + (0.562407)*sailStates.p + (-2.435839)*sailStates.q + (-0.004664)*sailStates.r + (-0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end