function [aeroForces] = paramSpace_4_1_4_3_1_1_1(sailStates,airStates)

	CL = (3.773643)*sailStates.alpha + (0.084256)*sailStates.beta + (-2.145329)*sailStates.p + (30.700066)*sailStates.q + (0.353844)*sailStates.r + (0.009768)*sailStates.de;
	CD = -0.011530;
	CY = (-0.033944)*sailStates.alpha + (-0.025816)*sailStates.beta + (-0.014793)*sailStates.p + (-0.294836)*sailStates.q + (0.002911)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.117805)*sailStates.alpha + (0.040275)*sailStates.beta + (-0.970380)*sailStates.p + (7.857523)*sailStates.q + (0.123233)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-13.938921)*sailStates.alpha + (-0.355722)*sailStates.beta + (7.550868)*sailStates.p + (-126.097916)*sailStates.q + (-1.253067)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (-0.181612)*sailStates.alpha + (-0.007640)*sailStates.beta + (0.220023)*sailStates.p + (-1.454392)*sailStates.q + (-0.030072)*sailStates.r + (0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end