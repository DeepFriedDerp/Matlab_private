function [aeroForces] = paramSpace_4_3_4_1_1_3_2(sailStates,airStates)

	CL = (7.806341)*sailStates.alpha + (-0.273876)*sailStates.beta + (-2.599939)*sailStates.p + (43.561172)*sailStates.q + (3.677380)*sailStates.r + (0.012064)*sailStates.de;
	CD = -3.077060;
	CY = (-0.259101)*sailStates.alpha + (-0.023033)*sailStates.beta + (1.539836)*sailStates.p + (-1.664521)*sailStates.q + (-0.306471)*sailStates.r + (-0.000352)*sailStates.de;

	Cl = (3.029536)*sailStates.alpha + (-0.782883)*sailStates.beta + (-1.170010)*sailStates.p + (11.892640)*sailStates.q + (3.147593)*sailStates.r + (0.000178)*sailStates.de;
	Cm = (-11.964672)*sailStates.alpha + (1.046861)*sailStates.beta + (6.114639)*sailStates.p + (-132.472137)*sailStates.q + (-12.165196)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.462733)*sailStates.alpha + (0.134722)*sailStates.beta + (-3.250435)*sailStates.p + (15.052898)*sailStates.q + (0.066648)*sailStates.r + (0.000716)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end