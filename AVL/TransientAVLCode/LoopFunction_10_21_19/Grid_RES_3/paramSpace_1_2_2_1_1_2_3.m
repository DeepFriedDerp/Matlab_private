function [aeroForces] = paramSpace_1_2_2_1_1_2_3(sailStates,airStates)

	CL = (3.464724)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.406579)*sailStates.p + (42.239285)*sailStates.q + (-0.756650)*sailStates.r + (0.011217)*sailStates.de;
	CD = 0.071560;
	CY = (-0.143388)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.025683)*sailStates.p + (-1.081941)*sailStates.q + (-0.004529)*sailStates.r + (-0.000234)*sailStates.de;

	Cl = (1.245052)*sailStates.alpha + (0.056000)*sailStates.beta + (-1.907066)*sailStates.p + (16.540438)*sailStates.q + (-0.502319)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (-12.685140)*sailStates.alpha + (-0.000000)*sailStates.beta + (11.625034)*sailStates.p + (-161.621323)*sailStates.q + (2.583961)*sailStates.r + (-0.071238)*sailStates.de;
	Cn = (0.406718)*sailStates.alpha + (0.009874)*sailStates.beta + (-0.214096)*sailStates.p + (3.026746)*sailStates.q + (-0.067030)*sailStates.r + (0.000315)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end