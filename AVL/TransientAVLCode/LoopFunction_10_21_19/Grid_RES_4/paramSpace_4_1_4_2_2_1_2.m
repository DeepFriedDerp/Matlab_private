function [aeroForces] = paramSpace_4_1_4_2_2_1_2(sailStates,airStates)

	CL = (4.017460)*sailStates.alpha + (-0.003194)*sailStates.beta + (-2.383070)*sailStates.p + (31.483610)*sailStates.q + (-0.031496)*sailStates.r + (0.009636)*sailStates.de;
	CD = -0.264790;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.227160)*sailStates.p + (-0.000000)*sailStates.q + (0.045185)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.310308)*sailStates.alpha + (0.112221)*sailStates.beta + (-1.176475)*sailStates.p + (9.477579)*sailStates.q + (-0.231913)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-14.554838)*sailStates.alpha + (-0.025362)*sailStates.beta + (8.763592)*sailStates.p + (-133.820877)*sailStates.q + (0.000414)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.308604)*sailStates.alpha + (-0.030724)*sailStates.beta + (0.737191)*sailStates.p + (-4.207246)*sailStates.q + (-0.054181)*sailStates.r + (-0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end