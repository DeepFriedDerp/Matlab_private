function [aeroForces] = paramSpace_2_2_1_3_3_3_3(sailStates,airStates)

	CL = (4.090398)*sailStates.alpha + (0.009147)*sailStates.beta + (-2.804456)*sailStates.p + (36.349030)*sailStates.q + (0.141071)*sailStates.r + (0.010964)*sailStates.de;
	CD = -0.080110;
	CY = (0.082506)*sailStates.alpha + (-0.025237)*sailStates.beta + (0.119069)*sailStates.p + (0.563443)*sailStates.q + (0.007745)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.367961)*sailStates.alpha + (-0.079710)*sailStates.beta + (-1.428245)*sailStates.p + (11.764895)*sailStates.q + (0.210258)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.662406)*sailStates.alpha + (-0.019970)*sailStates.beta + (9.707933)*sailStates.p + (-144.107025)*sailStates.q + (-0.452989)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.009344)*sailStates.alpha + (-0.005603)*sailStates.beta + (-0.385170)*sailStates.p + (1.773294)*sailStates.q + (-0.005490)*sailStates.r + (-0.000107)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end