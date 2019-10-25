function [aeroForces] = paramSpace_4_3_3_2_2_1_2(sailStates,airStates)

	CL = (4.131570)*sailStates.alpha + (0.007158)*sailStates.beta + (-2.402608)*sailStates.p + (31.704079)*sailStates.q + (-0.032176)*sailStates.r + (0.009878)*sailStates.de;
	CD = -0.294100;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.239772)*sailStates.p + (0.000000)*sailStates.q + (0.047694)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.229475)*sailStates.alpha + (0.120859)*sailStates.beta + (-1.122718)*sailStates.p + (8.758354)*sailStates.q + (-0.262538)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.970296)*sailStates.alpha + (-0.033463)*sailStates.beta + (8.835392)*sailStates.p + (-134.847153)*sailStates.q + (0.023519)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.311813)*sailStates.alpha + (-0.021274)*sailStates.beta + (0.743913)*sailStates.p + (-4.055502)*sailStates.q + (-0.051342)*sailStates.r + (-0.000069)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end