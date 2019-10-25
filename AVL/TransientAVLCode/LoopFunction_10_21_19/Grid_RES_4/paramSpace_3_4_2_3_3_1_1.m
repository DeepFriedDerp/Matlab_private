function [aeroForces] = paramSpace_3_4_2_3_3_1_1(sailStates,airStates)

	CL = (4.224244)*sailStates.alpha + (0.116378)*sailStates.beta + (-2.274989)*sailStates.p + (31.777889)*sailStates.q + (-0.489928)*sailStates.r + (0.010612)*sailStates.de;
	CD = -0.206430;
	CY = (0.104227)*sailStates.alpha + (-0.025328)*sailStates.beta + (-0.331783)*sailStates.p + (0.563442)*sailStates.q + (0.021726)*sailStates.r + (0.000120)*sailStates.de;

	Cl = (1.124723)*sailStates.alpha + (0.175535)*sailStates.beta + (-0.935201)*sailStates.p + (6.919901)*sailStates.q + (-0.532697)*sailStates.r + (-0.000118)*sailStates.de;
	Cm = (-14.913903)*sailStates.alpha + (-0.491346)*sailStates.beta + (8.024954)*sailStates.p + (-129.238022)*sailStates.q + (1.662583)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (-0.398603)*sailStates.alpha + (-0.007412)*sailStates.beta + (0.772139)*sailStates.p + (-4.017152)*sailStates.q + (-0.011688)*sailStates.r + (-0.000217)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end