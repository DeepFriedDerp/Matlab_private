function [aeroForces] = paramSpace_1_3_2_2_2_3_2(sailStates,airStates)

	CL = (4.177742)*sailStates.alpha + (-0.048340)*sailStates.beta + (-2.416794)*sailStates.p + (31.797663)*sailStates.q + (0.144936)*sailStates.r + (0.009971)*sailStates.de;
	CD = -0.328450;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.273634)*sailStates.p + (0.000000)*sailStates.q + (0.048249)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.194531)*sailStates.alpha + (-0.146078)*sailStates.beta + (-1.102592)*sailStates.p + (8.444242)*sailStates.q + (0.354544)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-14.985134)*sailStates.alpha + (0.224806)*sailStates.beta + (8.855377)*sailStates.p + (-134.612778)*sailStates.q + (-0.431122)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.301842)*sailStates.alpha + (-0.018370)*sailStates.beta + (-0.787998)*sailStates.p + (4.102542)*sailStates.q + (-0.042149)*sailStates.r + (0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end