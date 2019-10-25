function [aeroForces] = paramSpace_15_1_3_2_1_1_1(sailStates,airStates)

	CL = (3.747365)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.163771)*sailStates.p + (31.468151)*sailStates.q + (0.671764)*sailStates.r + (0.009794)*sailStates.de;
	CD = 0.036120;
	CY = (-0.030488)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.063906)*sailStates.p + (-0.199285)*sailStates.q + (-0.015941)*sailStates.r + (-0.000042)*sailStates.de;

	Cl = (1.059126)*sailStates.alpha + (-0.024122)*sailStates.beta + (-0.946197)*sailStates.p + (7.754328)*sailStates.q + (0.341619)*sailStates.r + (0.000027)*sailStates.de;
	Cm = (-13.816426)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.454675)*sailStates.p + (-127.104668)*sailStates.q + (-2.302215)*sailStates.r + (-0.065753)*sailStates.de;
	Cn = (-0.149217)*sailStates.alpha + (0.006014)*sailStates.beta + (0.059049)*sailStates.p + (-0.813608)*sailStates.q + (-0.041085)*sailStates.r + (0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end