function [aeroForces] = paramSpace_1_4_3_1_2_1_1(sailStates,airStates)

	CL = (6.201519)*sailStates.alpha + (0.669385)*sailStates.beta + (-1.779300)*sailStates.p + (35.657314)*sailStates.q + (-2.884373)*sailStates.r + (0.011671)*sailStates.de;
	CD = -2.336610;
	CY = (0.336333)*sailStates.alpha + (-0.026825)*sailStates.beta + (-1.139724)*sailStates.p + (-0.662186)*sailStates.q + (-0.226729)*sailStates.r + (-0.000137)*sailStates.de;

	Cl = (1.229506)*sailStates.alpha + (0.767124)*sailStates.beta + (-0.461395)*sailStates.p + (4.593555)*sailStates.q + (-2.459357)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-9.141404)*sailStates.alpha + (-2.510049)*sailStates.beta + (3.888609)*sailStates.p + (-109.940704)*sailStates.q + (9.531831)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (-2.088189)*sailStates.alpha + (0.108959)*sailStates.beta + (2.572582)*sailStates.p + (-11.143165)*sailStates.q + (0.040813)*sailStates.r + (0.000016)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end