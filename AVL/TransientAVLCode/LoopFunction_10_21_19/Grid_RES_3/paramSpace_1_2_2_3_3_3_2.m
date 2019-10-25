function [aeroForces] = paramSpace_1_2_2_3_3_3_2(sailStates,airStates)

	CL = (3.990120)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.445135)*sailStates.p + (33.241177)*sailStates.q + (-0.347789)*sailStates.r + (0.010335)*sailStates.de;
	CD = -0.052100;
	CY = (0.060248)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.027537)*sailStates.p + (0.491627)*sailStates.q + (0.004856)*sailStates.r + (0.000105)*sailStates.de;

	Cl = (1.208903)*sailStates.alpha + (-0.033380)*sailStates.beta + (-1.152496)*sailStates.p + (9.363505)*sailStates.q + (-0.095524)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-14.651264)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.551405)*sailStates.p + (-134.907364)*sailStates.q + (1.193631)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (0.142062)*sailStates.alpha + (-0.005886)*sailStates.beta + (-0.251945)*sailStates.p + (1.380188)*sailStates.q + (-0.025436)*sailStates.r + (-0.000117)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end