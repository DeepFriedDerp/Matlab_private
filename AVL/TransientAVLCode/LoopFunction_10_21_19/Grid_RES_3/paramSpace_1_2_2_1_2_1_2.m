function [aeroForces] = paramSpace_1_2_2_1_2_1_2(sailStates,airStates)

	CL = (6.554796)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.654637)*sailStates.p + (42.302666)*sailStates.q + (-3.125644)*sailStates.r + (0.012156)*sailStates.de;
	CD = -2.391110;
	CY = (-0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.234570)*sailStates.p + (0.000001)*sailStates.q + (-0.217688)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.954821)*sailStates.alpha + (0.617285)*sailStates.beta + (-1.222739)*sailStates.p + (11.752153)*sailStates.q + (-2.690781)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-11.240790)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.005663)*sailStates.p + (-135.529190)*sailStates.q + (10.398091)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (-0.168035)*sailStates.alpha + (0.108844)*sailStates.beta + (2.624187)*sailStates.p + (-11.180730)*sailStates.q + (0.026274)*sailStates.r + (-0.000220)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end