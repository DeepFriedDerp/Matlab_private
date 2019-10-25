function [aeroForces] = paramSpace_1_2_3_2_2_1_2(sailStates,airStates)

	CL = (4.536573)*sailStates.alpha + (-0.144591)*sailStates.beta + (-2.557717)*sailStates.p + (38.860111)*sailStates.q + (-2.004857)*sailStates.r + (0.011393)*sailStates.de;
	CD = -0.488730;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.683138)*sailStates.p + (-0.000001)*sailStates.q + (-0.135885)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.417399)*sailStates.alpha + (0.297574)*sailStates.beta + (-1.203452)*sailStates.p + (11.055272)*sailStates.q + (-1.617218)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-12.409507)*sailStates.alpha + (0.528626)*sailStates.beta + (7.507618)*sailStates.p + (-134.847153)*sailStates.q + (6.651653)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.008575)*sailStates.alpha + (0.068326)*sailStates.beta + (1.360823)*sailStates.p + (-5.417227)*sailStates.q + (-0.003404)*sailStates.r + (-0.000119)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end