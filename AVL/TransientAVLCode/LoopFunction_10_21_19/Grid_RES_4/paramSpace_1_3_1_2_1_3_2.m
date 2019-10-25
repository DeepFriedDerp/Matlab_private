function [aeroForces] = paramSpace_1_3_1_2_1_3_2(sailStates,airStates)

	CL = (4.217962)*sailStates.alpha + (-0.009461)*sailStates.beta + (-2.424239)*sailStates.p + (31.628172)*sailStates.q + (0.217413)*sailStates.r + (0.009793)*sailStates.de;
	CD = -0.369100;
	CY = (-0.086537)*sailStates.alpha + (-0.025859)*sailStates.beta + (0.345453)*sailStates.p + (-0.756270)*sailStates.q + (0.068796)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.342970)*sailStates.alpha + (-0.147663)*sailStates.beta + (-1.136267)*sailStates.p + (8.721169)*sailStates.q + (0.397986)*sailStates.r + (0.000340)*sailStates.de;
	Cm = (-15.093301)*sailStates.alpha + (0.018729)*sailStates.beta + (9.084532)*sailStates.p + (-135.926239)*sailStates.q + (-0.599275)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (0.439871)*sailStates.alpha + (-0.024512)*sailStates.beta + (-0.975561)*sailStates.p + (5.765069)*sailStates.q + (-0.070278)*sailStates.r + (0.000312)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end