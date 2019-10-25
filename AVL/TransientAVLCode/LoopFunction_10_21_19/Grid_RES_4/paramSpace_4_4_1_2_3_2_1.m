function [aeroForces] = paramSpace_4_4_1_2_3_2_1(sailStates,airStates)

	CL = (3.785092)*sailStates.alpha + (-0.124979)*sailStates.beta + (-2.097087)*sailStates.p + (31.514456)*sailStates.q + (0.617457)*sailStates.r + (0.010423)*sailStates.de;
	CD = 0.055180;
	CY = (0.124422)*sailStates.alpha + (-0.027822)*sailStates.beta + (0.030570)*sailStates.p + (1.057313)*sailStates.q + (-0.006194)*sailStates.r + (0.000221)*sailStates.de;

	Cl = (0.859363)*sailStates.alpha + (-0.090798)*sailStates.beta + (-0.803367)*sailStates.p + (6.131940)*sailStates.q + (0.341802)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-13.772684)*sailStates.alpha + (0.378472)*sailStates.beta + (7.130550)*sailStates.p + (-124.043571)*sailStates.q + (-2.077799)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (-0.167230)*sailStates.alpha + (0.016397)*sailStates.beta + (0.006813)*sailStates.p + (-1.022551)*sailStates.q + (-0.037674)*sailStates.r + (-0.000287)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end