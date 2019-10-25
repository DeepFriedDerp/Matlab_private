function [aeroForces] = paramSpace_2_1_4_3_3_2_3(sailStates,airStates)

	CL = (4.006324)*sailStates.alpha + (-0.059365)*sailStates.beta + (-2.802750)*sailStates.p + (36.813995)*sailStates.q + (-0.481598)*sailStates.r + (0.011045)*sailStates.de;
	CD = 0.022780;
	CY = (0.054792)*sailStates.alpha + (-0.025209)*sailStates.beta + (-0.143745)*sailStates.p + (0.563442)*sailStates.q + (-0.009362)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.421369)*sailStates.alpha + (0.016640)*sailStates.beta + (-1.457355)*sailStates.p + (12.296664)*sailStates.q + (-0.328246)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.471531)*sailStates.alpha + (0.122784)*sailStates.beta + (9.506726)*sailStates.p + (-143.062866)*sailStates.q + (1.591451)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.022629)*sailStates.alpha + (0.003234)*sailStates.beta + (0.237865)*sailStates.p + (-1.309643)*sailStates.q + (-0.000034)*sailStates.r + (-0.000202)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end