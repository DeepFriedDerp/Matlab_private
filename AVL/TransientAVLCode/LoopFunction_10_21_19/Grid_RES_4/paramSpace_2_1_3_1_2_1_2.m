function [aeroForces] = paramSpace_2_1_3_1_2_1_2(sailStates,airStates)

	CL = (6.424687)*sailStates.alpha + (-0.576363)*sailStates.beta + (-2.605230)*sailStates.p + (37.353848)*sailStates.q + (-2.548666)*sailStates.r + (0.011420)*sailStates.de;
	CD = -2.325610;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-1.117594)*sailStates.p + (0.000001)*sailStates.q + (-0.073251)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.965773)*sailStates.alpha + (0.387391)*sailStates.beta + (-1.266095)*sailStates.p + (11.018105)*sailStates.q + (-2.297270)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-13.490274)*sailStates.alpha + (2.215282)*sailStates.beta + (8.197968)*sailStates.p + (-136.150452)*sailStates.q + (8.628519)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.239319)*sailStates.alpha + (0.039282)*sailStates.beta + (2.444491)*sailStates.p + (-10.896843)*sailStates.q + (0.015089)*sailStates.r + (-0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end