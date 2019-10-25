function [aeroForces] = paramSpace_1_2_2_1_1_1_2(sailStates,airStates)

	CL = (5.508013)*sailStates.alpha + (-0.227234)*sailStates.beta + (-2.698865)*sailStates.p + (42.964367)*sailStates.q + (-2.816782)*sailStates.r + (0.012174)*sailStates.de;
	CD = -1.850000;
	CY = (-0.239816)*sailStates.alpha + (-0.023148)*sailStates.beta + (-0.996455)*sailStates.p + (-1.664518)*sailStates.q + (-0.198148)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (1.117104)*sailStates.alpha + (0.502414)*sailStates.beta + (-1.263022)*sailStates.p + (12.113918)*sailStates.q + (-2.430995)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-9.440179)*sailStates.alpha + (0.872179)*sailStates.beta + (7.264005)*sailStates.p + (-137.222183)*sailStates.q + (9.365851)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.166301)*sailStates.alpha + (0.111904)*sailStates.beta + (2.106400)*sailStates.p + (-7.388131)*sailStates.q + (-0.014743)*sailStates.r + (0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end