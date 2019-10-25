function [aeroForces] = paramSpace_1_1_3_2_2_2_1(sailStates,airStates)

	CL = (3.785367)*sailStates.alpha + (-0.172613)*sailStates.beta + (-2.074139)*sailStates.p + (31.686981)*sailStates.q + (-0.819073)*sailStates.r + (0.010335)*sailStates.de;
	CD = 0.054920;
	CY = (-0.009188)*sailStates.alpha + (-0.023859)*sailStates.beta + (-0.165031)*sailStates.p + (-0.301044)*sailStates.q + (-0.032837)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.039689)*sailStates.alpha + (0.043369)*sailStates.beta + (-0.883554)*sailStates.p + (7.361454)*sailStates.q + (-0.542453)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-13.429958)*sailStates.alpha + (0.597927)*sailStates.beta + (6.862580)*sailStates.p + (-122.964470)*sailStates.q + (2.748256)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.017198)*sailStates.alpha + (0.015803)*sailStates.beta + (0.249421)*sailStates.p + (-0.473084)*sailStates.q + (-0.023347)*sailStates.r + (0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end