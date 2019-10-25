function [aeroForces] = paramSpace_1_4_3_2_2_2_1(sailStates,airStates)

	CL = (3.785367)*sailStates.alpha + (0.172613)*sailStates.beta + (-2.074139)*sailStates.p + (31.686981)*sailStates.q + (-0.819073)*sailStates.r + (0.010335)*sailStates.de;
	CD = 0.054920;
	CY = (-0.009188)*sailStates.alpha + (-0.025713)*sailStates.beta + (-0.165031)*sailStates.p + (-0.301044)*sailStates.q + (-0.032837)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (0.884351)*sailStates.alpha + (0.140310)*sailStates.beta + (-0.789165)*sailStates.p + (6.173570)*sailStates.q + (-0.523720)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-13.429958)*sailStates.alpha + (-0.597927)*sailStates.beta + (6.862580)*sailStates.p + (-122.964470)*sailStates.q + (2.748256)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.039340)*sailStates.alpha + (0.020733)*sailStates.beta + (0.268197)*sailStates.p + (-0.709369)*sailStates.q + (-0.019621)*sailStates.r + (0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end