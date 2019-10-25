function [aeroForces] = paramSpace_4_4_3_2_1_1_1(sailStates,airStates)

	CL = (3.915797)*sailStates.alpha + (0.017666)*sailStates.beta + (-1.974043)*sailStates.p + (28.257111)*sailStates.q + (-0.002340)*sailStates.r + (0.009543)*sailStates.de;
	CD = -0.229680;
	CY = (-0.024311)*sailStates.alpha + (-0.023290)*sailStates.beta + (-0.169236)*sailStates.p + (-0.455226)*sailStates.q + (0.033647)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (0.843850)*sailStates.alpha + (0.109208)*sailStates.beta + (-0.750553)*sailStates.p + (5.264117)*sailStates.q + (-0.242931)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-14.401626)*sailStates.alpha + (-0.090149)*sailStates.beta + (7.263509)*sailStates.p + (-121.885399)*sailStates.q + (-0.055918)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.308598)*sailStates.alpha + (-0.016970)*sailStates.beta + (0.523218)*sailStates.p + (-2.340133)*sailStates.q + (-0.026043)*sailStates.r + (0.000077)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end