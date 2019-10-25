function [aeroForces] = paramSpace_1_4_2_2_1_1_2(sailStates,airStates)

	CL = (4.193225)*sailStates.alpha + (0.425130)*sailStates.beta + (-2.560421)*sailStates.p + (38.515472)*sailStates.q + (-1.812349)*sailStates.r + (0.011143)*sailStates.de;
	CD = -0.364210;
	CY = (-0.101303)*sailStates.alpha + (-0.027271)*sailStates.beta + (-0.575694)*sailStates.p + (-0.756271)*sailStates.q + (-0.114486)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.098263)*sailStates.alpha + (0.430835)*sailStates.beta + (-1.145183)*sailStates.p + (10.150256)*sailStates.q + (-1.464018)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-11.782475)*sailStates.alpha + (-1.619696)*sailStates.beta + (7.694674)*sailStates.p + (-134.899979)*sailStates.q + (6.050108)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (0.042456)*sailStates.alpha + (0.064270)*sailStates.beta + (1.139201)*sailStates.p + (-3.860068)*sailStates.q + (-0.019383)*sailStates.r + (0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end