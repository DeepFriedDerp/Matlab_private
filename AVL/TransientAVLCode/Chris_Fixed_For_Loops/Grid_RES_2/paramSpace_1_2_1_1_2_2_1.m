function [aeroForces] = paramSpace_1_2_1_1_2_2_1(sailStates,airStates)

	CL = (6.219830)*sailStates.alpha + (-0.878517)*sailStates.beta + (-6.301900)*sailStates.p + (56.546452)*sailStates.q + (2.844590)*sailStates.r + (0.010946)*sailStates.de;
	CD = -9.920900;
	CY = (3.221248)*sailStates.alpha + (-0.017041)*sailStates.beta + (1.580775)*sailStates.p + (4.530728)*sailStates.q + (0.208755)*sailStates.r + (0.001034)*sailStates.de;

	Cl = (-1.777233)*sailStates.alpha + (-1.129513)*sailStates.beta + (-4.375931)*sailStates.p + (37.561859)*sailStates.q + (3.045549)*sailStates.r + (0.005861)*sailStates.de;
	Cm = (10.931623)*sailStates.alpha + (3.689777)*sailStates.beta + (23.750786)*sailStates.p + (-246.442703)*sailStates.q + (-9.638833)*sailStates.r + (-0.083720)*sailStates.de;
	Cn = (-12.289589)*sailStates.alpha + (-0.113387)*sailStates.beta + (-4.247186)*sailStates.p + (18.158253)*sailStates.q + (-0.084211)*sailStates.r + (-0.000780)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end