function [aeroForces] = paramSpace_2_4_2_3_2_1_3(sailStates,airStates)

	CL = (4.197309)*sailStates.alpha + (0.236774)*sailStates.beta + (-2.824251)*sailStates.p + (37.600422)*sailStates.q + (-1.022209)*sailStates.r + (0.011143)*sailStates.de;
	CD = -0.191020;
	CY = (-0.035119)*sailStates.alpha + (-0.024710)*sailStates.beta + (-0.401387)*sailStates.p + (0.065300)*sailStates.q + (-0.026311)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.327622)*sailStates.alpha + (0.263338)*sailStates.beta + (-1.367903)*sailStates.p + (11.287069)*sailStates.q + (-0.874140)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.022921)*sailStates.alpha + (-0.932036)*sailStates.beta + (9.412035)*sailStates.p + (-143.297119)*sailStates.q + (3.474270)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.074753)*sailStates.alpha + (0.012202)*sailStates.beta + (0.815289)*sailStates.p + (-3.438697)*sailStates.q + (0.001983)*sailStates.r + (-0.000085)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end