function [aeroForces] = paramSpace_2_4_1_1_1_1_2(sailStates,airStates)

	CL = (5.547910)*sailStates.alpha + (0.558324)*sailStates.beta + (-2.621774)*sailStates.p + (37.293255)*sailStates.q + (-2.123861)*sailStates.r + (0.011363)*sailStates.de;
	CD = -1.841140;
	CY = (-0.219562)*sailStates.alpha + (-0.027130)*sailStates.beta + (-0.873540)*sailStates.p + (-1.693498)*sailStates.q + (-0.057076)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (1.070056)*sailStates.alpha + (0.638594)*sailStates.beta + (-1.178771)*sailStates.p + (9.781470)*sailStates.q + (-1.977036)*sailStates.r + (0.000247)*sailStates.de;
	Cm = (-12.233199)*sailStates.alpha + (-2.278681)*sailStates.beta + (8.385766)*sailStates.p + (-136.946671)*sailStates.q + (7.252676)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (-0.107151)*sailStates.alpha + (0.032731)*sailStates.beta + (1.932607)*sailStates.p + (-7.196429)*sailStates.q + (0.001519)*sailStates.r + (0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end