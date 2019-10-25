function [aeroForces] = paramSpace_4_3_4_1_2_3_2(sailStates,airStates)

	CL = (6.511284)*sailStates.alpha + (-0.254079)*sailStates.beta + (-2.649024)*sailStates.p + (43.287125)*sailStates.q + (3.251449)*sailStates.r + (0.012075)*sailStates.de;
	CD = -2.410500;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (1.275401)*sailStates.p + (0.000001)*sailStates.q + (-0.253693)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.935497)*sailStates.alpha + (-0.707553)*sailStates.beta + (-1.200578)*sailStates.p + (11.805906)*sailStates.q + (2.797883)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-10.345265)*sailStates.alpha + (0.981724)*sailStates.beta + (6.684373)*sailStates.p + (-134.847153)*sailStates.q + (-10.790384)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.167174)*sailStates.alpha + (0.124309)*sailStates.beta + (-2.692516)*sailStates.p + (11.265574)*sailStates.q + (0.026172)*sailStates.r + (0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end