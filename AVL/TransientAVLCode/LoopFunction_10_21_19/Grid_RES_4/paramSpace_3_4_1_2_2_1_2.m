function [aeroForces] = paramSpace_3_4_1_2_2_1_2(sailStates,airStates)

	CL = (4.440968)*sailStates.alpha + (0.198304)*sailStates.beta + (-2.521159)*sailStates.p + (33.470516)*sailStates.q + (-0.691160)*sailStates.r + (0.010677)*sailStates.de;
	CD = -0.431520;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.424096)*sailStates.p + (0.000001)*sailStates.q + (0.027797)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.262804)*sailStates.alpha + (0.256146)*sailStates.beta + (-1.141845)*sailStates.p + (8.787861)*sailStates.q + (-0.756055)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-15.029643)*sailStates.alpha + (-0.876739)*sailStates.beta + (8.919119)*sailStates.p + (-136.150452)*sailStates.q + (2.374115)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.250275)*sailStates.alpha + (-0.012000)*sailStates.beta + (0.999403)*sailStates.p + (-4.611846)*sailStates.q + (-0.011368)*sailStates.r + (-0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end