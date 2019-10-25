function [aeroForces] = paramSpace_3_1_1_1_2_1_3(sailStates,airStates)

	CL = (5.872214)*sailStates.alpha + (-0.465595)*sailStates.beta + (-3.374333)*sailStates.p + (39.186420)*sailStates.q + (-1.789999)*sailStates.r + (0.010839)*sailStates.de;
	CD = -2.220530;
	CY = (-0.379273)*sailStates.alpha + (-0.024953)*sailStates.beta + (-0.961701)*sailStates.p + (-0.221996)*sailStates.q + (0.063057)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.978572)*sailStates.alpha + (0.370701)*sailStates.beta + (-1.952289)*sailStates.p + (16.319609)*sailStates.q + (-1.790980)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-14.196883)*sailStates.alpha + (1.935874)*sailStates.beta + (12.142861)*sailStates.p + (-160.446365)*sailStates.q + (6.109727)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (1.097243)*sailStates.alpha + (-0.035561)*sailStates.beta + (2.267023)*sailStates.p + (-10.478642)*sailStates.q + (-0.023237)*sailStates.r + (-0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end