function [aeroForces] = paramSpace_1_4_1_3_3_2_1(sailStates,airStates)

	CL = (3.791577)*sailStates.alpha + (0.238074)*sailStates.beta + (-2.195225)*sailStates.p + (33.029335)*sailStates.q + (-1.015269)*sailStates.r + (0.010224)*sailStates.de;
	CD = 0.069610;
	CY = (0.069796)*sailStates.alpha + (-0.023756)*sailStates.beta + (-0.288261)*sailStates.p + (0.294836)*sailStates.q + (-0.057370)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.029928)*sailStates.alpha + (0.191585)*sailStates.beta + (-0.891815)*sailStates.p + (7.284616)*sailStates.q + (-0.717627)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-13.122949)*sailStates.alpha + (-0.942397)*sailStates.beta + (7.118454)*sailStates.p + (-126.097916)*sailStates.q + (3.426960)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (-0.122847)*sailStates.alpha + (0.026126)*sailStates.beta + (0.488290)*sailStates.p + (-1.873582)*sailStates.q + (-0.010550)*sailStates.r + (-0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end