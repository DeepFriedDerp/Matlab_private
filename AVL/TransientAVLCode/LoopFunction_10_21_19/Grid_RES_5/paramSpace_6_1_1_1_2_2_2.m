function [aeroForces] = paramSpace_6_1_1_1_2_2_2(sailStates,airStates)

	CL = (4.341184)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.030981)*sailStates.p + (37.591862)*sailStates.q + (0.585208)*sailStates.r + (0.010928)*sailStates.de;
	CD = -0.485220;
	CY = (0.204189)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.322106)*sailStates.p + (1.113125)*sailStates.q + (0.022406)*sailStates.r + (0.000242)*sailStates.de;

	Cl = (1.379102)*sailStates.alpha + (-0.206026)*sailStates.beta + (-1.607017)*sailStates.p + (13.254246)*sailStates.q + (0.651713)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.414900)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.634599)*sailStates.p + (-150.805054)*sailStates.q + (-1.962941)*sailStates.r + (-0.071596)*sailStates.de;
	Cn = (-0.210085)*sailStates.alpha + (-0.014407)*sailStates.beta + (-0.876993)*sailStates.p + (3.681143)*sailStates.q + (-0.007947)*sailStates.r + (-0.000216)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end