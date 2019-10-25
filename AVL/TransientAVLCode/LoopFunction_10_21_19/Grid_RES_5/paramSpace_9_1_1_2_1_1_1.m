function [aeroForces] = paramSpace_9_1_1_2_1_1_1(sailStates,airStates)

	CL = (4.155529)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.352716)*sailStates.p + (32.897881)*sailStates.q + (-0.278372)*sailStates.r + (0.010952)*sailStates.de;
	CD = -0.077560;
	CY = (-0.031945)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.174374)*sailStates.p + (-0.381223)*sailStates.q + (0.006129)*sailStates.r + (-0.000082)*sailStates.de;

	Cl = (1.144105)*sailStates.alpha + (0.102620)*sailStates.beta + (-1.034283)*sailStates.p + (8.075865)*sailStates.q + (-0.340342)*sailStates.r + (0.000058)*sailStates.de;
	Cm = (-14.896714)*sailStates.alpha + (0.000000)*sailStates.beta + (8.140156)*sailStates.p + (-131.546402)*sailStates.q + (0.982164)*sailStates.r + (-0.069816)*sailStates.de;
	Cn = (-0.117966)*sailStates.alpha + (-0.003584)*sailStates.beta + (0.416108)*sailStates.p + (-1.573828)*sailStates.q + (-0.001744)*sailStates.r + (0.000090)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end