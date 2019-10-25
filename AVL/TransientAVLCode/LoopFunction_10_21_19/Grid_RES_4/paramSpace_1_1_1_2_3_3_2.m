function [aeroForces] = paramSpace_1_1_1_2_3_3_2(sailStates,airStates)

	CL = (3.928283)*sailStates.alpha + (-0.023722)*sailStates.beta + (-2.360770)*sailStates.p + (31.608130)*sailStates.q + (-0.162025)*sailStates.r + (0.009633)*sailStates.de;
	CD = -0.182030;
	CY = (0.089790)*sailStates.alpha + (-0.027429)*sailStates.beta + (0.107015)*sailStates.p + (0.756269)*sailStates.q + (0.021205)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.242177)*sailStates.alpha + (-0.095064)*sailStates.beta + (-1.162587)*sailStates.p + (9.516988)*sailStates.q + (0.073024)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-14.333648)*sailStates.alpha + (0.113922)*sailStates.beta + (8.504733)*sailStates.p + (-132.741776)*sailStates.q + (0.624227)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.183249)*sailStates.alpha + (-0.021096)*sailStates.beta + (-0.483703)*sailStates.p + (2.486492)*sailStates.q + (-0.035792)*sailStates.r + (-0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end