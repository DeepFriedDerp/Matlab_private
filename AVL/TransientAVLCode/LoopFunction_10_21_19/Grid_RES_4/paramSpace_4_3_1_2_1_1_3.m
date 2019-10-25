function [aeroForces] = paramSpace_4_3_1_2_1_1_3(sailStates,airStates)

	CL = (4.075561)*sailStates.alpha + (0.004818)*sailStates.beta + (-2.769286)*sailStates.p + (35.033607)*sailStates.q + (0.299581)*sailStates.r + (0.010243)*sailStates.de;
	CD = -0.234170;
	CY = (-0.145068)*sailStates.alpha + (-0.023962)*sailStates.beta + (-0.100805)*sailStates.p + (-1.057313)*sailStates.q + (0.020165)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.290025)*sailStates.alpha + (0.084932)*sailStates.beta + (-1.427622)*sailStates.p + (11.856123)*sailStates.q + (-0.023519)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-14.849939)*sailStates.alpha + (-0.068890)*sailStates.beta + (9.848080)*sailStates.p + (-144.624466)*sailStates.q + (-1.016988)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.064490)*sailStates.alpha + (-0.016693)*sailStates.beta + (0.497543)*sailStates.p + (-2.278155)*sailStates.q + (-0.038319)*sailStates.r + (0.000277)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end