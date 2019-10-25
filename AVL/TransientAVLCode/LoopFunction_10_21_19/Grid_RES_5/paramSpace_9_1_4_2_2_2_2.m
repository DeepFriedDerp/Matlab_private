function [aeroForces] = paramSpace_9_1_4_2_2_2_2(sailStates,airStates)

	CL = (4.144003)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.801218)*sailStates.p + (37.050098)*sailStates.q + (0.635946)*sailStates.r + (0.011250)*sailStates.de;
	CD = -0.084440;
	CY = (0.070583)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.255447)*sailStates.p + (0.381223)*sailStates.q + (-0.008880)*sailStates.r + (0.000083)*sailStates.de;

	Cl = (1.333460)*sailStates.alpha + (-0.143155)*sailStates.beta + (-1.392284)*sailStates.p + (11.494184)*sailStates.q + (0.585357)*sailStates.r + (0.000635)*sailStates.de;
	Cm = (-14.462137)*sailStates.alpha + (0.000000)*sailStates.beta + (9.495646)*sailStates.p + (-143.525848)*sailStates.q + (-2.197990)*sailStates.r + (-0.071036)*sailStates.de;
	Cn = (-0.092806)*sailStates.alpha + (0.004999)*sailStates.beta + (-0.524968)*sailStates.p + (1.822132)*sailStates.q + (-0.000772)*sailStates.r + (-0.000082)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end