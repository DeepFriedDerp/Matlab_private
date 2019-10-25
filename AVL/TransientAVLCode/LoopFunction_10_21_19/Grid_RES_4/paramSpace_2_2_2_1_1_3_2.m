function [aeroForces] = paramSpace_2_2_2_1_1_3_2(sailStates,airStates)

	CL = (7.249442)*sailStates.alpha + (0.166784)*sailStates.beta + (-2.525603)*sailStates.p + (32.224583)*sailStates.q + (2.326530)*sailStates.r + (0.010493)*sailStates.de;
	CD = -2.794080;
	CY = (-0.196023)*sailStates.alpha + (-0.024313)*sailStates.beta + (1.240674)*sailStates.p + (-1.693497)*sailStates.q + (0.081378)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (2.709144)*sailStates.alpha + (-0.500656)*sailStates.beta + (-1.216569)*sailStates.p + (9.257254)*sailStates.q + (2.198612)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-17.319345)*sailStates.alpha + (-0.641796)*sailStates.beta + (9.443034)*sailStates.p + (-137.990799)*sailStates.q + (-7.852759)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.739898)*sailStates.alpha + (-0.038347)*sailStates.beta + (-2.808110)*sailStates.p + (14.289549)*sailStates.q + (-0.034808)*sailStates.r + (0.000728)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end