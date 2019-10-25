function [aeroForces] = paramSpace_9_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.223400)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.786386)*sailStates.p + (36.355480)*sailStates.q + (-0.445662)*sailStates.r + (0.011127)*sailStates.de;
	CD = -0.127290;
	CY = (0.023488)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.267825)*sailStates.p + (0.381223)*sailStates.q + (0.009366)*sailStates.r + (0.000083)*sailStates.de;

	Cl = (1.416456)*sailStates.alpha + (0.118481)*sailStates.beta + (-1.387616)*sailStates.p + (11.312739)*sailStates.q + (-0.443120)*sailStates.r + (0.000635)*sailStates.de;
	Cm = (-14.914412)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.624793)*sailStates.p + (-143.525848)*sailStates.q + (1.500301)*sailStates.r + (-0.071036)*sailStates.de;
	Cn = (-0.092409)*sailStates.alpha + (-0.004137)*sailStates.beta + (0.637036)*sailStates.p + (-3.373783)*sailStates.q + (-0.005122)*sailStates.r + (-0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end