function [aeroForces] = paramSpace_2_2_4_1_1_3_2(sailStates,airStates)

	CL = (7.332174)*sailStates.alpha + (0.181115)*sailStates.beta + (-2.526091)*sailStates.p + (32.191395)*sailStates.q + (2.343993)*sailStates.r + (0.010554)*sailStates.de;
	CD = -2.854650;
	CY = (-0.196065)*sailStates.alpha + (-0.024552)*sailStates.beta + (1.270650)*sailStates.p + (-1.693499)*sailStates.q + (0.083104)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (2.729244)*sailStates.alpha + (-0.515148)*sailStates.beta + (-1.216816)*sailStates.p + (9.255736)*sailStates.q + (2.246626)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-17.475807)*sailStates.alpha + (-0.733621)*sailStates.beta + (9.449705)*sailStates.p + (-137.990799)*sailStates.q + (-7.954534)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.737558)*sailStates.alpha + (-0.038857)*sailStates.beta + (-2.852364)*sailStates.p + (14.312697)*sailStates.q + (-0.034590)*sailStates.r + (0.000708)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end