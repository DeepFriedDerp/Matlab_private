function [aeroForces] = paramSpace_4_4_1_3_1_2_1(sailStates,airStates)

	CL = (3.906313)*sailStates.alpha + (-0.176824)*sailStates.beta + (-2.197114)*sailStates.p + (32.885326)*sailStates.q + (0.991240)*sailStates.r + (0.010481)*sailStates.de;
	CD = 0.035200;
	CY = (-0.065003)*sailStates.alpha + (-0.023940)*sailStates.beta + (0.245434)*sailStates.p + (-0.294837)*sailStates.q + (-0.048788)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.022996)*sailStates.alpha + (-0.169777)*sailStates.beta + (-0.892760)*sailStates.p + (7.277953)*sailStates.q + (0.648515)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-13.711756)*sailStates.alpha + (0.549743)*sailStates.beta + (7.145771)*sailStates.p + (-126.097916)*sailStates.q + (-3.289626)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.109746)*sailStates.alpha + (0.022263)*sailStates.beta + (-0.423763)*sailStates.p + (1.840082)*sailStates.q + (-0.009718)*sailStates.r + (0.000125)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end