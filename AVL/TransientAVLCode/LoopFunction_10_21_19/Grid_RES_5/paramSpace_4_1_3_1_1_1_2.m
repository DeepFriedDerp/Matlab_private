function [aeroForces] = paramSpace_4_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.418238)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.123783)*sailStates.p + (42.433594)*sailStates.q + (-1.883070)*sailStates.r + (0.011832)*sailStates.de;
	CD = -0.609820;
	CY = (-0.231201)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.641494)*sailStates.p + (-0.696925)*sailStates.q + (-0.090181)*sailStates.r + (-0.000151)*sailStates.de;

	Cl = (1.322615)*sailStates.alpha + (0.348703)*sailStates.beta + (-1.635224)*sailStates.p + (14.550730)*sailStates.q + (-1.585465)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-12.333784)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.789907)*sailStates.p + (-151.165665)*sailStates.q + (6.320206)*sailStates.r + (-0.070716)*sailStates.de;
	Cn = (0.627646)*sailStates.alpha + (0.049007)*sailStates.beta + (1.273849)*sailStates.p + (-4.498506)*sailStates.q + (-0.011475)*sailStates.r + (0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end