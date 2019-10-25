function [aeroForces] = paramSpace_3_3_2_1_3_3_2(sailStates,airStates)

	CL = (5.592205)*sailStates.alpha + (-0.172262)*sailStates.beta + (-2.641810)*sailStates.p + (37.526398)*sailStates.q + (2.108799)*sailStates.r + (0.011595)*sailStates.de;
	CD = -1.801310;
	CY = (0.221218)*sailStates.alpha + (-0.025520)*sailStates.beta + (0.844312)*sailStates.p + (1.693499)*sailStates.q + (-0.055399)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.150214)*sailStates.alpha + (-0.535970)*sailStates.beta + (-1.220724)*sailStates.p + (10.256788)*sailStates.q + (1.933314)*sailStates.r + (0.000339)*sailStates.de;
	Cm = (-12.602988)*sailStates.alpha + (0.670834)*sailStates.beta + (8.459041)*sailStates.p + (-137.990799)*sailStates.q + (-7.160079)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.061802)*sailStates.alpha + (0.031841)*sailStates.beta + (-1.887199)*sailStates.p + (7.148810)*sailStates.q + (0.002309)*sailStates.r + (-0.000316)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end