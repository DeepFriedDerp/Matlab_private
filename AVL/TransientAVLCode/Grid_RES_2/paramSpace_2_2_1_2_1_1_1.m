function [aeroForces] = paramSpace_2_2_1_2_1_1_1(sailStates,airStates)

	CL = (5.143500)*sailStates.alpha + (-3.784937)*sailStates.beta + (-3.412806)*sailStates.p + (46.933662)*sailStates.q + (2.198695)*sailStates.r + (0.010407)*sailStates.de;
	CD = -5.681440;
	CY = (1.722046)*sailStates.alpha + (-0.238639)*sailStates.beta + (0.331697)*sailStates.p + (14.873415)*sailStates.q + (-0.035241)*sailStates.r + (0.002829)*sailStates.de;

	Cl = (-5.070156)*sailStates.alpha + (-1.220812)*sailStates.beta + (-1.648555)*sailStates.p + (14.000975)*sailStates.q + (2.414467)*sailStates.r + (0.001179)*sailStates.de;
	Cm = (4.876314)*sailStates.alpha + (17.033319)*sailStates.beta + (10.601928)*sailStates.p + (-150.342209)*sailStates.q + (-7.778076)*sailStates.r + (-0.055163)*sailStates.de;
	Cn = (-1.786441)*sailStates.alpha + (0.336117)*sailStates.beta + (-0.941327)*sailStates.p + (-8.084788)*sailStates.q + (-0.186442)*sailStates.r + (-0.003696)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end