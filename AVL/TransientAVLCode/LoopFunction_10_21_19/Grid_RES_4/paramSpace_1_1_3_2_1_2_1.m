function [aeroForces] = paramSpace_1_1_3_2_1_2_1(sailStates,airStates)

	CL = (3.751076)*sailStates.alpha + (-0.145682)*sailStates.beta + (-2.096459)*sailStates.p + (31.562397)*sailStates.q + (-0.625445)*sailStates.r + (0.010338)*sailStates.de;
	CD = 0.060850;
	CY = (-0.121946)*sailStates.alpha + (-0.021531)*sailStates.beta + (-0.044844)*sailStates.p + (-1.057314)*sailStates.q + (-0.008958)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.011283)*sailStates.alpha + (0.026209)*sailStates.beta + (-0.897444)*sailStates.p + (7.322047)*sailStates.q + (-0.383525)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-13.570002)*sailStates.alpha + (0.509155)*sailStates.beta + (7.121588)*sailStates.p + (-124.043571)*sailStates.q + (2.122850)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.208141)*sailStates.alpha + (0.006647)*sailStates.beta + (-0.004129)*sailStates.p + (1.247652)*sailStates.q + (-0.041578)*sailStates.r + (0.000294)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end