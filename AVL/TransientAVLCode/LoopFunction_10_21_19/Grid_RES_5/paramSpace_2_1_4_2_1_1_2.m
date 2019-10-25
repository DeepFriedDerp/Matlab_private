function [aeroForces] = paramSpace_2_1_4_2_1_1_2(sailStates,airStates)

	CL = (4.007617)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.731842)*sailStates.p + (39.019016)*sailStates.q + (-1.568552)*sailStates.r + (0.011246)*sailStates.de;
	CD = -0.068330;
	CY = (-0.070022)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.426314)*sailStates.p + (-0.230434)*sailStates.q + (-0.090641)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.265476)*sailStates.alpha + (0.222289)*sailStates.beta + (-1.347988)*sailStates.p + (12.079175)*sailStates.q + (-1.179428)*sailStates.r + (0.000633)*sailStates.de;
	Cm = (-12.959464)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.531560)*sailStates.p + (-140.986252)*sailStates.q + (5.197579)*sailStates.r + (-0.068102)*sailStates.de;
	Cn = (0.266651)*sailStates.alpha + (0.047249)*sailStates.beta + (0.750219)*sailStates.p + (-2.374717)*sailStates.q + (-0.030567)*sailStates.r + (-0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end