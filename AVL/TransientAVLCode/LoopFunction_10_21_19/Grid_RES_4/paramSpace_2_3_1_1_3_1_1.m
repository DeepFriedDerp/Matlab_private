function [aeroForces] = paramSpace_2_3_1_1_3_1_1(sailStates,airStates)

	CL = (7.350400)*sailStates.alpha + (0.222292)*sailStates.beta + (-1.722651)*sailStates.p + (30.578386)*sailStates.q + (-2.892878)*sailStates.r + (0.011130)*sailStates.de;
	CD = -2.984780;
	CY = (0.706588)*sailStates.alpha + (-0.024296)*sailStates.beta + (-1.385581)*sailStates.p + (1.471506)*sailStates.q + (-0.090971)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (2.200654)*sailStates.alpha + (0.694043)*sailStates.beta + (-0.476603)*sailStates.p + (3.611078)*sailStates.q + (-2.607881)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-13.949156)*sailStates.alpha + (-0.883167)*sailStates.beta + (5.111051)*sailStates.p + (-112.102478)*sailStates.q + (9.812455)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-2.701649)*sailStates.alpha + (0.039238)*sailStates.beta + (3.029150)*sailStates.p + (-14.718324)*sailStates.q + (0.029530)*sailStates.r + (-0.000617)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end