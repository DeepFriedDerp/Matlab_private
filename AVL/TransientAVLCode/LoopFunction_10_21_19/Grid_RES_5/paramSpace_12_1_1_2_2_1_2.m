function [aeroForces] = paramSpace_12_1_1_2_2_1_2(sailStates,airStates)

	CL = (4.097740)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.720747)*sailStates.p + (35.419178)*sailStates.q + (0.108398)*sailStates.r + (0.010808)*sailStates.de;
	CD = -0.090300;
	CY = (0.020971)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.161005)*sailStates.p + (0.291853)*sailStates.q + (0.022597)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.349131)*sailStates.alpha + (0.068794)*sailStates.beta + (-1.357792)*sailStates.p + (11.097033)*sailStates.q + (-0.091212)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.981417)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.560136)*sailStates.p + (-142.523422)*sailStates.q + (-0.357773)*sailStates.r + (-0.069778)*sailStates.de;
	Cn = (-0.190627)*sailStates.alpha + (-0.009668)*sailStates.beta + (0.505143)*sailStates.p + (-2.981740)*sailStates.q + (-0.031625)*sailStates.r + (-0.000105)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end