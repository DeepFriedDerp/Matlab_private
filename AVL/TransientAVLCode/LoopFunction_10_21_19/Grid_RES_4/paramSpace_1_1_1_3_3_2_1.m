function [aeroForces] = paramSpace_1_1_1_3_3_2_1(sailStates,airStates)

	CL = (3.791577)*sailStates.alpha + (-0.238074)*sailStates.beta + (-2.195225)*sailStates.p + (33.029335)*sailStates.q + (-1.015269)*sailStates.r + (0.010224)*sailStates.de;
	CD = 0.069610;
	CY = (0.069796)*sailStates.alpha + (-0.025816)*sailStates.beta + (-0.288261)*sailStates.p + (0.294836)*sailStates.q + (-0.057370)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.178023)*sailStates.alpha + (0.066840)*sailStates.beta + (-0.986172)*sailStates.p + (8.472499)*sailStates.q + (-0.736523)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-13.122948)*sailStates.alpha + (0.942397)*sailStates.beta + (7.118454)*sailStates.p + (-126.097916)*sailStates.q + (3.426960)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (-0.057453)*sailStates.alpha + (0.025278)*sailStates.beta + (0.469521)*sailStates.p + (-1.637297)*sailStates.q + (-0.014309)*sailStates.r + (-0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end