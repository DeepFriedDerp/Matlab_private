function [aeroForces] = paramSpace_3_3_3_2_1_1_1(sailStates,airStates)

	CL = (4.247329)*sailStates.alpha + (0.044900)*sailStates.beta + (-2.130281)*sailStates.p + (30.553432)*sailStates.q + (-0.523392)*sailStates.r + (0.010596)*sailStates.de;
	CD = -0.310040;
	CY = (-0.034185)*sailStates.alpha + (-0.024714)*sailStates.beta + (-0.285725)*sailStates.p + (-0.668512)*sailStates.q + (0.018704)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (0.972995)*sailStates.alpha + (0.181855)*sailStates.beta + (-0.849953)*sailStates.p + (6.230772)*sailStates.q + (-0.583687)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.734578)*sailStates.alpha + (-0.177725)*sailStates.beta + (7.548287)*sailStates.p + (-125.787453)*sailStates.q + (1.772772)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.325086)*sailStates.alpha + (-0.010903)*sailStates.beta + (0.713361)*sailStates.p + (-2.912570)*sailStates.q + (-0.004828)*sailStates.r + (0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end