function [aeroForces] = paramSpace_9_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.238388)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.786529)*sailStates.p + (36.346569)*sailStates.q + (-0.454775)*sailStates.r + (0.011144)*sailStates.de;
	CD = -0.136730;
	CY = (0.022152)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.282917)*sailStates.p + (0.381223)*sailStates.q + (0.009866)*sailStates.r + (0.000083)*sailStates.de;

	Cl = (1.419082)*sailStates.alpha + (0.126026)*sailStates.beta + (-1.387685)*sailStates.p + (11.312336)*sailStates.q + (-0.467345)*sailStates.r + (0.000635)*sailStates.de;
	Cm = (-14.953632)*sailStates.alpha + (0.000000)*sailStates.beta + (9.626643)*sailStates.p + (-143.525848)*sailStates.q + (1.553267)*sailStates.r + (-0.071036)*sailStates.de;
	Cn = (-0.087085)*sailStates.alpha + (-0.004401)*sailStates.beta + (0.659289)*sailStates.p + (-3.385359)*sailStates.q + (-0.005030)*sailStates.r + (-0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end