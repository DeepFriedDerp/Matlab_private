function [aeroForces] = paramSpace_1_3_3_2_2_3_3(sailStates,airStates)

	CL = (4.102160)*sailStates.alpha + (-0.006835)*sailStates.beta + (-2.790790)*sailStates.p + (34.957932)*sailStates.q + (-0.115023)*sailStates.r + (0.010159)*sailStates.de;
	CD = -0.297190;
	CY = (0.071246)*sailStates.alpha + (-0.024666)*sailStates.beta + (0.206448)*sailStates.p + (0.301043)*sailStates.q + (0.041076)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.350991)*sailStates.alpha + (-0.111528)*sailStates.beta + (-1.441116)*sailStates.p + (11.818929)*sailStates.q + (0.158581)*sailStates.r + (0.000805)*sailStates.de;
	Cm = (-14.796155)*sailStates.alpha + (0.053907)*sailStates.beta + (10.096679)*sailStates.p + (-145.703583)*sailStates.q + (0.443931)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.136495)*sailStates.alpha + (-0.020185)*sailStates.beta + (-0.729221)*sailStates.p + (3.987786)*sailStates.q + (-0.056555)*sailStates.r + (-0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end