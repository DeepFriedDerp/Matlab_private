function [aeroForces] = paramSpace_4_2_1_2_2_3_1(sailStates,airStates)

	CL = (4.508966)*sailStates.alpha + (0.130381)*sailStates.beta + (-2.170869)*sailStates.p + (35.509357)*sailStates.q + (1.841162)*sailStates.r + (0.011291)*sailStates.de;
	CD = -0.475990;
	CY = (-0.066262)*sailStates.alpha + (-0.024687)*sailStates.beta + (0.620986)*sailStates.p + (0.301044)*sailStates.q + (-0.123554)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.195708)*sailStates.alpha + (-0.283380)*sailStates.beta + (-0.885728)*sailStates.p + (7.990226)*sailStates.q + (1.466575)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-12.348744)*sailStates.alpha + (-0.460766)*sailStates.beta + (6.265016)*sailStates.p + (-123.990753)*sailStates.q + (-6.090280)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.464925)*sailStates.alpha + (0.064711)*sailStates.beta + (-1.302736)*sailStates.p + (5.327048)*sailStates.q + (0.002260)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end