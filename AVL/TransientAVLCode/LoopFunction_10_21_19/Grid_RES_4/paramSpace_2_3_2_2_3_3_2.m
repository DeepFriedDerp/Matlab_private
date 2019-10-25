function [aeroForces] = paramSpace_2_3_2_2_3_3_2(sailStates,airStates)

	CL = (4.311563)*sailStates.alpha + (-0.042447)*sailStates.beta + (-2.532464)*sailStates.p + (33.812111)*sailStates.q + (0.470286)*sailStates.r + (0.010781)*sailStates.de;
	CD = -0.305670;
	CY = (0.094360)*sailStates.alpha + (-0.024675)*sailStates.beta + (0.269355)*sailStates.p + (0.769436)*sailStates.q + (0.017627)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.213106)*sailStates.alpha + (-0.176006)*sailStates.beta + (-1.178504)*sailStates.p + (9.279637)*sailStates.q + (0.540398)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.893346)*sailStates.alpha + (0.169334)*sailStates.beta + (8.890838)*sailStates.p + (-136.832825)*sailStates.q + (-1.594016)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (0.107771)*sailStates.alpha + (-0.010611)*sailStates.beta + (-0.701351)*sailStates.p + (2.885720)*sailStates.q + (-0.005462)*sailStates.r + (-0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end