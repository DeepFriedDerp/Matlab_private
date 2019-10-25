function [aeroForces] = paramSpace_1_1_4_2_1_3_3(sailStates,airStates)

	CL = (4.218775)*sailStates.alpha + (0.069622)*sailStates.beta + (-2.795063)*sailStates.p + (34.516407)*sailStates.q + (0.095198)*sailStates.r + (0.010094)*sailStates.de;
	CD = -0.421100;
	CY = (0.007122)*sailStates.alpha + (-0.023479)*sailStates.beta + (0.342742)*sailStates.p + (-0.455225)*sailStates.q + (0.068127)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.535563)*sailStates.alpha + (-0.150635)*sailStates.beta + (-1.509525)*sailStates.p + (12.494370)*sailStates.q + (0.333858)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-15.027724)*sailStates.alpha + (-0.388024)*sailStates.beta + (10.303952)*sailStates.p + (-145.756378)*sailStates.q + (-0.259249)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.173097)*sailStates.alpha + (-0.041650)*sailStates.beta + (-1.019332)*sailStates.p + (5.882287)*sailStates.q + (-0.076893)*sailStates.r + (0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end