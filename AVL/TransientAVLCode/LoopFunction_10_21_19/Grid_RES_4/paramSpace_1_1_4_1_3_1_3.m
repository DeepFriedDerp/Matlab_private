function [aeroForces] = paramSpace_1_1_4_1_3_1_3(sailStates,airStates)

	CL = (7.517687)*sailStates.alpha + (-0.800540)*sailStates.beta + (-3.435854)*sailStates.p + (50.411106)*sailStates.q + (-3.985035)*sailStates.r + (0.012620)*sailStates.de;
	CD = -3.080510;
	CY = (-0.243246)*sailStates.alpha + (-0.031466)*sailStates.beta + (-1.599955)*sailStates.p + (2.326709)*sailStates.q + (-0.318001)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (3.233787)*sailStates.alpha + (0.432266)*sailStates.beta + (-1.924839)*sailStates.p + (19.340105)*sailStates.q + (-3.364425)*sailStates.r + (0.001479)*sailStates.de;
	Cm = (-12.176082)*sailStates.alpha + (2.886122)*sailStates.beta + (8.835672)*sailStates.p + (-155.326050)*sailStates.q + (13.123691)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (2.007509)*sailStates.alpha + (0.151295)*sailStates.beta + (3.250491)*sailStates.p + (-15.030350)*sailStates.q + (0.052917)*sailStates.r + (-0.000999)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end