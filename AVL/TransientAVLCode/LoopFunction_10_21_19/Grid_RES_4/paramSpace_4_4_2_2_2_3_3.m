function [aeroForces] = paramSpace_4_4_2_2_2_3_3(sailStates,airStates)

	CL = (4.395018)*sailStates.alpha + (-0.452524)*sailStates.beta + (-2.926330)*sailStates.p + (41.894245)*sailStates.q + (2.152977)*sailStates.r + (0.011426)*sailStates.de;
	CD = -0.492830;
	CY = (0.084649)*sailStates.alpha + (-0.023859)*sailStates.beta + (0.729294)*sailStates.p + (-0.301044)*sailStates.q + (-0.145055)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.438073)*sailStates.alpha + (-0.491884)*sailStates.beta + (-1.449680)*sailStates.p + (13.250255)*sailStates.q + (1.727101)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-12.057662)*sailStates.alpha + (1.648195)*sailStates.beta + (8.696953)*sailStates.p + (-144.677322)*sailStates.q + (-7.142952)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.406679)*sailStates.alpha + (0.068294)*sailStates.beta + (-1.407568)*sailStates.p + (5.648617)*sailStates.q + (-0.006237)*sailStates.r + (0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end