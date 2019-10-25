function [aeroForces] = paramSpace_4_1_1_3_1_3_2(sailStates,airStates)

	CL = (4.316174)*sailStates.alpha + (0.343694)*sailStates.beta + (-2.497838)*sailStates.p + (37.351170)*sailStates.q + (1.752735)*sailStates.r + (0.011059)*sailStates.de;
	CD = -0.251200;
	CY = (-0.065930)*sailStates.alpha + (-0.026192)*sailStates.beta + (0.579343)*sailStates.p + (-0.489617)*sailStates.q + (-0.115186)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.469234)*sailStates.alpha + (-0.152655)*sailStates.beta + (-1.208764)*sailStates.p + (11.062527)*sailStates.q + (1.362698)*sailStates.r + (0.000422)*sailStates.de;
	Cm = (-13.028944)*sailStates.alpha + (-1.181976)*sailStates.beta + (7.523643)*sailStates.p + (-133.122253)*sailStates.q + (-5.795113)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (0.019174)*sailStates.alpha + (0.054747)*sailStates.beta + (-1.118023)*sailStates.p + (4.746593)*sailStates.q + (-0.001184)*sailStates.r + (0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end