function [aeroForces] = paramSpace_2_4_1_3_3_3_3(sailStates,airStates)

	CL = (4.029602)*sailStates.alpha + (-0.028148)*sailStates.beta + (-2.784925)*sailStates.p + (36.082699)*sailStates.q + (0.143708)*sailStates.r + (0.010798)*sailStates.de;
	CD = -0.080620;
	CY = (0.082050)*sailStates.alpha + (-0.024006)*sailStates.beta + (0.119815)*sailStates.p + (0.563442)*sailStates.q + (0.007794)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.254124)*sailStates.alpha + (-0.090791)*sailStates.beta + (-1.353886)*sailStates.p + (10.884185)*sailStates.q + (0.216628)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.439179)*sailStates.alpha + (0.063249)*sailStates.beta + (9.641327)*sailStates.p + (-143.062881)*sailStates.q + (-0.462169)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.016416)*sailStates.alpha + (-0.004811)*sailStates.beta + (-0.381926)*sailStates.p + (1.722351)*sailStates.q + (-0.005177)*sailStates.r + (-0.000106)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end