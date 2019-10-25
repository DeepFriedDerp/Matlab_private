function [aeroForces] = paramSpace_1_3_3_2_1_2_1(sailStates,airStates)

	CL = (3.835571)*sailStates.alpha + (0.096536)*sailStates.beta + (-2.115678)*sailStates.p + (31.543165)*sailStates.q + (-0.529553)*sailStates.r + (0.010528)*sailStates.de;
	CD = 0.048210;
	CY = (-0.123881)*sailStates.alpha + (-0.027165)*sailStates.beta + (-0.013836)*sailStates.p + (-1.027328)*sailStates.q + (-0.002537)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (0.886608)*sailStates.alpha + (0.073469)*sailStates.beta + (-0.816768)*sailStates.p + (6.193387)*sailStates.q + (-0.288160)*sailStates.r + (-0.000247)*sailStates.de;
	Cm = (-13.980299)*sailStates.alpha + (-0.291506)*sailStates.beta + (7.229679)*sailStates.p + (-124.672363)*sailStates.q + (1.784972)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.174760)*sailStates.alpha + (0.012269)*sailStates.beta + (-0.035709)*sailStates.p + (1.109404)*sailStates.q + (-0.031793)*sailStates.r + (0.000283)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end