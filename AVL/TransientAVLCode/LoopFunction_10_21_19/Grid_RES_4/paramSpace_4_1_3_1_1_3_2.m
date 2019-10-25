function [aeroForces] = paramSpace_4_1_3_1_1_3_2(sailStates,airStates)

	CL = (7.760062)*sailStates.alpha + (0.796842)*sailStates.beta + (-2.581782)*sailStates.p + (43.243927)*sailStates.q + (3.661340)*sailStates.r + (0.011979)*sailStates.de;
	CD = -3.065810;
	CY = (-0.257469)*sailStates.alpha + (-0.030256)*sailStates.beta + (1.523674)*sailStates.p + (-1.664521)*sailStates.q + (-0.303137)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (3.074952)*sailStates.alpha + (-0.449653)*sailStates.beta + (-1.224450)*sailStates.p + (12.607430)*sailStates.q + (3.131520)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-11.974550)*sailStates.alpha + (-2.994056)*sailStates.beta + (6.062040)*sailStates.p + (-131.445847)*sailStates.q + (-12.091741)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.320761)*sailStates.alpha + (0.151497)*sailStates.beta + (-3.213693)*sailStates.p + (14.878843)*sailStates.q + (0.064821)*sailStates.r + (0.000719)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end