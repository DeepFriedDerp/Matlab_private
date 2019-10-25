function [aeroForces] = paramSpace_12_1_4_2_1_1_1(sailStates,airStates)

	CL = (3.953174)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.280910)*sailStates.p + (32.130550)*sailStates.q + (0.225481)*sailStates.r + (0.010410)*sailStates.de;
	CD = -0.002960;
	CY = (-0.033837)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.023076)*sailStates.p + (-0.291853)*sailStates.q + (0.003212)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.119062)*sailStates.alpha + (0.023242)*sailStates.beta + (-1.001598)*sailStates.p + (7.880383)*sailStates.q + (0.054972)*sailStates.r + (0.000043)*sailStates.de;
	Cm = (-14.489714)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.955111)*sailStates.p + (-130.037888)*sailStates.q + (-0.802114)*sailStates.r + (-0.068518)*sailStates.de;
	Cn = (-0.134058)*sailStates.alpha + (-0.003267)*sailStates.beta + (0.195657)*sailStates.p + (-1.173365)*sailStates.q + (-0.015640)*sailStates.r + (0.000050)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end