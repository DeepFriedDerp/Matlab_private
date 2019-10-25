function [aeroForces] = paramSpace_1_2_3_1_3_2_1(sailStates,airStates)

	CL = (3.835529)*sailStates.alpha + (-0.069435)*sailStates.beta + (-1.579041)*sailStates.p + (28.267738)*sailStates.q + (-1.066061)*sailStates.r + (0.010288)*sailStates.de;
	CD = -0.040290;
	CY = (0.273258)*sailStates.alpha + (-0.026007)*sailStates.beta + (-0.373861)*sailStates.p + (1.002334)*sailStates.q + (-0.074330)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (0.787635)*sailStates.alpha + (0.126913)*sailStates.beta + (-0.448871)*sailStates.p + (3.453856)*sailStates.q + (-0.738190)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-12.739536)*sailStates.alpha + (0.238171)*sailStates.beta + (4.853312)*sailStates.p + (-108.591942)*sailStates.q + (3.530370)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-0.734733)*sailStates.alpha + (0.030975)*sailStates.beta + (0.772223)*sailStates.p + (-4.249506)*sailStates.q + (0.024442)*sailStates.r + (-0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end