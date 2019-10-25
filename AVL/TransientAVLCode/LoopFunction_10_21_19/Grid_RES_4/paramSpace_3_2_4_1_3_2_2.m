function [aeroForces] = paramSpace_3_2_4_1_3_2_2(sailStates,airStates)

	CL = (4.103386)*sailStates.alpha + (0.013581)*sailStates.beta + (-2.583335)*sailStates.p + (34.900368)*sailStates.q + (-0.095679)*sailStates.r + (0.010998)*sailStates.de;
	CD = 0.002960;
	CY = (0.208588)*sailStates.alpha + (-0.024193)*sailStates.beta + (-0.175700)*sailStates.p + (1.693497)*sailStates.q + (0.011695)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.333179)*sailStates.alpha + (0.017377)*sailStates.beta + (-1.234788)*sailStates.p + (9.960095)*sailStates.q + (-0.095611)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-14.843821)*sailStates.alpha + (-0.083387)*sailStates.beta + (8.946034)*sailStates.p + (-137.990799)*sailStates.q + (0.270008)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (-0.324221)*sailStates.alpha + (-0.002499)*sailStates.beta + (0.428298)*sailStates.p + (-3.566246)*sailStates.q + (-0.017039)*sailStates.r + (-0.000538)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end