function [aeroForces] = paramSpace_1_2_4_1_3_1_1(sailStates,airStates)

	CL = (7.464440)*sailStates.alpha + (-0.236872)*sailStates.beta + (-1.749560)*sailStates.p + (36.152050)*sailStates.q + (-3.310657)*sailStates.r + (0.011921)*sailStates.de;
	CD = -2.965890;
	CY = (0.682911)*sailStates.alpha + (-0.025938)*sailStates.beta + (-1.391684)*sailStates.p + (1.002334)*sailStates.q + (-0.276716)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (2.335388)*sailStates.alpha + (0.586155)*sailStates.beta + (-0.502917)*sailStates.p + (5.545826)*sailStates.q + (-2.803985)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-10.706869)*sailStates.alpha + (0.862348)*sailStates.beta + (3.388641)*sailStates.p + (-108.591942)*sailStates.q + (10.893771)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-2.575968)*sailStates.alpha + (0.135230)*sailStates.beta + (3.099023)*sailStates.p + (-14.766551)*sailStates.q + (0.078243)*sailStates.r + (-0.000487)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end