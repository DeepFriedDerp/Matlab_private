function [aeroForces] = paramSpace_1_2_4_3_1_3_3(sailStates,airStates)

	CL = (4.013422)*sailStates.alpha + (-0.005834)*sailStates.beta + (-2.696552)*sailStates.p + (34.935791)*sailStates.q + (-0.287187)*sailStates.r + (0.010434)*sailStates.de;
	CD = -0.119230;
	CY = (-0.018498)*sailStates.alpha + (-0.024693)*sailStates.beta + (0.150036)*sailStates.p + (-0.294836)*sailStates.q + (0.029812)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.353671)*sailStates.alpha + (-0.070288)*sailStates.beta + (-1.378407)*sailStates.p + (11.443185)*sailStates.q + (-0.011198)*sailStates.r + (0.000742)*sailStates.de;
	Cm = (-14.822566)*sailStates.alpha + (-0.018972)*sailStates.beta + (9.596529)*sailStates.p + (-142.570129)*sailStates.q + (0.993297)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (0.245891)*sailStates.alpha + (-0.015379)*sailStates.beta + (-0.557533)*sailStates.p + (3.529996)*sailStates.q + (-0.058869)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end