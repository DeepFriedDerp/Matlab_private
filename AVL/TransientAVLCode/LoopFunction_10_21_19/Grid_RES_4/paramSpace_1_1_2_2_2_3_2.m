function [aeroForces] = paramSpace_1_1_2_2_2_3_2(sailStates,airStates)

	CL = (4.074568)*sailStates.alpha + (0.023066)*sailStates.beta + (-2.383735)*sailStates.p + (31.435368)*sailStates.q + (0.039715)*sailStates.r + (0.009723)*sailStates.de;
	CD = -0.295600;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.241514)*sailStates.p + (-0.000000)*sailStates.q + (0.048040)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.312321)*sailStates.alpha + (-0.118589)*sailStates.beta + (-1.176823)*sailStates.p + (9.475371)*sailStates.q + (0.255231)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-14.753732)*sailStates.alpha + (-0.106278)*sailStates.beta + (8.773241)*sailStates.p + (-133.820877)*sailStates.q + (-0.048927)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.306916)*sailStates.alpha + (-0.031941)*sailStates.beta + (-0.758866)*sailStates.p + (4.218348)*sailStates.q + (-0.053629)*sailStates.r + (0.000068)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end