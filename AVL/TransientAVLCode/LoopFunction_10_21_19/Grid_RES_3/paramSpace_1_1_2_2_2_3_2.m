function [aeroForces] = paramSpace_1_1_2_2_2_3_2(sailStates,airStates)

	CL = (4.177742)*sailStates.alpha + (0.048340)*sailStates.beta + (-2.416794)*sailStates.p + (31.797663)*sailStates.q + (0.144936)*sailStates.r + (0.009971)*sailStates.de;
	CD = -0.328450;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.273634)*sailStates.p + (0.000000)*sailStates.q + (0.048249)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.329820)*sailStates.alpha + (-0.128379)*sailStates.beta + (-1.187227)*sailStates.p + (9.505108)*sailStates.q + (0.339621)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-14.985134)*sailStates.alpha + (-0.224806)*sailStates.beta + (8.855376)*sailStates.p + (-134.612778)*sailStates.q + (-0.431123)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.292942)*sailStates.alpha + (-0.030024)*sailStates.beta + (-0.802921)*sailStates.p + (4.289602)*sailStates.q + (-0.044780)*sailStates.r + (0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end