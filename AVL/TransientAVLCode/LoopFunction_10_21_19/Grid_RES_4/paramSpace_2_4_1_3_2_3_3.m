function [aeroForces] = paramSpace_2_4_1_3_2_3_3(sailStates,airStates)

	CL = (4.080177)*sailStates.alpha + (-0.046187)*sailStates.beta + (-2.789938)*sailStates.p + (36.055202)*sailStates.q + (0.273807)*sailStates.r + (0.010799)*sailStates.de;
	CD = -0.119530;
	CY = (0.029621)*sailStates.alpha + (-0.024696)*sailStates.beta + (0.200345)*sailStates.p + (0.065300)*sailStates.q + (0.013124)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.292986)*sailStates.alpha + (-0.119242)*sailStates.beta + (-1.357006)*sailStates.p + (10.875484)*sailStates.q + (0.322914)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.518227)*sailStates.alpha + (0.124764)*sailStates.beta + (9.698504)*sailStates.p + (-143.297119)*sailStates.q + (-0.896415)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.072884)*sailStates.alpha + (-0.005171)*sailStates.beta + (-0.547300)*sailStates.p + (2.840889)*sailStates.q + (-0.009115)*sailStates.r + (0.000049)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end