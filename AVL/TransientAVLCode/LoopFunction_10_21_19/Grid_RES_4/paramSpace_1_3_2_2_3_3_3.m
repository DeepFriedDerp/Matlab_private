function [aeroForces] = paramSpace_1_3_2_2_3_3_3(sailStates,airStates)

	CL = (3.979929)*sailStates.alpha + (0.009032)*sailStates.beta + (-2.767678)*sailStates.p + (35.131428)*sailStates.q + (-0.317597)*sailStates.r + (0.010065)*sailStates.de;
	CD = -0.192250;
	CY = (0.140056)*sailStates.alpha + (-0.023815)*sailStates.beta + (0.071718)*sailStates.p + (1.057312)*sailStates.q + (0.014228)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (1.293471)*sailStates.alpha + (-0.069649)*sailStates.beta + (-1.426838)*sailStates.p + (11.860541)*sailStates.q + (-0.024165)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-14.455277)*sailStates.alpha + (-0.020407)*sailStates.beta + (9.827255)*sailStates.p + (-144.624466)*sailStates.q + (1.121681)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (0.081550)*sailStates.alpha + (-0.013880)*sailStates.beta + (-0.453751)*sailStates.p + (2.255943)*sailStates.q + (-0.038565)*sailStates.r + (-0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end