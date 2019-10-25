function [aeroForces] = paramSpace_1_1_4_2_1_1_1(sailStates,airStates)

	CL = (4.213870)*sailStates.alpha + (-0.361884)*sailStates.beta + (-2.174316)*sailStates.p + (35.116772)*sailStates.q + (-1.640067)*sailStates.r + (0.011127)*sailStates.de;
	CD = -0.354370;
	CY = (-0.054227)*sailStates.alpha + (-0.021751)*sailStates.beta + (-0.499256)*sailStates.p + (-1.057311)*sailStates.q + (-0.099422)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.033823)*sailStates.alpha + (0.185112)*sailStates.beta + (-0.922192)*sailStates.p + (8.270910)*sailStates.q + (-1.308950)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-12.011228)*sailStates.alpha + (1.285791)*sailStates.beta + (6.461800)*sailStates.p + (-124.043571)*sailStates.q + (5.439828)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (-0.234525)*sailStates.alpha + (0.056208)*sailStates.beta + (1.040804)*sailStates.p + (-3.522606)*sailStates.q + (-0.016921)*sailStates.r + (0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end