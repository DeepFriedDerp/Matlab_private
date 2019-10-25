function [aeroForces] = paramSpace_1_2_3_3_2_1_3(sailStates,airStates)

	CL = (4.220617)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.801201)*sailStates.p + (39.387600)*sailStates.q + (-1.617723)*sailStates.r + (0.011398)*sailStates.de;
	CD = -0.187330;
	CY = (-0.033550)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.510726)*sailStates.p + (0.173373)*sailStates.q + (-0.090038)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.399588)*sailStates.alpha + (0.248446)*sailStates.beta + (-1.396609)*sailStates.p + (12.412422)*sailStates.q + (-1.258914)*sailStates.r + (0.000672)*sailStates.de;
	Cm = (-13.312095)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.767063)*sailStates.p + (-142.582367)*sailStates.q + (5.378125)*sailStates.r + (-0.069099)*sailStates.de;
	Cn = (0.226640)*sailStates.alpha + (0.043808)*sailStates.beta + (0.955625)*sailStates.p + (-3.744090)*sailStates.q + (-0.010289)*sailStates.r + (-0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end