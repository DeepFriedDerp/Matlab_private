function [aeroForces] = paramSpace_2_1_3_1_3_3_2(sailStates,airStates)

	CL = (5.532752)*sailStates.alpha + (0.431128)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (1.785481)*sailStates.r + (0.010964)*sailStates.de;
	CD = -1.800290;
	CY = (0.210641)*sailStates.alpha + (-0.024405)*sailStates.beta + (0.797202)*sailStates.p + (1.697130)*sailStates.q + (0.000159)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.220150)*sailStates.alpha + (-0.360284)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (1.746894)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-13.525566)*sailStates.alpha + (-1.786664)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (-6.125938)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (0.062899)*sailStates.alpha + (-0.000454)*sailStates.beta + (-1.825474)*sailStates.p + (6.945596)*sailStates.q + (-0.000537)*sailStates.r + (-0.000344)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end