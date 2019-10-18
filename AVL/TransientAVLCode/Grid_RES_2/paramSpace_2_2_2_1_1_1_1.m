function [aeroForces] = paramSpace_2_2_2_1_1_1_1(sailStates,airStates)

	CL = (5.240935)*sailStates.alpha + (-4.012505)*sailStates.beta + (-3.448725)*sailStates.p + (47.494823)*sailStates.q + (2.269674)*sailStates.r + (0.010393)*sailStates.de;
	CD = -6.039510;
	CY = (1.779526)*sailStates.alpha + (-0.269636)*sailStates.beta + (0.364505)*sailStates.p + (15.310460)*sailStates.q + (-0.037144)*sailStates.r + (0.002914)*sailStates.de;

	Cl = (-5.543707)*sailStates.alpha + (-1.272461)*sailStates.beta + (-1.672559)*sailStates.p + (14.242901)*sailStates.q + (2.518593)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (6.055732)*sailStates.alpha + (18.329517)*sailStates.beta + (10.682644)*sailStates.p + (-151.312180)*sailStates.q + (-8.074114)*sailStates.r + (-0.055271)*sailStates.de;
	Cn = (-1.856819)*sailStates.alpha + (0.384548)*sailStates.beta + (-1.006094)*sailStates.p + (-8.292835)*sailStates.q + (-0.199303)*sailStates.r + (-0.003832)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end