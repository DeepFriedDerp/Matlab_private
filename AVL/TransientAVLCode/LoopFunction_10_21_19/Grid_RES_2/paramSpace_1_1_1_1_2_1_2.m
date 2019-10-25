function [aeroForces] = paramSpace_1_1_1_1_2_1_2(sailStates,airStates)

	CL = (5.208168)*sailStates.alpha + (-0.342387)*sailStates.beta + (-3.076228)*sailStates.p + (42.343330)*sailStates.q + (-2.343829)*sailStates.r + (0.011630)*sailStates.de;
	CD = -1.035790;
	CY = (-0.038712)*sailStates.alpha + (-0.026820)*sailStates.beta + (-0.962966)*sailStates.p + (1.226113)*sailStates.q + (-0.126864)*sailStates.r + (0.000264)*sailStates.de;

	Cl = (2.050914)*sailStates.alpha + (0.325110)*sailStates.beta + (-1.640259)*sailStates.p + (14.923271)*sailStates.q + (-1.998136)*sailStates.r + (0.001049)*sailStates.de;
	Cm = (-13.265732)*sailStates.alpha + (1.322266)*sailStates.beta + (9.373259)*sailStates.p + (-148.931046)*sailStates.q + (7.879900)*sailStates.r + (-0.070142)*sailStates.de;
	Cn = (0.567073)*sailStates.alpha + (0.060172)*sailStates.beta + (1.933245)*sailStates.p + (-8.813377)*sailStates.q + (0.019856)*sailStates.r + (-0.000515)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end