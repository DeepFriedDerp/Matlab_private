function [aeroForces] = paramSpace_1_3_4_1_1_1_3(sailStates,airStates)

	CL = (5.087940)*sailStates.alpha + (0.228340)*sailStates.beta + (-3.553036)*sailStates.p + (50.130501)*sailStates.q + (-3.139856)*sailStates.r + (0.012832)*sailStates.de;
	CD = -1.840440;
	CY = (-0.554513)*sailStates.alpha + (-0.025938)*sailStates.beta + (-1.072332)*sailStates.p + (-1.002336)*sailStates.q + (-0.213408)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.143370)*sailStates.alpha + (0.646224)*sailStates.beta + (-1.931863)*sailStates.p + (18.449604)*sailStates.q + (-2.657196)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (-8.854371)*sailStates.alpha + (-0.835123)*sailStates.beta + (10.038451)*sailStates.p + (-161.102386)*sailStates.q + (10.393692)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (1.774987)*sailStates.alpha + (0.114794)*sailStates.beta + (2.148870)*sailStates.p + (-7.618516)*sailStates.q + (-0.024722)*sailStates.r + (0.000026)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end