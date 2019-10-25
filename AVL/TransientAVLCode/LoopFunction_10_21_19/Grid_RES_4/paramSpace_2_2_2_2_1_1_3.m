function [aeroForces] = paramSpace_2_2_2_2_1_1_3(sailStates,airStates)

	CL = (4.310073)*sailStates.alpha + (-0.098678)*sailStates.beta + (-3.002793)*sailStates.p + (39.401169)*sailStates.q + (-1.199188)*sailStates.r + (0.011473)*sailStates.de;
	CD = -0.369510;
	CY = (-0.160870)*sailStates.alpha + (-0.024714)*sailStates.beta + (-0.451921)*sailStates.p + (-0.668510)*sailStates.q + (-0.029597)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.375254)*sailStates.alpha + (0.225974)*sailStates.beta + (-1.566001)*sailStates.p + (13.343190)*sailStates.q + (-1.065046)*sailStates.r + (0.000940)*sailStates.de;
	Cm = (-13.690643)*sailStates.alpha + (0.392502)*sailStates.beta + (9.961652)*sailStates.p + (-148.601746)*sailStates.q + (4.084108)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (0.333737)*sailStates.alpha + (0.016539)*sailStates.beta + (0.939057)*sailStates.p + (-3.388611)*sailStates.q + (-0.001610)*sailStates.r + (0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end