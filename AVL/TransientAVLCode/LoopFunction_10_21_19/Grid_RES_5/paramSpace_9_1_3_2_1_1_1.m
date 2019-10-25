function [aeroForces] = paramSpace_9_1_3_2_1_1_1(sailStates,airStates)

	CL = (4.135142)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.352476)*sailStates.p + (32.915554)*sailStates.q + (-0.261500)*sailStates.r + (0.010920)*sailStates.de;
	CD = -0.066670;
	CY = (-0.034601)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.144428)*sailStates.p + (-0.381223)*sailStates.q + (0.005030)*sailStates.r + (-0.000082)*sailStates.de;

	Cl = (1.147442)*sailStates.alpha + (0.087646)*sailStates.beta + (-1.034159)*sailStates.p + (8.076680)*sailStates.q + (-0.292654)*sailStates.r + (0.000058)*sailStates.de;
	Cm = (-14.827267)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.136758)*sailStates.p + (-131.546402)*sailStates.q + (0.884875)*sailStates.r + (-0.069816)*sailStates.de;
	Cn = (-0.112413)*sailStates.alpha + (-0.003061)*sailStates.beta + (0.371961)*sailStates.p + (-1.550473)*sailStates.q + (-0.001511)*sailStates.r + (0.000073)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end