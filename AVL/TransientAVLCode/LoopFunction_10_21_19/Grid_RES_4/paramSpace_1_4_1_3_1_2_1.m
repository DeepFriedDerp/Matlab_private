function [aeroForces] = paramSpace_1_4_1_3_1_2_1(sailStates,airStates)

	CL = (3.699344)*sailStates.alpha + (0.203223)*sailStates.beta + (-2.224101)*sailStates.p + (32.868114)*sailStates.q + (-0.764694)*sailStates.r + (0.010228)*sailStates.de;
	CD = 0.094930;
	CY = (-0.069990)*sailStates.alpha + (-0.027177)*sailStates.beta + (-0.132693)*sailStates.p + (-0.684401)*sailStates.q + (-0.026321)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (0.945510)*sailStates.alpha + (0.136682)*sailStates.beta + (-0.909798)*sailStates.p + (7.233595)*sailStates.q + (-0.511892)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-13.187353)*sailStates.alpha + (-0.827727)*sailStates.beta + (7.453629)*sailStates.p + (-127.495163)*sailStates.q + (2.618160)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.105132)*sailStates.alpha + (0.023253)*sailStates.beta + (0.160068)*sailStates.p + (0.354498)*sailStates.q + (-0.034361)*sailStates.r + (0.000196)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end