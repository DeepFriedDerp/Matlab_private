function [aeroForces] = paramSpace_1_2_3_2_3_1_1(sailStates,airStates)

	CL = (4.814627)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.161549)*sailStates.p + (35.210190)*sailStates.q + (-1.945657)*sailStates.r + (0.011301)*sailStates.de;
	CD = -0.620170;
	CY = (0.192403)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.728033)*sailStates.p + (0.491415)*sailStates.q + (-0.128325)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.412011)*sailStates.alpha + (0.344410)*sailStates.beta + (-0.863933)*sailStates.p + (7.707652)*sailStates.q + (-1.567272)*sailStates.r + (-0.000222)*sailStates.de;
	Cm = (-12.958414)*sailStates.alpha + (0.000000)*sailStates.beta + (6.227674)*sailStates.p + (-123.667763)*sailStates.q + (6.453131)*sailStates.r + (-0.067234)*sailStates.de;
	Cn = (-0.688933)*sailStates.alpha + (0.060729)*sailStates.beta + (1.533959)*sailStates.p + (-7.046851)*sailStates.q + (0.020730)*sailStates.r + (-0.000263)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end