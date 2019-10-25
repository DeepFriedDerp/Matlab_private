function [aeroForces] = paramSpace_2_2_1_3_1_1_2(sailStates,airStates)

	CL = (4.189680)*sailStates.alpha + (-0.078924)*sailStates.beta + (-2.588331)*sailStates.p + (35.747250)*sailStates.q + (-0.869054)*sailStates.r + (0.011153)*sailStates.de;
	CD = -0.138310;
	CY = (-0.063132)*sailStates.alpha + (-0.024746)*sailStates.beta + (-0.325870)*sailStates.p + (-0.498142)*sailStates.q + (-0.021306)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.269157)*sailStates.alpha + (0.163867)*sailStates.beta + (-1.232686)*sailStates.p + (10.187144)*sailStates.q + (-0.769940)*sailStates.r + (0.000399)*sailStates.de;
	Cm = (-14.188578)*sailStates.alpha + (0.332186)*sailStates.beta + (8.663868)*sailStates.p + (-137.428818)*sailStates.q + (2.983761)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (0.022038)*sailStates.alpha + (0.011883)*sailStates.beta + (0.660866)*sailStates.p + (-2.263337)*sailStates.q + (-0.002234)*sailStates.r + (0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end