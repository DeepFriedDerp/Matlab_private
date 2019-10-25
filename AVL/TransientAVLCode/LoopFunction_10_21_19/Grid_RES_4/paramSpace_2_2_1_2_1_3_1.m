function [aeroForces] = paramSpace_2_2_1_2_1_3_1(sailStates,airStates)

	CL = (4.571800)*sailStates.alpha + (0.056439)*sailStates.beta + (-2.145564)*sailStates.p + (30.484930)*sailStates.q + (0.917268)*sailStates.r + (0.010568)*sailStates.de;
	CD = -0.507710;
	CY = (-0.191879)*sailStates.alpha + (-0.024574)*sailStates.beta + (0.519640)*sailStates.p + (-0.870358)*sailStates.q + (0.034151)*sailStates.r + (-0.000186)*sailStates.de;

	Cl = (1.320105)*sailStates.alpha + (-0.203752)*sailStates.beta + (-0.892131)*sailStates.p + (6.608533)*sailStates.q + (0.886271)*sailStates.r + (-0.000122)*sailStates.de;
	Cm = (-15.285188)*sailStates.alpha + (-0.195725)*sailStates.beta + (7.721876)*sailStates.p + (-126.510948)*sailStates.q + (-3.067763)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (0.702595)*sailStates.alpha + (-0.015885)*sailStates.beta + (-1.204415)*sailStates.p + (6.382772)*sailStates.q + (-0.017380)*sailStates.r + (0.000357)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end