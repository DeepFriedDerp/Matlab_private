function [aeroForces] = paramSpace_4_1_2_3_2_2_2(sailStates,airStates)

	CL = (3.834591)*sailStates.alpha + (0.193953)*sailStates.beta + (-2.461630)*sailStates.p + (34.989456)*sailStates.q + (0.974668)*sailStates.r + (0.010517)*sailStates.de;
	CD = 0.062070;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.212819)*sailStates.p + (-0.000000)*sailStates.q + (-0.042332)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.254320)*sailStates.alpha + (-0.040739)*sailStates.beta + (-1.201602)*sailStates.p + (10.424251)*sailStates.q + (0.669897)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-13.581766)*sailStates.alpha + (-0.669401)*sailStates.beta + (8.114141)*sailStates.p + (-133.820877)*sailStates.q + (-3.264589)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.143112)*sailStates.alpha + (0.017565)*sailStates.beta + (-0.285906)*sailStates.p + (0.551989)*sailStates.q + (-0.028873)*sailStates.r + (0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end