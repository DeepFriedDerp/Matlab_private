function [aeroForces] = paramSpace_2_1_1_3_1_3_2(sailStates,airStates)

	CL = (4.310567)*sailStates.alpha + (0.125648)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (0.770480)*sailStates.r + (0.010964)*sailStates.de;
	CD = -0.210090;
	CY = (-0.061966)*sailStates.alpha + (-0.024706)*sailStates.beta + (0.369942)*sailStates.p + (-0.499210)*sailStates.q + (0.000047)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.443556)*sailStates.alpha + (-0.119170)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (0.684980)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.785193)*sailStates.alpha + (-0.424652)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (-2.587240)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (0.183430)*sailStates.alpha + (-0.000276)*sailStates.beta + (-0.828844)*sailStates.p + (4.255946)*sailStates.q + (-0.000262)*sailStates.r + (0.000228)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end