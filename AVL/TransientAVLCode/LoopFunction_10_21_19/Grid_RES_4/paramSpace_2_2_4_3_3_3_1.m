function [aeroForces] = paramSpace_2_2_4_3_3_3_1(sailStates,airStates)

	CL = (4.161134)*sailStates.alpha + (0.033882)*sailStates.beta + (-2.284717)*sailStates.p + (32.082470)*sailStates.q + (0.235517)*sailStates.r + (0.010806)*sailStates.de;
	CD = -0.121270;
	CY = (0.033427)*sailStates.alpha + (-0.025085)*sailStates.beta + (0.185085)*sailStates.p + (0.432842)*sailStates.q + (0.012177)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.132290)*sailStates.alpha + (-0.104554)*sailStates.beta + (-1.003444)*sailStates.p + (7.817240)*sailStates.q + (0.337978)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.940845)*sailStates.alpha + (-0.168225)*sailStates.beta + (7.980375)*sailStates.p + (-129.813766)*sailStates.q + (-0.833285)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.161990)*sailStates.alpha + (-0.007467)*sailStates.beta + (-0.466936)*sailStates.p + (1.842848)*sailStates.q + (-0.004515)*sailStates.r + (-0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end