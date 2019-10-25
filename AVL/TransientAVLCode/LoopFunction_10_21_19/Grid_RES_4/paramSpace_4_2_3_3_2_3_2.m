function [aeroForces] = paramSpace_4_2_3_3_2_3_2(sailStates,airStates)

	CL = (4.170911)*sailStates.alpha + (0.123562)*sailStates.beta + (-2.529706)*sailStates.p + (37.635674)*sailStates.q + (1.652001)*sailStates.r + (0.011053)*sailStates.de;
	CD = -0.183480;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.531969)*sailStates.p + (-0.000001)*sailStates.q + (-0.105815)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.321041)*sailStates.alpha + (-0.229698)*sailStates.beta + (-1.194468)*sailStates.p + (10.721386)*sailStates.q + (1.305529)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-12.695725)*sailStates.alpha + (-0.465801)*sailStates.beta + (7.734229)*sailStates.p + (-134.847153)*sailStates.q + (-5.512404)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.035001)*sailStates.alpha + (0.052762)*sailStates.beta + (-1.005761)*sailStates.p + (3.738666)*sailStates.q + (-0.012404)*sailStates.r + (0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end