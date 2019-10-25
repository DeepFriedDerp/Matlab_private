function [aeroForces] = paramSpace_1_1_2_2_2_3_1(sailStates,airStates)

	CL = (4.126645)*sailStates.alpha + (0.065341)*sailStates.beta + (-2.025917)*sailStates.p + (28.505322)*sailStates.q + (0.284026)*sailStates.r + (0.009792)*sailStates.de;
	CD = -0.345650;
	CY = (-0.085372)*sailStates.alpha + (-0.024156)*sailStates.beta + (0.316389)*sailStates.p + (-0.267956)*sailStates.q + (0.055788)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.112412)*sailStates.alpha + (-0.127325)*sailStates.beta + (-0.866742)*sailStates.p + (6.445578)*sailStates.q + (0.453417)*sailStates.r + (-0.000066)*sailStates.de;
	Cm = (-14.928919)*sailStates.alpha + (-0.282044)*sailStates.beta + (7.582782)*sailStates.p + (-123.711861)*sailStates.q + (-0.894309)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (0.512227)*sailStates.alpha + (-0.031476)*sailStates.beta + (-0.835263)*sailStates.p + (4.360082)*sailStates.q + (-0.040382)*sailStates.r + (0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end