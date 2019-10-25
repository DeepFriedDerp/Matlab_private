function [aeroForces] = paramSpace_2_1_1_2_2_1_3(sailStates,airStates)

	CL = (4.447800)*sailStates.alpha + (-0.344174)*sailStates.beta + (-2.975236)*sailStates.p + (39.194016)*sailStates.q + (-1.406895)*sailStates.r + (0.011270)*sailStates.de;
	CD = -0.484420;
	CY = (-0.085762)*sailStates.alpha + (-0.024926)*sailStates.beta + (-0.590647)*sailStates.p + (0.100922)*sailStates.q + (-0.038724)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.570866)*sailStates.alpha + (0.193921)*sailStates.beta + (-1.584376)*sailStates.p + (13.685239)*sailStates.q + (-1.253702)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-13.664716)*sailStates.alpha + (1.404489)*sailStates.beta + (9.803144)*sailStates.p + (-147.195892)*sailStates.q + (4.800380)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.314440)*sailStates.alpha + (0.020044)*sailStates.beta + (1.213641)*sailStates.p + (-5.099526)*sailStates.q + (0.003875)*sailStates.r + (-0.000119)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end