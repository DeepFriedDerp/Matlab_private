function [aeroForces] = paramSpace_1_3_4_1_3_1_1(sailStates,airStates)

	CL = (7.464440)*sailStates.alpha + (0.236872)*sailStates.beta + (-1.749560)*sailStates.p + (36.152050)*sailStates.q + (-3.310657)*sailStates.r + (0.011921)*sailStates.de;
	CD = -2.965890;
	CY = (0.682911)*sailStates.alpha + (-0.024015)*sailStates.beta + (-1.391684)*sailStates.p + (1.002334)*sailStates.q + (-0.276716)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (2.285290)*sailStates.alpha + (0.724241)*sailStates.beta + (-0.471368)*sailStates.p + (5.148859)*sailStates.q + (-2.797752)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-10.706868)*sailStates.alpha + (-0.862349)*sailStates.beta + (3.388640)*sailStates.p + (-108.591927)*sailStates.q + (10.893770)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-2.645427)*sailStates.alpha + (0.125424)*sailStates.beta + (3.105298)*sailStates.p + (-14.845513)*sailStates.q + (0.079483)*sailStates.r + (-0.000487)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end