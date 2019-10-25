function [aeroForces] = paramSpace_1_2_3_3_1_1_3(sailStates,airStates)

	CL = (4.094281)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.814172)*sailStates.p + (39.315502)*sailStates.q + (-1.491227)*sailStates.r + (0.011401)*sailStates.de;
	CD = -0.130950;
	CY = (-0.089904)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.432267)*sailStates.p + (-0.318253)*sailStates.q + (-0.076251)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.296232)*sailStates.alpha + (0.228831)*sailStates.beta + (-1.404679)*sailStates.p + (12.389622)*sailStates.q + (-1.155219)*sailStates.r + (0.000702)*sailStates.de;
	Cm = (-13.188401)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.916962)*sailStates.p + (-143.204193)*sailStates.q + (4.966131)*sailStates.r + (-0.069165)*sailStates.de;
	Cn = (0.280665)*sailStates.alpha + (0.040349)*sailStates.beta + (0.791160)*sailStates.p + (-2.629015)*sailStates.q + (-0.020684)*sailStates.r + (-0.000001)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end