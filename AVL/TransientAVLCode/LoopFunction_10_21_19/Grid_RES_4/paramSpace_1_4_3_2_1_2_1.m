function [aeroForces] = paramSpace_1_4_3_2_1_2_1(sailStates,airStates)

	CL = (3.751076)*sailStates.alpha + (0.145682)*sailStates.beta + (-2.096459)*sailStates.p + (31.562397)*sailStates.q + (-0.625444)*sailStates.r + (0.010338)*sailStates.de;
	CD = 0.060850;
	CY = (-0.121946)*sailStates.alpha + (-0.028041)*sailStates.beta + (-0.044844)*sailStates.p + (-1.057314)*sailStates.q + (-0.008958)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (0.855940)*sailStates.alpha + (0.097890)*sailStates.beta + (-0.803055)*sailStates.p + (6.134165)*sailStates.q + (-0.364792)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-13.570002)*sailStates.alpha + (-0.509156)*sailStates.beta + (7.121588)*sailStates.p + (-124.043571)*sailStates.q + (2.122850)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.159757)*sailStates.alpha + (0.018038)*sailStates.beta + (0.014646)*sailStates.p + (1.011368)*sailStates.q + (-0.037852)*sailStates.r + (0.000294)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end