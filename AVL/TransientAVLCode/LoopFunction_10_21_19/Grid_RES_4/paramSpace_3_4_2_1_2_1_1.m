function [aeroForces] = paramSpace_3_4_2_1_2_1_1(sailStates,airStates)

	CL = (5.876638)*sailStates.alpha + (0.475308)*sailStates.beta + (-1.604524)*sailStates.p + (24.867756)*sailStates.q + (-2.010798)*sailStates.r + (0.009974)*sailStates.de;
	CD = -2.240510;
	CY = (0.399900)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.018152)*sailStates.p + (0.221995)*sailStates.q + (0.066725)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.043474)*sailStates.alpha + (0.630699)*sailStates.beta + (-0.408992)*sailStates.p + (1.698962)*sailStates.q + (-1.961578)*sailStates.r + (-0.000928)*sailStates.de;
	Cm = (-14.738196)*sailStates.alpha + (-1.902818)*sailStates.beta + (6.231594)*sailStates.p + (-111.854546)*sailStates.q + (6.819655)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-2.085884)*sailStates.alpha + (-0.028983)*sailStates.beta + (2.290477)*sailStates.p + (-10.506675)*sailStates.q + (-0.019851)*sailStates.r + (-0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end