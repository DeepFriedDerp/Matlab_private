function [aeroForces] = paramSpace_2_4_3_1_2_1_2(sailStates,airStates)

	CL = (6.424687)*sailStates.alpha + (0.576363)*sailStates.beta + (-2.605230)*sailStates.p + (37.353851)*sailStates.q + (-2.548666)*sailStates.r + (0.011420)*sailStates.de;
	CD = -2.325610;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-1.117594)*sailStates.p + (0.000001)*sailStates.q + (-0.073251)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.825840)*sailStates.alpha + (0.719480)*sailStates.beta + (-1.168396)*sailStates.p + (9.809546)*sailStates.q + (-2.290908)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-13.490274)*sailStates.alpha + (-2.215282)*sailStates.beta + (8.197968)*sailStates.p + (-136.150452)*sailStates.q + (8.628516)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.394993)*sailStates.alpha + (0.033266)*sailStates.beta + (2.450894)*sailStates.p + (-10.976057)*sailStates.q + (0.015506)*sailStates.r + (-0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end