function [aeroForces] = paramSpace_3_2_4_2_3_1_3(sailStates,airStates)

	CL = (4.539231)*sailStates.alpha + (-0.051405)*sailStates.beta + (-2.949855)*sailStates.p + (37.002537)*sailStates.q + (-0.809800)*sailStates.r + (0.010952)*sailStates.de;
	CD = -0.494710;
	CY = (-0.000407)*sailStates.alpha + (-0.024667)*sailStates.beta + (-0.486685)*sailStates.p + (0.668511)*sailStates.q + (0.031970)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.657773)*sailStates.alpha + (0.199283)*sailStates.beta + (-1.549207)*sailStates.p + (12.706248)*sailStates.q + (-0.798977)*sailStates.r + (0.000940)*sailStates.de;
	Cm = (-15.037367)*sailStates.alpha + (0.178208)*sailStates.beta + (10.406456)*sailStates.p + (-148.601746)*sailStates.q + (2.702292)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (-0.015134)*sailStates.alpha + (-0.015393)*sailStates.beta + (1.180076)*sailStates.p + (-6.329257)*sailStates.q + (-0.018663)*sailStates.r + (-0.000319)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end