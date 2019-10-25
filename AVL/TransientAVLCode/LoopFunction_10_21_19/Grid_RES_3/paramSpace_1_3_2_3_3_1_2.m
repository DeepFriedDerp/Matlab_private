function [aeroForces] = paramSpace_1_3_2_3_3_1_2(sailStates,airStates)

	CL = (4.315745)*sailStates.alpha + (0.314243)*sailStates.beta + (-2.517437)*sailStates.p + (37.149414)*sailStates.q + (-1.660355)*sailStates.r + (0.011013)*sailStates.de;
	CD = -0.255090;
	CY = (0.065599)*sailStates.alpha + (-0.023592)*sailStates.beta + (-0.579715)*sailStates.p + (0.491626)*sailStates.q + (-0.102219)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.353551)*sailStates.alpha + (0.362916)*sailStates.beta + (-1.130461)*sailStates.p + (9.860982)*sailStates.q + (-1.309259)*sailStates.r + (0.000188)*sailStates.de;
	Cm = (-13.111920)*sailStates.alpha + (-1.161384)*sailStates.beta + (7.725396)*sailStates.p + (-133.990982)*sailStates.q + (5.539206)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (-0.123831)*sailStates.alpha + (0.045215)*sailStates.beta + (1.134049)*sailStates.p + (-4.917958)*sailStates.q + (0.004253)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end