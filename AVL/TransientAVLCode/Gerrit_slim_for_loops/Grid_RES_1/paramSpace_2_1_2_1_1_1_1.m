function [aeroForces] = paramSpace_2_1_2_1_1_1_1(sailStates,airStates)

	CL = (5.791837)*sailStates.alpha + (-1.965060)*sailStates.beta + (-3.662412)*sailStates.p + (50.347576)*sailStates.q + (2.230749)*sailStates.r + (0.012648)*sailStates.de;
	CD = -5.602620;
	CY = (1.908904)*sailStates.alpha + (-0.130421)*sailStates.beta + (0.328603)*sailStates.p + (14.893383)*sailStates.q + (-0.035877)*sailStates.r + (0.003152)*sailStates.de;

	Cl = (-4.783983)*sailStates.alpha + (-1.037245)*sailStates.beta + (-1.854003)*sailStates.p + (16.052731)*sailStates.q + (2.439309)*sailStates.r + (0.001578)*sailStates.de;
	Cm = (2.598921)*sailStates.alpha + (8.814101)*sailStates.beta + (11.463374)*sailStates.p + (-163.904495)*sailStates.q + (-7.877917)*sailStates.r + (-0.068162)*sailStates.de;
	Cn = (-2.157252)*sailStates.alpha + (0.218497)*sailStates.beta + (-0.912227)*sailStates.p + (-8.350373)*sailStates.q + (-0.187158)*sailStates.r + (-0.004121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end