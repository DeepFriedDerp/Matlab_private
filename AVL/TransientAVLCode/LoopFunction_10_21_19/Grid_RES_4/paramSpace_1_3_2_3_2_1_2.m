function [aeroForces] = paramSpace_1_3_2_3_2_1_2(sailStates,airStates)

	CL = (4.170911)*sailStates.alpha + (0.123562)*sailStates.beta + (-2.529706)*sailStates.p + (37.635674)*sailStates.q + (-1.652000)*sailStates.r + (0.011053)*sailStates.de;
	CD = -0.183480;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.531969)*sailStates.p + (0.000001)*sailStates.q + (-0.105815)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.277107)*sailStates.alpha + (0.301328)*sailStates.beta + (-1.162931)*sailStates.p + (10.324418)*sailStates.q + (-1.299242)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-12.695725)*sailStates.alpha + (-0.465801)*sailStates.beta + (7.734229)*sailStates.p + (-134.847153)*sailStates.q + (5.512404)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.002139)*sailStates.alpha + (0.052866)*sailStates.beta + (1.012035)*sailStates.p + (-3.817628)*sailStates.q + (-0.011154)*sailStates.r + (-0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end