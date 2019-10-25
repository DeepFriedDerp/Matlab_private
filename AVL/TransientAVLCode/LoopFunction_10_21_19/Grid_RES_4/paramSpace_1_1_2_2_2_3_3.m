function [aeroForces] = paramSpace_1_1_2_2_2_3_3(sailStates,airStates)

	CL = (3.993178)*sailStates.alpha + (0.001542)*sailStates.beta + (-2.771115)*sailStates.p + (34.738178)*sailStates.q + (-0.116484)*sailStates.r + (0.009913)*sailStates.de;
	CD = -0.274000;
	CY = (0.068738)*sailStates.alpha + (-0.025775)*sailStates.beta + (0.193626)*sailStates.p + (0.301043)*sailStates.q + (0.038504)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.419489)*sailStates.alpha + (-0.121678)*sailStates.beta + (-1.494832)*sailStates.p + (12.538154)*sailStates.q + (0.127437)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-14.378188)*sailStates.alpha + (-0.033742)*sailStates.beta + (10.024037)*sailStates.p + (-144.677322)*sailStates.q + (0.471251)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.138603)*sailStates.alpha + (-0.030176)*sailStates.beta + (-0.722223)*sailStates.p + (4.139535)*sailStates.q + (-0.059162)*sailStates.r + (-0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end