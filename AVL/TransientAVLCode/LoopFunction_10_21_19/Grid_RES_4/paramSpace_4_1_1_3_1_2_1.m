function [aeroForces] = paramSpace_4_1_1_3_1_2_1(sailStates,airStates)

	CL = (3.906313)*sailStates.alpha + (0.176824)*sailStates.beta + (-2.197114)*sailStates.p + (32.885326)*sailStates.q + (0.991240)*sailStates.r + (0.010481)*sailStates.de;
	CD = 0.035200;
	CY = (-0.065003)*sailStates.alpha + (-0.025633)*sailStates.beta + (0.245434)*sailStates.p + (-0.294837)*sailStates.q + (-0.048788)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.173313)*sailStates.alpha + (-0.046915)*sailStates.beta + (-0.987165)*sailStates.p + (8.465835)*sailStates.q + (0.667166)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-13.711756)*sailStates.alpha + (-0.549742)*sailStates.beta + (7.145771)*sailStates.p + (-126.097916)*sailStates.q + (-3.289626)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.049722)*sailStates.alpha + (0.020840)*sailStates.beta + (-0.404985)*sailStates.p + (1.603798)*sailStates.q + (-0.013428)*sailStates.r + (0.000125)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end