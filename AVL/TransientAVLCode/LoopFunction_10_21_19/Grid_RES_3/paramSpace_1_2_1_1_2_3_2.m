function [aeroForces] = paramSpace_1_2_1_1_2_3_2(sailStates,airStates)

	CL = (5.745916)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.350000)*sailStates.p + (28.240044)*sailStates.q + (1.353395)*sailStates.r + (0.009239)*sailStates.de;
	CD = -1.973690;
	CY = (-0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.818475)*sailStates.p + (0.000000)*sailStates.q + (0.144319)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.675592)*sailStates.alpha + (-0.409238)*sailStates.beta + (-1.126202)*sailStates.p + (8.026680)*sailStates.q + (1.450327)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-16.419611)*sailStates.alpha + (0.000000)*sailStates.beta + (9.615465)*sailStates.p + (-135.529190)*sailStates.q + (-4.402834)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.591920)*sailStates.alpha + (-0.072160)*sailStates.beta + (-2.047361)*sailStates.p + (9.947483)*sailStates.q + (-0.070384)*sailStates.r + (0.000188)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end