function [aeroForces] = paramSpace_2_1_2_2_1_2_2(sailStates,airStates)

	CL = (5.720331)*sailStates.alpha + (-1.903458)*sailStates.beta + (-3.653213)*sailStates.p + (50.023281)*sailStates.q + (2.066610)*sailStates.r + (0.012603)*sailStates.de;
	CD = -5.316250;
	CY = (1.900431)*sailStates.alpha + (-0.132514)*sailStates.beta + (0.241031)*sailStates.p + (15.186661)*sailStates.q + (-0.024203)*sailStates.r + (0.003214)*sailStates.de;

	Cl = (-4.601726)*sailStates.alpha + (-0.984747)*sailStates.beta + (-1.847584)*sailStates.p + (15.907522)*sailStates.q + (2.295114)*sailStates.r + (0.001577)*sailStates.de;
	Cm = (1.783981)*sailStates.alpha + (8.586929)*sailStates.beta + (11.532969)*sailStates.p + (-163.886047)*sailStates.q + (-7.332026)*sailStates.r + (-0.068160)*sailStates.de;
	Cn = (-2.088278)*sailStates.alpha + (0.217931)*sailStates.beta + (-0.724322)*sailStates.p + (-9.414483)*sailStates.q + (-0.193222)*sailStates.r + (-0.004221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end