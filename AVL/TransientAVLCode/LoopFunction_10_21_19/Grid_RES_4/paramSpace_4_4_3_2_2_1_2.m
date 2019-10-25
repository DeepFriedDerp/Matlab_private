function [aeroForces] = paramSpace_4_4_3_2_2_1_2(sailStates,airStates)

	CL = (4.074568)*sailStates.alpha + (0.023066)*sailStates.beta + (-2.383735)*sailStates.p + (31.435368)*sailStates.q + (-0.039715)*sailStates.r + (0.009723)*sailStates.de;
	CD = -0.295600;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.241514)*sailStates.p + (0.000000)*sailStates.q + (0.048040)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.161876)*sailStates.alpha + (0.124763)*sailStates.beta + (-1.082450)*sailStates.p + (8.287491)*sailStates.q + (-0.274045)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-14.753734)*sailStates.alpha + (-0.106278)*sailStates.beta + (8.773242)*sailStates.p + (-133.820877)*sailStates.q + (0.048927)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.309762)*sailStates.alpha + (-0.016465)*sailStates.beta + (0.740094)*sailStates.p + (-3.982063)*sailStates.q + (-0.049887)*sailStates.r + (-0.000068)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end