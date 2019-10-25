function [aeroForces] = paramSpace_3_1_4_3_2_1_3(sailStates,airStates)

	CL = (4.080176)*sailStates.alpha + (-0.046187)*sailStates.beta + (-2.789938)*sailStates.p + (36.055202)*sailStates.q + (-0.273807)*sailStates.r + (0.010799)*sailStates.de;
	CD = -0.119530;
	CY = (-0.029621)*sailStates.alpha + (-0.024876)*sailStates.beta + (-0.200345)*sailStates.p + (-0.065300)*sailStates.q + (0.013124)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.433475)*sailStates.alpha + (0.086294)*sailStates.beta + (-1.454694)*sailStates.p + (12.084049)*sailStates.q + (-0.316384)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.518227)*sailStates.alpha + (0.124764)*sailStates.beta + (9.698505)*sailStates.p + (-143.297119)*sailStates.q + (0.896416)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (-0.055137)*sailStates.alpha + (-0.008301)*sailStates.beta + (0.553703)*sailStates.p + (-2.920102)*sailStates.q + (-0.009543)*sailStates.r + (-0.000049)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end