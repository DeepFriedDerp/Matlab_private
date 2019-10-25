function [aeroForces] = paramSpace_1_2_1_2_1_3_2(sailStates,airStates)

	CL = (4.217962)*sailStates.alpha + (0.009461)*sailStates.beta + (-2.424239)*sailStates.p + (31.628172)*sailStates.q + (0.217413)*sailStates.r + (0.009793)*sailStates.de;
	CD = -0.369100;
	CY = (-0.086537)*sailStates.alpha + (-0.024093)*sailStates.beta + (0.345453)*sailStates.p + (-0.756270)*sailStates.q + (0.068796)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.393346)*sailStates.alpha + (-0.137910)*sailStates.beta + (-1.167799)*sailStates.p + (9.118137)*sailStates.q + (0.391671)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-15.093301)*sailStates.alpha + (-0.018729)*sailStates.beta + (9.084532)*sailStates.p + (-135.926239)*sailStates.q + (-0.599274)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (0.436951)*sailStates.alpha + (-0.032292)*sailStates.beta + (-0.981834)*sailStates.p + (5.844031)*sailStates.q + (-0.071534)*sailStates.r + (0.000312)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end