function [aeroForces] = paramSpace_4_1_2_3_3_1_3(sailStates,airStates)

	CL = (3.913442)*sailStates.alpha + (0.036929)*sailStates.beta + (-2.676873)*sailStates.p + (34.716297)*sailStates.q + (0.288695)*sailStates.r + (0.010186)*sailStates.de;
	CD = -0.106570;
	CY = (0.019656)*sailStates.alpha + (-0.023878)*sailStates.beta + (-0.137126)*sailStates.p + (0.294836)*sailStates.q + (0.027265)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.376217)*sailStates.alpha + (0.079207)*sailStates.beta + (-1.400588)*sailStates.p + (11.765471)*sailStates.q + (0.036168)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-14.402140)*sailStates.alpha + (-0.071500)*sailStates.beta + (9.524034)*sailStates.p + (-141.543869)*sailStates.q + (-1.019880)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (-0.251794)*sailStates.alpha + (-0.020043)*sailStates.beta + (0.544176)*sailStates.p + (-3.602675)*sailStates.q + (-0.060051)*sailStates.r + (-0.000119)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end