function [aeroForces] = paramSpace_4_4_2_2_2_2_2(sailStates,airStates)

	CL = (3.834591)*sailStates.alpha + (-0.193952)*sailStates.beta + (-2.461630)*sailStates.p + (34.989452)*sailStates.q + (0.974668)*sailStates.r + (0.010517)*sailStates.de;
	CD = 0.062070;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.212819)*sailStates.p + (-0.000000)*sailStates.q + (-0.042332)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.115298)*sailStates.alpha + (-0.166602)*sailStates.beta + (-1.107212)*sailStates.p + (9.236369)*sailStates.q + (0.651165)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-13.581768)*sailStates.alpha + (0.669401)*sailStates.beta + (8.114142)*sailStates.p + (-133.820877)*sailStates.q + (-3.264589)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.086581)*sailStates.alpha + (0.023678)*sailStates.beta + (-0.304682)*sailStates.p + (0.788273)*sailStates.q + (-0.025147)*sailStates.r + (0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end