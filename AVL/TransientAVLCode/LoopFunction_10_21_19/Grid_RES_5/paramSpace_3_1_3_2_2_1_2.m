function [aeroForces] = paramSpace_3_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.240223)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.737133)*sailStates.p + (38.737774)*sailStates.q + (-1.596488)*sailStates.r + (0.011232)*sailStates.de;
	CD = -0.164440;
	CY = (0.024680)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.528577)*sailStates.p + (0.546499)*sailStates.q + (-0.093183)*sailStates.r + (0.000117)*sailStates.de;

	Cl = (1.453021)*sailStates.alpha + (0.242487)*sailStates.beta + (-1.350381)*sailStates.p + (11.984420)*sailStates.q + (-1.242413)*sailStates.r + (0.000588)*sailStates.de;
	Cm = (-13.439198)*sailStates.alpha + (0.000000)*sailStates.beta + (8.558313)*sailStates.p + (-140.819473)*sailStates.q + (5.319932)*sailStates.r + (-0.068914)*sailStates.de;
	Cn = (0.137044)*sailStates.alpha + (0.042757)*sailStates.beta + (0.983042)*sailStates.p + (-4.111434)*sailStates.q + (-0.003805)*sailStates.r + (-0.000248)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end