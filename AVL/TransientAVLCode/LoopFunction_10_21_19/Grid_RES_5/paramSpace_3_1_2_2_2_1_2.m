function [aeroForces] = paramSpace_3_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.211640)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.736437)*sailStates.p + (38.781399)*sailStates.q + (-1.605403)*sailStates.r + (0.011153)*sailStates.de;
	CD = -0.160630;
	CY = (0.023346)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.543218)*sailStates.p + (0.546500)*sailStates.q + (-0.095803)*sailStates.r + (0.000117)*sailStates.de;

	Cl = (1.454102)*sailStates.alpha + (0.249811)*sailStates.beta + (-1.350048)*sailStates.p + (11.986403)*sailStates.q + (-1.266217)*sailStates.r + (0.000588)*sailStates.de;
	Cm = (-13.260717)*sailStates.alpha + (0.000000)*sailStates.beta + (8.549283)*sailStates.p + (-140.819473)*sailStates.q + (5.371148)*sailStates.r + (-0.068914)*sailStates.de;
	Cn = (0.142509)*sailStates.alpha + (0.044048)*sailStates.beta + (1.005009)*sailStates.p + (-4.122681)*sailStates.q + (-0.004090)*sailStates.r + (-0.000237)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end