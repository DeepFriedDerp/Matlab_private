function [aeroForces] = paramSpace_4_4_1_3_2_1_1(sailStates,airStates)

	CL = (3.939970)*sailStates.alpha + (-0.006201)*sailStates.beta + (-2.161634)*sailStates.p + (30.475380)*sailStates.q + (0.204624)*sailStates.r + (0.010027)*sailStates.de;
	CD = -0.101790;
	CY = (0.038337)*sailStates.alpha + (-0.025345)*sailStates.beta + (-0.135444)*sailStates.p + (0.194782)*sailStates.q + (0.026921)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (0.981118)*sailStates.alpha + (0.051009)*sailStates.beta + (-0.885963)*sailStates.p + (6.637471)*sailStates.q + (-0.067690)*sailStates.r + (-0.000127)*sailStates.de;
	Cm = (-14.662846)*sailStates.alpha + (-0.094472)*sailStates.beta + (7.745922)*sailStates.p + (-126.796555)*sailStates.q + (-0.710589)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.284886)*sailStates.alpha + (-0.006629)*sailStates.beta + (0.429942)*sailStates.p + (-2.365629)*sailStates.q + (-0.037289)*sailStates.r + (-0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end