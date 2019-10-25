function [aeroForces] = paramSpace_1_2_3_3_3_1_3(sailStates,airStates)

	CL = (4.370460)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.788228)*sailStates.p + (39.459694)*sailStates.q + (-1.744220)*sailStates.r + (0.011395)*sailStates.de;
	CD = -0.253600;
	CY = (0.024287)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.589185)*sailStates.p + (0.665002)*sailStates.q + (-0.103826)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.522951)*sailStates.alpha + (0.268061)*sailStates.beta + (-1.388539)*sailStates.p + (12.435220)*sailStates.q + (-1.362610)*sailStates.r + (0.000642)*sailStates.de;
	Cm = (-13.480121)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.617165)*sailStates.p + (-141.960541)*sailStates.q + (5.790120)*sailStates.r + (-0.069034)*sailStates.de;
	Cn = (0.171062)*sailStates.alpha + (0.047266)*sailStates.beta + (1.120091)*sailStates.p + (-4.859169)*sailStates.q + (0.000106)*sailStates.r + (-0.000306)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end