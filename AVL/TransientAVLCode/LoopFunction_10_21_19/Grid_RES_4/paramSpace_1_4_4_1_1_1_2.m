function [aeroForces] = paramSpace_1_4_4_1_1_1_2(sailStates,airStates)

	CL = (5.472174)*sailStates.alpha + (0.635429)*sailStates.beta + (-2.681566)*sailStates.p + (42.599041)*sailStates.q + (-2.791553)*sailStates.r + (0.012175)*sailStates.de;
	CD = -1.813250;
	CY = (-0.238243)*sailStates.alpha + (-0.029565)*sailStates.beta + (-0.965913)*sailStates.p + (-1.664518)*sailStates.q + (-0.192311)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.039482)*sailStates.alpha + (0.723897)*sailStates.beta + (-1.191905)*sailStates.p + (11.241675)*sailStates.q + (-2.366542)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-9.673853)*sailStates.alpha + (-2.340010)*sailStates.beta + (7.221484)*sailStates.p + (-136.195908)*sailStates.q + (9.241733)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.048452)*sailStates.alpha + (0.107732)*sailStates.beta + (2.073114)*sailStates.p + (-7.518367)*sailStates.q + (-0.011132)*sailStates.r + (0.000271)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end