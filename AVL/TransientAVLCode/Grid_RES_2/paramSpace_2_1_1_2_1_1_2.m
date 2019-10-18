function [aeroForces] = paramSpace_2_1_1_2_1_1_2(sailStates,airStates)

	CL = (5.626048)*sailStates.alpha + (-1.796013)*sailStates.beta + (-3.614783)*sailStates.p + (49.512794)*sailStates.q + (2.060157)*sailStates.r + (0.012634)*sailStates.de;
	CD = -5.027540;
	CY = (1.830969)*sailStates.alpha + (-0.115745)*sailStates.beta + (0.244885)*sailStates.p + (14.531898)*sailStates.q + (-0.027094)*sailStates.r + (0.003073)*sailStates.de;

	Cl = (-4.159631)*sailStates.alpha + (-0.957500)*sailStates.beta + (-1.822098)*sailStates.p + (15.688215)*sailStates.q + (2.241561)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (0.815277)*sailStates.alpha + (7.933162)*sailStates.beta + (11.403209)*sailStates.p + (-162.744034)*sailStates.q + (-7.247174)*sailStates.r + (-0.068022)*sailStates.de;
	Cn = (-2.023013)*sailStates.alpha + (0.191022)*sailStates.beta + (-0.738163)*sailStates.p + (-8.671758)*sailStates.q + (-0.177874)*sailStates.r + (-0.004000)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end