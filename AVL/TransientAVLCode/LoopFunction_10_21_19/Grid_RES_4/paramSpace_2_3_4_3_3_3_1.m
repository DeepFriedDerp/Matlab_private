function [aeroForces] = paramSpace_2_3_4_3_3_3_1(sailStates,airStates)

	CL = (4.161134)*sailStates.alpha + (-0.033883)*sailStates.beta + (-2.284717)*sailStates.p + (32.082470)*sailStates.q + (0.235517)*sailStates.r + (0.010806)*sailStates.de;
	CD = -0.121270;
	CY = (0.033427)*sailStates.alpha + (-0.024868)*sailStates.beta + (0.185085)*sailStates.p + (0.432842)*sailStates.q + (0.012177)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.077650)*sailStates.alpha + (-0.115416)*sailStates.beta + (-0.970793)*sailStates.p + (7.413365)*sailStates.q + (0.340076)*sailStates.r + (-0.000052)*sailStates.de;
	Cm = (-14.940845)*sailStates.alpha + (0.168225)*sailStates.beta + (7.980375)*sailStates.p + (-129.813766)*sailStates.q + (-0.833285)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.168049)*sailStates.alpha + (-0.006950)*sailStates.beta + (-0.464796)*sailStates.p + (1.816376)*sailStates.q + (-0.004378)*sailStates.r + (-0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end