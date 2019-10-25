function [aeroForces] = paramSpace_3_4_4_2_2_3_1(sailStates,airStates)

	CL = (4.466341)*sailStates.alpha + (-0.329113)*sailStates.beta + (-2.170946)*sailStates.p + (32.676414)*sailStates.q + (1.299427)*sailStates.r + (0.010883)*sailStates.de;
	CD = -0.477520;
	CY = (-0.080282)*sailStates.alpha + (-0.024926)*sailStates.beta + (0.557692)*sailStates.p + (0.100924)*sailStates.q + (-0.036542)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (1.075260)*sailStates.alpha + (-0.362165)*sailStates.beta + (-0.829612)*sailStates.p + (6.378957)*sailStates.q + (1.159878)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-13.702797)*sailStates.alpha + (1.352071)*sailStates.beta + (7.118562)*sailStates.p + (-125.105080)*sailStates.q + (-4.434910)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.561862)*sailStates.alpha + (0.017002)*sailStates.beta + (-1.195704)*sailStates.p + (5.125227)*sailStates.q + (0.005586)*sailStates.r + (0.000049)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end