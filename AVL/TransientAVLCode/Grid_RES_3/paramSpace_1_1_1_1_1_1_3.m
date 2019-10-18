function [aeroForces] = paramSpace_1_1_1_1_1_1_3(sailStates,airStates)

	CL = (13.068194)*sailStates.alpha + (-1.488997)*sailStates.beta + (-2.213002)*sailStates.p + (42.897381)*sailStates.q + (-4.990452)*sailStates.r + (0.012332)*sailStates.de;
	CD = -7.678130;
	CY = (0.785031)*sailStates.alpha + (-0.033774)*sailStates.beta + (-2.238508)*sailStates.p + (2.211855)*sailStates.q + (-0.394920)*sailStates.r + (0.000459)*sailStates.de;

	Cl = (5.180557)*sailStates.alpha + (0.586534)*sailStates.beta + (-0.903660)*sailStates.p + (10.291731)*sailStates.q + (-4.405308)*sailStates.r + (-0.000208)*sailStates.de;
	Cm = (-12.012180)*sailStates.alpha + (5.705942)*sailStates.beta + (3.902251)*sailStates.p + (-118.310722)*sailStates.q + (16.555990)*sailStates.r + (-0.064897)*sailStates.de;
	Cn = (-2.158169)*sailStates.alpha + (0.210045)*sailStates.beta + (4.880650)*sailStates.p + (-23.133413)*sailStates.q + (0.111879)*sailStates.r + (-0.000956)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end