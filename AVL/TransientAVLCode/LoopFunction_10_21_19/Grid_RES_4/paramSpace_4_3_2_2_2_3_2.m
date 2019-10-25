function [aeroForces] = paramSpace_4_3_2_2_2_3_2(sailStates,airStates)

	CL = (4.536573)*sailStates.alpha + (-0.144591)*sailStates.beta + (-2.557717)*sailStates.p + (38.860111)*sailStates.q + (2.004857)*sailStates.r + (0.011393)*sailStates.de;
	CD = -0.488730;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.683138)*sailStates.p + (0.000001)*sailStates.q + (-0.135885)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.374651)*sailStates.alpha + (-0.384505)*sailStates.beta + (-1.171909)*sailStates.p + (10.658304)*sailStates.q + (1.610958)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-12.409507)*sailStates.alpha + (0.528626)*sailStates.beta + (7.507618)*sailStates.p + (-134.847153)*sailStates.q + (-6.651654)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.048055)*sailStates.alpha + (0.067348)*sailStates.beta + (-1.367097)*sailStates.p + (5.496189)*sailStates.q + (-0.002159)*sailStates.r + (0.000119)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end