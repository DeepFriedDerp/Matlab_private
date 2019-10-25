function [aeroForces] = paramSpace_4_3_4_2_1_2_3(sailStates,airStates)

	CL = (3.858351)*sailStates.alpha + (-0.095280)*sailStates.beta + (-2.844077)*sailStates.p + (38.782673)*sailStates.q + (1.349341)*sailStates.r + (0.010693)*sailStates.de;
	CD = 0.065990;
	CY = (-0.067354)*sailStates.alpha + (-0.023742)*sailStates.beta + (0.411512)*sailStates.p + (-1.057313)*sailStates.q + (-0.081968)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.412240)*sailStates.alpha + (-0.194392)*sailStates.beta + (-1.450883)*sailStates.p + (12.813838)*sailStates.q + (0.996417)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-13.267171)*sailStates.alpha + (0.368265)*sailStates.beta + (9.148094)*sailStates.p + (-144.624466)*sailStates.q + (-4.536056)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.221379)*sailStates.alpha + (0.032548)*sailStates.beta + (-0.634628)*sailStates.p + (2.536603)*sailStates.q + (-0.014664)*sailStates.r + (0.000337)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end