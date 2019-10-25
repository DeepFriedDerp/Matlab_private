function [aeroForces] = paramSpace_1_2_4_2_2_3_2(sailStates,airStates)

	CL = (4.229048)*sailStates.alpha + (0.020889)*sailStates.beta + (-2.404014)*sailStates.p + (31.606853)*sailStates.q + (0.049081)*sailStates.r + (0.010054)*sailStates.de;
	CD = -0.336600;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.268700)*sailStates.p + (-0.000000)*sailStates.q + (0.053448)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.283287)*sailStates.alpha + (-0.133116)*sailStates.beta + (-1.154975)*sailStates.p + (9.150872)*sailStates.q + (0.303327)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-15.374208)*sailStates.alpha + (-0.122121)*sailStates.beta + (8.854839)*sailStates.p + (-134.847153)*sailStates.q + (-0.121288)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.308549)*sailStates.alpha + (-0.029250)*sailStates.beta + (-0.793728)*sailStates.p + (4.156838)*sailStates.q + (-0.052188)*sailStates.r + (0.000049)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end