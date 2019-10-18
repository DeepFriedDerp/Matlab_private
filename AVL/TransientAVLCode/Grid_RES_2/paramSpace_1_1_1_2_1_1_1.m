function [aeroForces] = paramSpace_1_1_1_2_1_1_1(sailStates,airStates)

	CL = (4.733898)*sailStates.alpha + (-0.001790)*sailStates.beta + (-2.501469)*sailStates.p + (33.194195)*sailStates.q + (-0.720697)*sailStates.r + (0.009918)*sailStates.de;
	CD = -0.482050;
	CY = (0.840495)*sailStates.alpha + (-0.040746)*sailStates.beta + (-0.445215)*sailStates.p + (6.822913)*sailStates.q + (-0.059097)*sailStates.r + (0.001450)*sailStates.de;

	Cl = (1.475608)*sailStates.alpha + (-0.100937)*sailStates.beta + (-1.290832)*sailStates.p + (11.125002)*sailStates.q + (-0.326893)*sailStates.r + (0.000439)*sailStates.de;
	Cm = (-15.615326)*sailStates.alpha + (-0.104407)*sailStates.beta + (8.390577)*sailStates.p + (-134.773361)*sailStates.q + (2.362206)*sailStates.r + (-0.068067)*sailStates.de;
	Cn = (-0.718321)*sailStates.alpha + (0.007641)*sailStates.beta + (0.631685)*sailStates.p + (-7.265774)*sailStates.q + (0.063150)*sailStates.r + (-0.001961)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end