function [aeroForces] = paramSpace_1_1_4_3_2_3_1(sailStates,airStates)

	CL = (3.939970)*sailStates.alpha + (-0.006201)*sailStates.beta + (-2.161634)*sailStates.p + (30.475380)*sailStates.q + (-0.204624)*sailStates.r + (0.010027)*sailStates.de;
	CD = -0.101790;
	CY = (-0.038337)*sailStates.alpha + (-0.024227)*sailStates.beta + (0.135444)*sailStates.p + (-0.194782)*sailStates.q + (0.026921)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.139311)*sailStates.alpha + (-0.071339)*sailStates.beta + (-0.980369)*sailStates.p + (7.825350)*sailStates.q + (0.049039)*sailStates.r + (0.000127)*sailStates.de;
	Cm = (-14.662847)*sailStates.alpha + (-0.094472)*sailStates.beta + (7.745922)*sailStates.p + (-126.796555)*sailStates.q + (0.710589)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (0.300075)*sailStates.alpha + (-0.017707)*sailStates.beta + (-0.448721)*sailStates.p + (2.601913)*sailStates.q + (-0.040999)*sailStates.r + (0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end