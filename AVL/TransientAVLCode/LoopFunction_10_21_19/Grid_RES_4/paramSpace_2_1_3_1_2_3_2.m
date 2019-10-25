function [aeroForces] = paramSpace_2_1_3_1_2_3_2(sailStates,airStates)

	CL = (6.180768)*sailStates.alpha + (0.459577)*sailStates.beta + (-2.489266)*sailStates.p + (32.035439)*sailStates.q + (1.895377)*sailStates.r + (0.010357)*sailStates.de;
	CD = -2.217940;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.982379)*sailStates.p + (-0.000001)*sailStates.q + (0.064389)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.871516)*sailStates.alpha + (-0.363632)*sailStates.beta + (-1.229413)*sailStates.p + (9.613936)*sailStates.q + (1.860782)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-15.514186)*sailStates.alpha + (-1.850005)*sailStates.beta + (9.185297)*sailStates.p + (-136.150452)*sailStates.q + (-6.435208)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.417844)*sailStates.alpha + (-0.035658)*sailStates.beta + (-2.270813)*sailStates.p + (10.526624)*sailStates.q + (-0.021657)*sailStates.r + (0.000185)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end