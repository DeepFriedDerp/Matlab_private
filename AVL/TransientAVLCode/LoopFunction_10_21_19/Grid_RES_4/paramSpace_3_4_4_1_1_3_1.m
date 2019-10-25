function [aeroForces] = paramSpace_3_4_4_1_1_3_1(sailStates,airStates)

	CL = (7.287280)*sailStates.alpha + (-0.664407)*sailStates.beta + (-1.703120)*sailStates.p + (30.312067)*sailStates.q + (2.890240)*sailStates.r + (0.010963)*sailStates.de;
	CD = -2.984070;
	CY = (-0.704913)*sailStates.alpha + (-0.022750)*sailStates.beta + (1.384835)*sailStates.p + (-1.471504)*sailStates.q + (-0.090922)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (2.125498)*sailStates.alpha + (-0.810314)*sailStates.beta + (-0.434889)*sailStates.p + (3.134248)*sailStates.q + (2.603693)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.734662)*sailStates.alpha + (2.639289)*sailStates.beta + (5.044445)*sailStates.p + (-111.058342)*sailStates.q + (-9.803277)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (2.755122)*sailStates.alpha + (0.034410)*sailStates.beta + (-3.030255)*sailStates.p + (14.742798)*sailStates.q + (0.029700)*sailStates.r + (0.000612)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end