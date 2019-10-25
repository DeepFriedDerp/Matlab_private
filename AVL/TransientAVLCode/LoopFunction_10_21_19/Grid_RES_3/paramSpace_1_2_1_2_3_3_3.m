function [aeroForces] = paramSpace_1_2_1_2_3_3_3(sailStates,airStates)

	CL = (3.999023)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.803634)*sailStates.p + (35.497990)*sailStates.q + (-0.207377)*sailStates.r + (0.010195)*sailStates.de;
	CD = -0.188580;
	CY = (0.139532)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.088801)*sailStates.p + (1.027328)*sailStates.q + (0.015560)*sailStates.r + (0.000220)*sailStates.de;

	Cl = (1.332140)*sailStates.alpha + (-0.085372)*sailStates.beta + (-1.460413)*sailStates.p + (12.138921)*sailStates.q + (0.037132)*sailStates.r + (0.000810)*sailStates.de;
	Cm = (-14.428390)*sailStates.alpha + (0.000000)*sailStates.beta + (9.940324)*sailStates.p + (-145.469635)*sailStates.q + (0.758516)*sailStates.r + (-0.069407)*sailStates.de;
	Cn = (0.061369)*sailStates.alpha + (-0.015053)*sailStates.beta + (-0.477870)*sailStates.p + (2.384162)*sailStates.q + (-0.032340)*sailStates.r + (-0.000232)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end