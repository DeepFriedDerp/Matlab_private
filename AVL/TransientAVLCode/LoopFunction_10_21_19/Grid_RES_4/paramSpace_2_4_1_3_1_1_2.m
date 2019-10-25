function [aeroForces] = paramSpace_2_4_1_3_1_1_2(sailStates,airStates)

	CL = (4.128321)*sailStates.alpha + (0.235395)*sailStates.beta + (-2.568799)*sailStates.p + (35.480923)*sailStates.q + (-0.866416)*sailStates.r + (0.010985)*sailStates.de;
	CD = -0.138390;
	CY = (-0.062657)*sailStates.alpha + (-0.025475)*sailStates.beta + (-0.325124)*sailStates.p + (-0.498142)*sailStates.q + (-0.021257)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.152722)*sailStates.alpha + (0.236778)*sailStates.beta + (-1.158327)*sailStates.p + (9.306435)*sailStates.q + (-0.763570)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-13.969694)*sailStates.alpha + (-0.990538)*sailStates.beta + (8.597260)*sailStates.p + (-136.384674)*sailStates.q + (2.974580)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (-0.016713)*sailStates.alpha + (0.012109)*sailStates.beta + (0.664110)*sailStates.p + (-2.314279)*sailStates.q + (-0.001921)*sailStates.r + (0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end