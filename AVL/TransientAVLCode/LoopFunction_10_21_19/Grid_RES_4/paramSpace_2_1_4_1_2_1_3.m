function [aeroForces] = paramSpace_2_1_4_1_2_1_3(sailStates,airStates)

	CL = (6.058120)*sailStates.alpha + (-0.569853)*sailStates.beta + (-3.490308)*sailStates.p + (44.504822)*sailStates.q + (-2.653885)*sailStates.r + (0.011917)*sailStates.de;
	CD = -2.312360;
	CY = (-0.388897)*sailStates.alpha + (-0.024953)*sailStates.beta + (-1.138273)*sailStates.p + (0.221998)*sailStates.q + (-0.074583)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (2.070304)*sailStates.alpha + (0.380345)*sailStates.beta + (-1.988970)*sailStates.p + (17.723780)*sailStates.q + (-2.367080)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-12.534136)*sailStates.alpha + (2.129414)*sailStates.beta + (11.155532)*sailStates.p + (-160.446365)*sailStates.q + (8.954001)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (1.491125)*sailStates.alpha + (0.039037)*sailStates.beta + (2.448272)*sailStates.p + (-10.944824)*sailStates.q + (0.013636)*sailStates.r + (-0.000338)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end