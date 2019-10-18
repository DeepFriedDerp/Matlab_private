function [aeroForces] = paramSpace_2_1_1_2_1_1_1(sailStates,airStates)

	CL = (5.623546)*sailStates.alpha + (-1.815426)*sailStates.beta + (-3.609356)*sailStates.p + (49.542767)*sailStates.q + (2.130686)*sailStates.r + (0.012632)*sailStates.de;
	CD = -5.079080;
	CY = (1.818341)*sailStates.alpha + (-0.114029)*sailStates.beta + (0.288602)*sailStates.p + (14.259592)*sailStates.q + (-0.032945)*sailStates.r + (0.003015)*sailStates.de;

	Cl = (-4.163369)*sailStates.alpha + (-0.977181)*sailStates.beta + (-1.818716)*sailStates.p + (15.697709)*sailStates.q + (2.299309)*sailStates.r + (0.001510)*sailStates.de;
	Cm = (1.016826)*sailStates.alpha + (7.998365)*sailStates.beta + (11.340884)*sailStates.p + (-162.486847)*sailStates.q + (-7.479548)*sailStates.r + (-0.067992)*sailStates.de;
	Cn = (-2.033999)*sailStates.alpha + (0.189998)*sailStates.beta + (-0.828866)*sailStates.p + (-8.057281)*sailStates.q + (-0.173450)*sailStates.r + (-0.003916)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end