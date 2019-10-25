function [aeroForces] = paramSpace_2_3_4_3_3_3_3(sailStates,airStates)

	CL = (4.154727)*sailStates.alpha + (-0.030872)*sailStates.beta + (-2.805260)*sailStates.p + (36.299057)*sailStates.q + (0.168439)*sailStates.r + (0.011057)*sailStates.de;
	CD = -0.117210;
	CY = (0.087374)*sailStates.alpha + (-0.024835)*sailStates.beta + (0.164179)*sailStates.p + (0.563442)*sailStates.q + (0.010820)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.315669)*sailStates.alpha + (-0.108436)*sailStates.beta + (-1.395987)*sailStates.p + (11.358752)*sailStates.q + (0.284982)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.860399)*sailStates.alpha + (0.158318)*sailStates.beta + (9.718374)*sailStates.p + (-144.107040)*sailStates.q + (-0.612262)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (-0.004360)*sailStates.alpha + (-0.006581)*sailStates.beta + (-0.449666)*sailStates.p + (1.781388)*sailStates.q + (-0.005198)*sailStates.r + (-0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end