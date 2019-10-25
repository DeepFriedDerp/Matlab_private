function [aeroForces] = paramSpace_4_2_1_3_2_1_2(sailStates,airStates)

	CL = (4.015825)*sailStates.alpha + (0.007089)*sailStates.beta + (-2.431306)*sailStates.p + (32.879902)*sailStates.q + (0.312307)*sailStates.r + (0.010306)*sailStates.de;
	CD = -0.090830;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.103067)*sailStates.p + (-0.000000)*sailStates.q + (0.020501)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.235413)*sailStates.alpha + (0.058248)*sailStates.beta + (-1.163605)*sailStates.p + (9.486985)*sailStates.q + (0.031870)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-14.886034)*sailStates.alpha + (0.014968)*sailStates.beta + (8.618505)*sailStates.p + (-134.847153)*sailStates.q + (-1.066846)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.237956)*sailStates.alpha + (-0.012265)*sailStates.beta + (0.416866)*sailStates.p + (-2.467087)*sailStates.q + (-0.043543)*sailStates.r + (-0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end