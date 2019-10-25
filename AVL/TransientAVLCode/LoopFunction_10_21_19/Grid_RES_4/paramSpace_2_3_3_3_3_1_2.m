function [aeroForces] = paramSpace_2_3_3_3_3_1_2(sailStates,airStates)

	CL = (4.411940)*sailStates.alpha + (0.076522)*sailStates.beta + (-2.578795)*sailStates.p + (35.769100)*sailStates.q + (-1.111771)*sailStates.r + (0.011212)*sailStates.de;
	CD = -0.243840;
	CY = (0.063701)*sailStates.alpha + (-0.024816)*sailStates.beta + (-0.456994)*sailStates.p + (0.498142)*sailStates.q + (-0.029935)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.393123)*sailStates.alpha + (0.232255)*sailStates.beta + (-1.194040)*sailStates.p + (9.799153)*sailStates.q + (-0.932452)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.567074)*sailStates.alpha + (-0.281544)*sailStates.beta + (8.556131)*sailStates.p + (-136.960373)*sailStates.q + (3.751220)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (-0.167932)*sailStates.alpha + (0.013214)*sailStates.beta + (0.949515)*sailStates.p + (-4.503719)*sailStates.q + (0.006199)*sailStates.r + (-0.000228)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end