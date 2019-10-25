function [aeroForces] = paramSpace_1_1_3_1_2_2_3(sailStates,airStates)

	CL = (3.484163)*sailStates.alpha + (-0.240891)*sailStates.beta + (-3.313969)*sailStates.p + (42.253708)*sailStates.q + (-1.316920)*sailStates.r + (0.010967)*sailStates.de;
	CD = 0.082970;
	CY = (-0.035722)*sailStates.alpha + (-0.026825)*sailStates.beta + (-0.317935)*sailStates.p + (0.662188)*sailStates.q + (-0.063217)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.350944)*sailStates.alpha + (0.034953)*sailStates.beta + (-1.901192)*sailStates.p + (17.161304)*sailStates.q + (-0.950229)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-12.450832)*sailStates.alpha + (0.826618)*sailStates.beta + (10.867126)*sailStates.p + (-157.701111)*sailStates.q + (4.400337)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.537363)*sailStates.alpha + (0.021441)*sailStates.beta + (0.366159)*sailStates.p + (-0.725549)*sailStates.q + (-0.041028)*sailStates.r + (-0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end