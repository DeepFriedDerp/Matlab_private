function [aeroForces] = paramSpace_1_2_2_2_2_1_1(sailStates,airStates)

	CL = (5.776870)*sailStates.alpha + (-0.857530)*sailStates.beta + (-6.117692)*sailStates.p + (55.551655)*sailStates.q + (2.607861)*sailStates.r + (0.011084)*sailStates.de;
	CD = -8.739260;
	CY = (2.915434)*sailStates.alpha + (-0.019036)*sailStates.beta + (1.478217)*sailStates.p + (4.458496)*sailStates.q + (0.195874)*sailStates.r + (0.001014)*sailStates.de;

	Cl = (-1.565653)*sailStates.alpha + (-1.070730)*sailStates.beta + (-4.216292)*sailStates.p + (36.199848)*sailStates.q + (2.846549)*sailStates.r + (0.005556)*sailStates.de;
	Cm = (8.158311)*sailStates.alpha + (3.718315)*sailStates.beta + (22.962780)*sailStates.p + (-240.824493)*sailStates.q + (-8.919393)*sailStates.r + (-0.082717)*sailStates.de;
	Cn = (-10.925189)*sailStates.alpha + (-0.106245)*sailStates.beta + (-3.967556)*sailStates.p + (16.655054)*sailStates.q + (-0.079319)*sailStates.r + (-0.000890)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end