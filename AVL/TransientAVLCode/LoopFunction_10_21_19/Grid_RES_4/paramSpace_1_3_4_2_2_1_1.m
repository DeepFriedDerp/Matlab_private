function [aeroForces] = paramSpace_1_3_4_2_2_1_1(sailStates,airStates)

	CL = (4.508966)*sailStates.alpha + (0.130381)*sailStates.beta + (-2.170869)*sailStates.p + (35.509357)*sailStates.q + (-1.841162)*sailStates.r + (0.011291)*sailStates.de;
	CD = -0.475990;
	CY = (0.066262)*sailStates.alpha + (-0.025265)*sailStates.beta + (-0.620986)*sailStates.p + (-0.301044)*sailStates.q + (-0.123554)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.147256)*sailStates.alpha + (0.360537)*sailStates.beta + (-0.854180)*sailStates.p + (7.593261)*sailStates.q + (-1.460342)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-12.348744)*sailStates.alpha + (-0.460767)*sailStates.beta + (6.265015)*sailStates.p + (-123.990753)*sailStates.q + (6.090281)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.503806)*sailStates.alpha + (0.063372)*sailStates.beta + (1.309011)*sailStates.p + (-5.406009)*sailStates.q + (0.003500)*sailStates.r + (-0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end