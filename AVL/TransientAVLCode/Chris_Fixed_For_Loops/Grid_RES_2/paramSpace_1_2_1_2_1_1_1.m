function [aeroForces] = paramSpace_1_2_1_2_1_1_1(sailStates,airStates)

	CL = (5.186322)*sailStates.alpha + (-0.694976)*sailStates.beta + (-5.662911)*sailStates.p + (53.030506)*sailStates.q + (2.169165)*sailStates.r + (0.010883)*sailStates.de;
	CD = -6.525520;
	CY = (2.219003)*sailStates.alpha + (-0.018277)*sailStates.beta + (1.251278)*sailStates.p + (3.807845)*sailStates.q + (0.165273)*sailStates.r + (0.000859)*sailStates.de;

	Cl = (-0.689032)*sailStates.alpha + (-0.897012)*sailStates.beta + (-3.827031)*sailStates.p + (32.793503)*sailStates.q + (2.384273)*sailStates.r + (0.004844)*sailStates.de;
	Cm = (2.496597)*sailStates.alpha + (2.954263)*sailStates.beta + (21.120298)*sailStates.p + (-227.555359)*sailStates.q + (-7.361919)*sailStates.r + (-0.080439)*sailStates.de;
	Cn = (-8.038324)*sailStates.alpha + (-0.090489)*sailStates.beta + (-3.407328)*sailStates.p + (14.544106)*sailStates.q + (-0.069990)*sailStates.r + (-0.000717)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end