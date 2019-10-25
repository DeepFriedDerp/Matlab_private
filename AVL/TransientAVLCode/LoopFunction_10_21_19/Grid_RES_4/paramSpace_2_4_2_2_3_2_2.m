function [aeroForces] = paramSpace_2_4_2_2_3_2_2(sailStates,airStates)

	CL = (4.045227)*sailStates.alpha + (0.107714)*sailStates.beta + (-2.539261)*sailStates.p + (34.753582)*sailStates.q + (-0.536298)*sailStates.r + (0.010857)*sailStates.de;
	CD = 0.013960;
	CY = (0.096224)*sailStates.alpha + (-0.023884)*sailStates.beta + (-0.206859)*sailStates.p + (0.769435)*sailStates.q + (-0.013585)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.211643)*sailStates.alpha + (0.105842)*sailStates.beta + (-1.145118)*sailStates.p + (9.121656)*sailStates.q + (-0.399801)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.492235)*sailStates.alpha + (-0.413955)*sailStates.beta + (8.600010)*sailStates.p + (-135.788696)*sailStates.q + (1.817744)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (-0.101673)*sailStates.alpha + (0.003797)*sailStates.beta + (0.370639)*sailStates.p + (-2.003515)*sailStates.q + (0.003018)*sailStates.r + (-0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end