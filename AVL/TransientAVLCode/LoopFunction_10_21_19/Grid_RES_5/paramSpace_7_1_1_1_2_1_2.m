function [aeroForces] = paramSpace_7_1_1_1_2_1_2(sailStates,airStates)

	CL = (5.174735)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.101372)*sailStates.p + (39.964001)*sailStates.q + (-1.764368)*sailStates.r + (0.011498)*sailStates.de;
	CD = -0.992370;
	CY = (-0.043315)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.839150)*sailStates.p + (1.046667)*sailStates.q + (-0.029414)*sailStates.r + (0.000228)*sailStates.de;

	Cl = (1.956906)*sailStates.alpha + (0.377207)*sailStates.beta + (-1.633641)*sailStates.p + (13.877584)*sailStates.q + (-1.595708)*sailStates.r + (0.001016)*sailStates.de;
	Cm = (-14.622369)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.317337)*sailStates.p + (-151.326889)*sailStates.q + (6.015694)*sailStates.r + (-0.071886)*sailStates.de;
	Cn = (0.340156)*sailStates.alpha + (0.013172)*sailStates.beta + (1.780623)*sailStates.p + (-8.541090)*sailStates.q + (0.008274)*sailStates.r + (-0.000444)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end