function [aeroForces] = paramSpace_4_3_4_1_3_1_1(sailStates,airStates)

	CL = (6.366724)*sailStates.alpha + (0.131769)*sailStates.beta + (-1.506410)*sailStates.p + (19.883112)*sailStates.q + (-2.024199)*sailStates.r + (0.008573)*sailStates.de;
	CD = -2.587850;
	CY = (0.665456)*sailStates.alpha + (-0.027693)*sailStates.beta + (-1.158635)*sailStates.p + (2.326704)*sailStates.q + (0.230717)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (1.814275)*sailStates.alpha + (0.534783)*sailStates.beta + (-0.424171)*sailStates.p + (0.793714)*sailStates.q + (-2.010693)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-18.097105)*sailStates.alpha + (-0.472812)*sailStates.beta + (7.449582)*sailStates.p + (-113.341965)*sailStates.q + (6.543065)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-2.586404)*sailStates.alpha + (-0.089993)*sailStates.beta + (2.642707)*sailStates.p + (-13.751803)*sailStates.q + (-0.109468)*sailStates.r + (-0.000855)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end