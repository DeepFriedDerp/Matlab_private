function [aeroForces] = paramSpace_4_1_2_1_3_3_1(sailStates,airStates)

	CL = (5.277262)*sailStates.alpha + (0.610111)*sailStates.beta + (-1.828427)*sailStates.p + (35.383099)*sailStates.q + (2.458203)*sailStates.r + (0.011678)*sailStates.de;
	CD = -1.800190;
	CY = (-0.005166)*sailStates.alpha + (-0.017623)*sailStates.beta + (0.875197)*sailStates.p + (2.326712)*sailStates.q + (-0.174171)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (0.608457)*sailStates.alpha + (-0.373591)*sailStates.beta + (-0.586356)*sailStates.p + (5.694706)*sailStates.q + (2.128294)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-8.460032)*sailStates.alpha + (-2.314666)*sailStates.beta + (4.458680)*sailStates.p + (-112.315697)*sailStates.q + (-8.155340)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (1.299873)*sailStates.alpha + (0.105304)*sailStates.beta + (-1.995752)*sailStates.p + (7.119600)*sailStates.q + (-0.003040)*sailStates.r + (-0.000513)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end