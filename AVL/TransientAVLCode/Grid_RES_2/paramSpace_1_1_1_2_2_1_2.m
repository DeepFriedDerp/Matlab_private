function [aeroForces] = paramSpace_1_1_1_2_2_1_2(sailStates,airStates)

	CL = (6.006444)*sailStates.alpha + (0.220761)*sailStates.beta + (-2.525323)*sailStates.p + (31.333843)*sailStates.q + (-0.299901)*sailStates.r + (0.009178)*sailStates.de;
	CD = -2.101900;
	CY = (1.445292)*sailStates.alpha + (-0.052424)*sailStates.beta + (-0.432929)*sailStates.p + (11.815104)*sailStates.q + (-0.057833)*sailStates.r + (0.002513)*sailStates.de;

	Cl = (0.469343)*sailStates.alpha + (-0.280216)*sailStates.beta + (-1.374486)*sailStates.p + (11.827116)*sailStates.q + (0.216290)*sailStates.r + (0.000498)*sailStates.de;
	Cm = (-15.318684)*sailStates.alpha + (-1.062332)*sailStates.beta + (8.736362)*sailStates.p + (-136.000290)*sailStates.q + (0.885784)*sailStates.r + (-0.068190)*sailStates.de;
	Cn = (-1.384935)*sailStates.alpha + (-0.009225)*sailStates.beta + (0.435072)*sailStates.p + (-10.011214)*sailStates.q + (0.110802)*sailStates.r + (-0.003350)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end