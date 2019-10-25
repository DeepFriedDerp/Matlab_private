function [aeroForces] = paramSpace_1_1_1_1_2_3_2(sailStates,airStates)

	CL = (1.213175)*sailStates.alpha + (0.071293)*sailStates.beta + (-5.566144)*sailStates.p + (55.225967)*sailStates.q + (0.236730)*sailStates.r + (0.011132)*sailStates.de;
	CD = -1.734670;
	CY = (0.931205)*sailStates.alpha + (-0.028020)*sailStates.beta + (0.481543)*sailStates.p + (2.210035)*sailStates.q + (0.084699)*sailStates.r + (0.000498)*sailStates.de;

	Cl = (-0.544599)*sailStates.alpha + (-0.338883)*sailStates.beta + (-3.787551)*sailStates.p + (33.480076)*sailStates.q + (0.538334)*sailStates.r + (0.004916)*sailStates.de;
	Cm = (0.268485)*sailStates.alpha + (-0.292005)*sailStates.beta + (20.110748)*sailStates.p + (-225.208099)*sailStates.q + (-0.663088)*sailStates.r + (-0.080072)*sailStates.de;
	Cn = (-3.419749)*sailStates.alpha + (-0.065079)*sailStates.beta + (-1.820427)*sailStates.p + (9.582891)*sailStates.q + (-0.108154)*sailStates.r + (-0.000383)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end