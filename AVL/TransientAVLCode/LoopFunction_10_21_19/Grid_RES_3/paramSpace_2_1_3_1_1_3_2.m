function [aeroForces] = paramSpace_2_1_3_1_1_3_2(sailStates,airStates)

	CL = (7.487295)*sailStates.alpha + (0.540698)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (2.674317)*sailStates.r + (0.010964)*sailStates.de;
	CD = -2.939140;
	CY = (-0.210700)*sailStates.alpha + (-0.025257)*sailStates.beta + (1.347142)*sailStates.p + (-1.697132)*sailStates.q + (-0.000159)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (2.865498)*sailStates.alpha + (-0.445245)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (2.472545)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-16.311274)*sailStates.alpha + (-2.162035)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (-9.104836)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (0.611676)*sailStates.alpha + (0.000801)*sailStates.beta + (-2.950979)*sailStates.p + (14.554673)*sailStates.q + (-0.000069)*sailStates.r + (0.000716)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end