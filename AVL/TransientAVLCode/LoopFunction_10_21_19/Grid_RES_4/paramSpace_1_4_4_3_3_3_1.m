function [aeroForces] = paramSpace_1_4_4_3_3_3_1(sailStates,airStates)

	CL = (3.911536)*sailStates.alpha + (0.023641)*sailStates.beta + (-2.147176)*sailStates.p + (30.556065)*sailStates.q + (-0.330019)*sailStates.r + (0.010025)*sailStates.de;
	CD = -0.070050;
	CY = (0.029151)*sailStates.alpha + (-0.023940)*sailStates.beta + (0.057620)*sailStates.p + (0.294836)*sailStates.q + (0.011493)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (0.955981)*sailStates.alpha + (-0.023540)*sailStates.beta + (-0.876970)*sailStates.p + (6.662978)*sailStates.q + (-0.035214)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-14.527729)*sailStates.alpha + (0.036932)*sailStates.beta + (7.578186)*sailStates.p + (-126.097916)*sailStates.q + (1.115731)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.169320)*sailStates.alpha + (-0.004731)*sailStates.beta + (-0.265771)*sailStates.p + (1.251607)*sailStates.q + (-0.025536)*sailStates.r + (-0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end