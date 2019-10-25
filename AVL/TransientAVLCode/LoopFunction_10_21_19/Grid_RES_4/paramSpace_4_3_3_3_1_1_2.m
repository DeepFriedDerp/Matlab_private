function [aeroForces] = paramSpace_4_3_3_3_1_1_2(sailStates,airStates)

	CL = (3.908457)*sailStates.alpha + (-0.026722)*sailStates.beta + (-2.415441)*sailStates.p + (33.057766)*sailStates.q + (0.454609)*sailStates.r + (0.010128)*sailStates.de;
	CD = -0.027320;
	CY = (-0.059921)*sailStates.alpha + (-0.024438)*sailStates.beta + (0.003658)*sailStates.p + (-0.489619)*sailStates.q + (-0.000745)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.170143)*sailStates.alpha + (0.008085)*sailStates.beta + (-1.122357)*sailStates.p + (9.119977)*sailStates.q + (0.175535)*sailStates.r + (0.000256)*sailStates.de;
	Cm = (-14.388309)*sailStates.alpha + (0.092873)*sailStates.beta + (8.431420)*sailStates.p + (-134.148560)*sailStates.q + (-1.569263)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (-0.149086)*sailStates.alpha + (-0.002247)*sailStates.beta + (0.202915)*sailStates.p + (-1.251717)*sailStates.q + (-0.030863)*sailStates.r + (0.000114)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end