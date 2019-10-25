function [aeroForces] = paramSpace_2_3_4_1_1_3_2(sailStates,airStates)

	CL = (7.332174)*sailStates.alpha + (-0.181115)*sailStates.beta + (-2.526091)*sailStates.p + (32.191395)*sailStates.q + (2.343994)*sailStates.r + (0.010554)*sailStates.de;
	CD = -2.854650;
	CY = (-0.196065)*sailStates.alpha + (-0.025401)*sailStates.beta + (1.270650)*sailStates.p + (-1.693499)*sailStates.q + (0.083104)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (2.676002)*sailStates.alpha + (-0.617616)*sailStates.beta + (-1.184164)*sailStates.p + (8.851862)*sailStates.q + (2.248723)*sailStates.r + (0.000339)*sailStates.de;
	Cm = (-17.475807)*sailStates.alpha + (0.733621)*sailStates.beta + (9.449705)*sailStates.p + (-137.990799)*sailStates.q + (-7.954537)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.783735)*sailStates.alpha + (-0.035388)*sailStates.beta + (-2.850224)*sailStates.p + (14.286226)*sailStates.q + (-0.034452)*sailStates.r + (0.000708)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end