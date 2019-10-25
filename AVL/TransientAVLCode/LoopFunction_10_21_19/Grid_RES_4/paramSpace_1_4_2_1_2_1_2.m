function [aeroForces] = paramSpace_1_4_2_1_2_1_2(sailStates,airStates)

	CL = (6.468872)*sailStates.alpha + (0.737585)*sailStates.beta + (-2.630886)*sailStates.p + (42.969810)*sailStates.q + (-3.235291)*sailStates.r + (0.011990)*sailStates.de;
	CD = -2.400500;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-1.259194)*sailStates.p + (-0.000003)*sailStates.q + (-0.250469)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.878917)*sailStates.alpha + (0.832631)*sailStates.beta + (-1.160647)*sailStates.p + (11.332816)*sailStates.q + (-2.762952)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-10.364322)*sailStates.alpha + (-2.798906)*sailStates.beta + (6.631946)*sailStates.p + (-133.820877)*sailStates.q + (10.716092)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.231545)*sailStates.alpha + (0.116724)*sailStates.beta + (2.674479)*sailStates.p + (-11.327823)*sailStates.q + (0.028263)*sailStates.r + (-0.000215)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end