function [aeroForces] = paramSpace_1_3_4_1_1_2_2(sailStates,airStates)

	CL = (3.883740)*sailStates.alpha + (0.038466)*sailStates.beta + (-2.530393)*sailStates.p + (34.934895)*sailStates.q + (-0.547235)*sailStates.r + (0.010777)*sailStates.de;
	CD = 0.044850;
	CY = (-0.202310)*sailStates.alpha + (-0.026573)*sailStates.beta + (0.064585)*sailStates.p + (-1.664521)*sailStates.q + (0.012668)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (1.152687)*sailStates.alpha + (0.045307)*sailStates.beta + (-1.178419)*sailStates.p + (9.618264)*sailStates.q + (-0.289101)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-14.258698)*sailStates.alpha + (-0.115717)*sailStates.beta + (8.756332)*sailStates.p + (-137.222183)*sailStates.q + (1.863408)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.383855)*sailStates.alpha + (0.009912)*sailStates.beta + (-0.279180)*sailStates.p + (3.083694)*sailStates.q + (-0.066440)*sailStates.r + (0.000473)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end