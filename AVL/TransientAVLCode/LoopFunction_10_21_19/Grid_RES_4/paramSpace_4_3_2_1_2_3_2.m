function [aeroForces] = paramSpace_4_3_2_1_2_3_2(sailStates,airStates)

	CL = (6.543557)*sailStates.alpha + (-0.239879)*sailStates.beta + (-2.650518)*sailStates.p + (43.189888)*sailStates.q + (3.234100)*sailStates.r + (0.012250)*sailStates.de;
	CD = -2.385640;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (1.246472)*sailStates.p + (0.000002)*sailStates.q + (-0.247939)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.934894)*sailStates.alpha + (-0.692675)*sailStates.beta + (-1.201260)*sailStates.p + (11.801456)*sailStates.q + (2.750990)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-10.749178)*sailStates.alpha + (0.893066)*sailStates.beta + (6.703820)*sailStates.p + (-134.847153)*sailStates.q + (-10.692615)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.169723)*sailStates.alpha + (0.121497)*sailStates.beta + (-2.648849)*sailStates.p + (11.243201)*sailStates.q + (0.027210)*sailStates.r + (0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end