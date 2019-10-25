function [aeroForces] = paramSpace_1_2_1_2_2_2_2(sailStates,airStates)

	CL = (5.606965)*sailStates.alpha + (-0.831565)*sailStates.beta + (-6.254452)*sailStates.p + (56.569065)*sailStates.q + (2.656693)*sailStates.r + (0.011010)*sailStates.de;
	CD = -9.044800;
	CY = (3.025078)*sailStates.alpha + (-0.017218)*sailStates.beta + (1.493386)*sailStates.p + (4.427401)*sailStates.q + (0.197235)*sailStates.r + (0.001009)*sailStates.de;

	Cl = (-1.736390)*sailStates.alpha + (-1.070144)*sailStates.beta + (-4.331075)*sailStates.p + (37.234306)*sailStates.q + (2.866385)*sailStates.r + (0.005774)*sailStates.de;
	Cm = (10.005723)*sailStates.alpha + (3.504436)*sailStates.beta + (23.470102)*sailStates.p + (-244.841675)*sailStates.q + (-9.007442)*sailStates.r + (-0.083432)*sailStates.de;
	Cn = (-11.495843)*sailStates.alpha + (-0.107663)*sailStates.beta + (-4.040445)*sailStates.p + (17.269863)*sailStates.q + (-0.081322)*sailStates.r + (-0.000784)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end