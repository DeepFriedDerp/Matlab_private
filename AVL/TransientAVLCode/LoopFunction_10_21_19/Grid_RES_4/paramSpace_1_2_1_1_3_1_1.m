function [aeroForces] = paramSpace_1_2_1_1_3_1_1(sailStates,airStates)

	CL = (7.432147)*sailStates.alpha + (-0.257921)*sailStates.beta + (-1.748078)*sailStates.p + (36.295433)*sailStates.q + (-3.332499)*sailStates.r + (0.011665)*sailStates.de;
	CD = -3.014870;
	CY = (0.699130)*sailStates.alpha + (-0.026147)*sailStates.beta + (-1.434279)*sailStates.p + (1.002335)*sailStates.q + (-0.285403)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (2.365247)*sailStates.alpha + (0.607859)*sailStates.beta + (-0.502122)*sailStates.p + (5.552634)*sailStates.q + (-2.872040)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-10.125813)*sailStates.alpha + (0.992761)*sailStates.beta + (3.365016)*sailStates.p + (-108.591942)*sailStates.q + (11.012542)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-2.616571)*sailStates.alpha + (0.140100)*sailStates.beta + (3.163212)*sailStates.p + (-14.800774)*sailStates.q + (0.077589)*sailStates.r + (-0.000477)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end