function [aeroForces] = paramSpace_5_1_4_2_2_2_1(sailStates,airStates)

	CL = (4.103184)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.311202)*sailStates.p + (32.294846)*sailStates.q + (-0.043093)*sailStates.r + (0.010746)*sailStates.de;
	CD = -0.060880;
	CY = (0.030548)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.102640)*sailStates.p + (0.322047)*sailStates.q + (0.010822)*sailStates.r + (0.000069)*sailStates.de;

	Cl = (1.128257)*sailStates.alpha + (-0.064295)*sailStates.beta + (-1.015699)*sailStates.p + (7.934069)*sailStates.q + (0.122866)*sailStates.r + (0.000048)*sailStates.de;
	Cm = (-14.984324)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.068137)*sailStates.p + (-130.700150)*sailStates.q + (0.118553)*sailStates.r + (-0.069118)*sailStates.de;
	Cn = (0.135321)*sailStates.alpha + (-0.006758)*sailStates.beta + (-0.313333)*sailStates.p + (1.331208)*sailStates.q + (-0.009155)*sailStates.r + (-0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end