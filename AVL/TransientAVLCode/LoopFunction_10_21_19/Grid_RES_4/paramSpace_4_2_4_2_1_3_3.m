function [aeroForces] = paramSpace_4_2_4_2_1_3_3(sailStates,airStates)

	CL = (4.726564)*sailStates.alpha + (0.174777)*sailStates.beta + (-2.921245)*sailStates.p + (42.385006)*sailStates.q + (2.372264)*sailStates.r + (0.011411)*sailStates.de;
	CD = -0.639480;
	CY = (0.002841)*sailStates.alpha + (-0.026211)*sailStates.beta + (0.880199)*sailStates.p + (-1.057315)*sailStates.q + (-0.175196)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.812582)*sailStates.alpha + (-0.344196)*sailStates.beta + (-1.506838)*sailStates.p + (14.161890)*sailStates.q + (1.951212)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-12.276396)*sailStates.alpha + (-0.671474)*sailStates.beta + (8.479346)*sailStates.p + (-144.624481)*sailStates.q + (-7.898084)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.445189)*sailStates.alpha + (0.080586)*sailStates.beta + (-1.694767)*sailStates.p + (7.239084)*sailStates.q + (0.008458)*sailStates.r + (0.000432)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end