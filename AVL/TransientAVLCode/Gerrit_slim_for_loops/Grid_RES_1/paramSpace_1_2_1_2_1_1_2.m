function [aeroForces] = paramSpace_1_2_1_2_1_1_2(sailStates,airStates)

	CL = (6.990037)*sailStates.alpha + (-0.430767)*sailStates.beta + (-2.554205)*sailStates.p + (30.128933)*sailStates.q + (0.143842)*sailStates.r + (0.008949)*sailStates.de;
	CD = -3.725060;
	CY = (1.696794)*sailStates.alpha + (-0.001098)*sailStates.beta + (-0.267353)*sailStates.p + (13.856853)*sailStates.q + (-0.033235)*sailStates.r + (0.002950)*sailStates.de;

	Cl = (-1.032870)*sailStates.alpha + (-0.427331)*sailStates.beta + (-1.333974)*sailStates.p + (10.984817)*sailStates.q + (0.752783)*sailStates.r + (0.000304)*sailStates.de;
	Cm = (-13.859076)*sailStates.alpha + (2.082602)*sailStates.beta + (9.111449)*sailStates.p + (-137.355042)*sailStates.q + (-0.693477)*sailStates.r + (-0.068327)*sailStates.de;
	Cn = (-1.692049)*sailStates.alpha + (-0.071618)*sailStates.beta + (0.035416)*sailStates.p + (-10.035166)*sailStates.q + (0.123211)*sailStates.r + (-0.003927)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end