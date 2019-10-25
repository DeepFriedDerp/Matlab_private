function [aeroForces] = paramSpace_2_1_4_2_2_3_2(sailStates,airStates)

	CL = (4.440968)*sailStates.alpha + (0.198304)*sailStates.beta + (-2.521159)*sailStates.p + (33.470516)*sailStates.q + (0.691160)*sailStates.r + (0.010677)*sailStates.de;
	CD = -0.431520;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.424096)*sailStates.p + (-0.000001)*sailStates.q + (0.027797)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.416054)*sailStates.alpha + (-0.165228)*sailStates.beta + (-1.239549)*sailStates.p + (9.996419)*sailStates.q + (0.749779)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-15.029643)*sailStates.alpha + (-0.876739)*sailStates.beta + (8.919119)*sailStates.p + (-136.150452)*sailStates.q + (-2.374115)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.204726)*sailStates.alpha + (-0.015618)*sailStates.beta + (-1.005807)*sailStates.p + (4.691059)*sailStates.q + (-0.011779)*sailStates.r + (0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end