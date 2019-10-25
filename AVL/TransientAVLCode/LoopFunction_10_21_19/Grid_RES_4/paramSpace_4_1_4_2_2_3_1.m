function [aeroForces] = paramSpace_4_1_4_2_2_3_1(sailStates,airStates)

	CL = (4.367172)*sailStates.alpha + (0.450873)*sailStates.beta + (-2.150132)*sailStates.p + (35.385113)*sailStates.q + (1.857562)*sailStates.r + (0.010868)*sailStates.de;
	CD = -0.477960;
	CY = (-0.073684)*sailStates.alpha + (-0.023734)*sailStates.beta + (0.662226)*sailStates.p + (0.301044)*sailStates.q + (-0.131693)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.225941)*sailStates.alpha + (-0.222642)*sailStates.beta + (-0.907350)*sailStates.p + (8.316994)*sailStates.q + (1.536905)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-11.550352)*sailStates.alpha + (-1.766403)*sailStates.beta + (6.176060)*sailStates.p + (-122.964470)*sailStates.q + (-6.199624)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.441376)*sailStates.alpha + (0.069331)*sailStates.beta + (-1.358833)*sailStates.p + (5.276911)*sailStates.q + (0.000122)*sailStates.r + (0.000003)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end