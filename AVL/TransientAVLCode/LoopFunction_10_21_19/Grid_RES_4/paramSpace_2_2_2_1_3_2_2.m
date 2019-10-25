function [aeroForces] = paramSpace_2_2_2_1_3_2_2(sailStates,airStates)

	CL = (4.250310)*sailStates.alpha + (-0.047384)*sailStates.beta + (-2.549494)*sailStates.p + (35.070797)*sailStates.q + (-0.780227)*sailStates.r + (0.011022)*sailStates.de;
	CD = -0.039870;
	CY = (0.215196)*sailStates.alpha + (-0.025640)*sailStates.beta + (-0.356883)*sailStates.p + (1.693497)*sailStates.q + (-0.023451)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.454007)*sailStates.alpha + (0.092850)*sailStates.beta + (-1.213693)*sailStates.p + (10.018501)*sailStates.q + (-0.603103)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-14.931348)*sailStates.alpha + (0.177302)*sailStates.beta + (8.560566)*sailStates.p + (-136.398376)*sailStates.q + (2.632231)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.238804)*sailStates.alpha + (0.007975)*sailStates.beta + (0.674010)*sailStates.p + (-4.027389)*sailStates.q + (0.009920)*sailStates.r + (-0.000534)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end