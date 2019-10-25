function [aeroForces] = paramSpace_4_3_4_2_1_3_3(sailStates,airStates)

	CL = (4.726564)*sailStates.alpha + (-0.174777)*sailStates.beta + (-2.921245)*sailStates.p + (42.385002)*sailStates.q + (2.372265)*sailStates.r + (0.011411)*sailStates.de;
	CD = -0.639480;
	CY = (0.002841)*sailStates.alpha + (-0.023742)*sailStates.beta + (0.880199)*sailStates.p + (-1.057315)*sailStates.q + (-0.175196)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.775785)*sailStates.alpha + (-0.450796)*sailStates.beta + (-1.475305)*sailStates.p + (13.764926)*sailStates.q + (1.944898)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-12.276396)*sailStates.alpha + (0.671474)*sailStates.beta + (8.479344)*sailStates.p + (-144.624466)*sailStates.q + (-7.898086)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.401765)*sailStates.alpha + (0.077548)*sailStates.beta + (-1.701040)*sailStates.p + (7.318045)*sailStates.q + (0.009714)*sailStates.r + (0.000432)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end