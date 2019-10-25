function [aeroForces] = paramSpace_1_2_4_2_2_2_3(sailStates,airStates)

	CL = (3.846103)*sailStates.alpha + (-0.065349)*sailStates.beta + (-2.868845)*sailStates.p + (38.511303)*sailStates.q + (-1.128506)*sailStates.r + (0.010966)*sailStates.de;
	CD = 0.065970;
	CY = (-0.004180)*sailStates.alpha + (-0.025265)*sailStates.beta + (-0.247675)*sailStates.p + (0.301044)*sailStates.q + (-0.049233)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.342822)*sailStates.alpha + (0.085944)*sailStates.beta + (-1.497481)*sailStates.p + (13.164776)*sailStates.q + (-0.772264)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-13.727823)*sailStates.alpha + (0.204618)*sailStates.beta + (9.438416)*sailStates.p + (-145.703583)*sailStates.q + (3.753231)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.277389)*sailStates.alpha + (0.020977)*sailStates.beta + (0.308996)*sailStates.p + (-0.703597)*sailStates.q + (-0.033249)*sailStates.r + (-0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end