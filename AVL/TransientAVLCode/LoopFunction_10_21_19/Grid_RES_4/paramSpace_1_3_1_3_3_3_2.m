function [aeroForces] = paramSpace_1_3_1_3_3_3_2(sailStates,airStates)

	CL = (3.855566)*sailStates.alpha + (0.033452)*sailStates.beta + (-2.414770)*sailStates.p + (33.106365)*sailStates.q + (-0.462894)*sailStates.r + (0.010040)*sailStates.de;
	CD = -0.000860;
	CY = (0.059923)*sailStates.alpha + (-0.024405)*sailStates.beta + (-0.018109)*sailStates.p + (0.489619)*sailStates.q + (-0.003655)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.171241)*sailStates.alpha + (-0.000666)*sailStates.beta + (-1.122018)*sailStates.p + (9.122203)*sailStates.q + (-0.198962)*sailStates.r + (0.000256)*sailStates.de;
	Cm = (-14.189074)*sailStates.alpha + (-0.137180)*sailStates.beta + (8.421746)*sailStates.p + (-134.148560)*sailStates.q + (1.617900)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (0.149909)*sailStates.alpha + (-0.000815)*sailStates.beta + (-0.181095)*sailStates.p + (1.240524)*sailStates.q + (-0.031367)*sailStates.r + (-0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end