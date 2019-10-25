function [aeroForces] = paramSpace_2_2_1_3_1_1_1(sailStates,airStates)

	CL = (4.170513)*sailStates.alpha + (-0.077296)*sailStates.beta + (-2.328133)*sailStates.p + (33.638729)*sailStates.q + (-0.834287)*sailStates.r + (0.011030)*sailStates.de;
	CD = -0.137460;
	CY = (-0.037303)*sailStates.alpha + (-0.024716)*sailStates.beta + (-0.315208)*sailStates.p + (-0.563442)*sailStates.q + (-0.020600)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.135790)*sailStates.alpha + (0.162421)*sailStates.beta + (-1.020114)*sailStates.p + (8.214461)*sailStates.q + (-0.741700)*sailStates.r + (0.000057)*sailStates.de;
	Cm = (-14.128768)*sailStates.alpha + (0.326518)*sailStates.beta + (7.795372)*sailStates.p + (-130.282166)*sailStates.q + (2.865526)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (-0.126113)*sailStates.alpha + (0.011723)*sailStates.beta + (0.652992)*sailStates.p + (-2.246025)*sailStates.q + (-0.001819)*sailStates.r + (0.000124)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end