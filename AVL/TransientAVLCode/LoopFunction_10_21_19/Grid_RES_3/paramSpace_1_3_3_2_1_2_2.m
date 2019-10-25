function [aeroForces] = paramSpace_1_3_3_2_1_2_2(sailStates,airStates)

	CL = (3.869559)*sailStates.alpha + (0.113315)*sailStates.beta + (-2.506689)*sailStates.p + (34.835094)*sailStates.q + (-0.667818)*sailStates.r + (0.010713)*sailStates.de;
	CD = 0.056410;
	CY = (-0.093948)*sailStates.alpha + (-0.026556)*sailStates.beta + (-0.056455)*sailStates.p + (-0.759371)*sailStates.q + (-0.010027)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.105256)*sailStates.alpha + (0.095077)*sailStates.beta + (-1.137299)*sailStates.p + (9.252939)*sailStates.q + (-0.401487)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-14.059093)*sailStates.alpha + (-0.347474)*sailStates.beta + (8.503186)*sailStates.p + (-135.573257)*sailStates.q + (2.242993)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.211376)*sailStates.alpha + (0.014546)*sailStates.beta + (-0.003578)*sailStates.p + (1.038803)*sailStates.q + (-0.036186)*sailStates.r + (0.000198)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end