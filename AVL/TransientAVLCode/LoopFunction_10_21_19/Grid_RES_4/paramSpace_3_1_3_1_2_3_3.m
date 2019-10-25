function [aeroForces] = paramSpace_3_1_3_1_2_3_3(sailStates,airStates)

	CL = (6.095397)*sailStates.alpha + (0.614214)*sailStates.beta + (-3.489639)*sailStates.p + (44.538242)*sailStates.q + (2.674240)*sailStates.r + (0.011855)*sailStates.de;
	CD = -2.368940;
	CY = (0.399987)*sailStates.alpha + (-0.025046)*sailStates.beta + (1.168461)*sailStates.p + (-0.221994)*sailStates.q + (-0.076593)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (2.071054)*sailStates.alpha + (-0.391401)*sailStates.beta + (-1.988665)*sailStates.p + (17.725258)*sailStates.q + (2.416314)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-12.398877)*sailStates.alpha + (-2.406778)*sailStates.beta + (11.147801)*sailStates.p + (-160.446365)*sailStates.q + (-9.071938)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-1.529922)*sailStates.alpha + (0.040340)*sailStates.beta + (-2.492862)*sailStates.p + (10.967394)*sailStates.q + (0.013509)*sailStates.r + (0.000306)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end