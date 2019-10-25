function [aeroForces] = paramSpace_1_4_1_1_3_1_1(sailStates,airStates)

	CL = (7.369344)*sailStates.alpha + (0.770000)*sailStates.beta + (-1.729211)*sailStates.p + (36.026367)*sailStates.q + (-3.324895)*sailStates.r + (0.011497)*sailStates.de;
	CD = -3.013560;
	CY = (0.697455)*sailStates.alpha + (-0.021284)*sailStates.beta + (-1.432427)*sailStates.p + (1.002336)*sailStates.q + (-0.285035)*sailStates.r + (0.000207)*sailStates.de;

	Cl = (2.249398)*sailStates.alpha + (0.873313)*sailStates.beta + (-0.430329)*sailStates.p + (4.684787)*sailStates.q + (-2.854012)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-9.944912)*sailStates.alpha + (-2.963574)*sailStates.beta + (3.302935)*sailStates.p + (-107.565659)*sailStates.q + (10.986761)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-2.752724)*sailStates.alpha + (0.116365)*sailStates.beta + (3.173136)*sailStates.p + (-14.953085)*sailStates.q + (0.080310)*sailStates.r + (-0.000472)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end