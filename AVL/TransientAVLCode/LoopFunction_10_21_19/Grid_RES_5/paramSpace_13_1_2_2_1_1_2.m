function [aeroForces] = paramSpace_13_1_2_2_1_1_2(sailStates,airStates)

	CL = (3.959191)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.663708)*sailStates.p + (35.325920)*sailStates.q + (0.511629)*sailStates.r + (0.010551)*sailStates.de;
	CD = -0.012000;
	CY = (-0.065094)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.027812)*sailStates.p + (-0.546500)*sailStates.q + (-0.004885)*sailStates.r + (-0.000117)*sailStates.de;

	Cl = (1.291798)*sailStates.alpha + (0.007895)*sailStates.beta + (-1.327157)*sailStates.p + (11.083621)*sailStates.q + (0.234218)*sailStates.r + (0.000588)*sailStates.de;
	Cm = (-14.533952)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.191703)*sailStates.p + (-140.819473)*sailStates.q + (-1.727800)*sailStates.r + (-0.068914)*sailStates.de;
	Cn = (-0.130823)*sailStates.alpha + (-0.001392)*sailStates.beta + (0.152766)*sailStates.p + (-0.997254)*sailStates.q + (-0.027045)*sailStates.r + (0.000149)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end