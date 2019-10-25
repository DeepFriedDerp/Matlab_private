function [aeroForces] = paramSpace_1_3_2_2_2_1_3(sailStates,airStates)

	CL = (4.422244)*sailStates.alpha + (0.390076)*sailStates.beta + (-2.945664)*sailStates.p + (41.502792)*sailStates.q + (-2.033309)*sailStates.r + (0.011440)*sailStates.de;
	CD = -0.495320;
	CY = (-0.085373)*sailStates.alpha + (-0.024156)*sailStates.beta + (-0.710339)*sailStates.p + (0.267955)*sailStates.q + (-0.125252)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.453386)*sailStates.alpha + (0.461874)*sailStates.beta + (-1.466730)*sailStates.p + (13.196880)*sailStates.q + (-1.654212)*sailStates.r + (0.000734)*sailStates.de;
	Cm = (-12.371275)*sailStates.alpha + (-1.453040)*sailStates.beta + (8.937477)*sailStates.p + (-145.513718)*sailStates.q + (6.783701)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.385352)*sailStates.alpha + (0.059059)*sailStates.beta + (1.379170)*sailStates.p + (-5.570034)*sailStates.q + (-0.002895)*sailStates.r + (-0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end