function [aeroForces] = paramSpace_1_1_2_1_2_2_2(sailStates,airStates)

	CL = (7.867724)*sailStates.alpha + (0.383322)*sailStates.beta + (-2.523056)*sailStates.p + (30.055521)*sailStates.q + (-0.245429)*sailStates.r + (0.008767)*sailStates.de;
	CD = -4.034500;
	CY = (2.008108)*sailStates.alpha + (-0.056223)*sailStates.beta + (-0.557377)*sailStates.p + (16.378994)*sailStates.q + (-0.072220)*sailStates.r + (0.003483)*sailStates.de;

	Cl = (-0.615879)*sailStates.alpha + (-0.396394)*sailStates.beta + (-1.422042)*sailStates.p + (12.359159)*sailStates.q + (0.436496)*sailStates.r + (0.000494)*sailStates.de;
	Cm = (-15.509756)*sailStates.alpha + (-1.891055)*sailStates.beta + (8.764245)*sailStates.p + (-135.919830)*sailStates.q + (0.598514)*sailStates.r + (-0.068182)*sailStates.de;
	Cn = (-2.086149)*sailStates.alpha + (-0.023806)*sailStates.beta + (0.588473)*sailStates.p + (-14.222267)*sailStates.q + (0.157598)*sailStates.r + (-0.004671)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end