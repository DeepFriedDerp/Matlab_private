function [aeroForces] = paramSpace_1_4_1_2_3_3_2(sailStates,airStates)

	CL = (3.928283)*sailStates.alpha + (0.023722)*sailStates.beta + (-2.360770)*sailStates.p + (31.608130)*sailStates.q + (-0.162025)*sailStates.r + (0.009633)*sailStates.de;
	CD = -0.182030;
	CY = (0.089790)*sailStates.alpha + (-0.022144)*sailStates.beta + (0.107015)*sailStates.p + (0.756269)*sailStates.q + (0.021205)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.092466)*sailStates.alpha + (-0.074745)*sailStates.beta + (-1.068229)*sailStates.p + (8.329108)*sailStates.q + (0.091920)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-14.333648)*sailStates.alpha + (-0.113922)*sailStates.beta + (8.504733)*sailStates.p + (-132.741791)*sailStates.q + (0.624226)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.176142)*sailStates.alpha + (-0.012681)*sailStates.beta + (-0.464934)*sailStates.p + (2.250208)*sailStates.q + (-0.032033)*sailStates.r + (-0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end