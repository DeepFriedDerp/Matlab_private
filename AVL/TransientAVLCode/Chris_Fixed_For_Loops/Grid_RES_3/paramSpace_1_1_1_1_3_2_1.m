function [aeroForces] = paramSpace_1_1_1_1_3_2_1(sailStates,airStates)

	CL = (-0.109037)*sailStates.alpha + (0.141939)*sailStates.beta + (-6.518022)*sailStates.p + (60.914082)*sailStates.q + (0.716645)*sailStates.r + (0.011288)*sailStates.de;
	CD = -3.633670;
	CY = (1.750949)*sailStates.alpha + (-0.029695)*sailStates.beta + (0.739734)*sailStates.p + (3.418907)*sailStates.q + (0.130110)*sailStates.r + (0.000784)*sailStates.de;

	Cl = (-2.422618)*sailStates.alpha + (-0.507458)*sailStates.beta + (-4.604086)*sailStates.p + (40.766010)*sailStates.q + (1.039821)*sailStates.r + (0.006439)*sailStates.de;
	Cm = (11.546560)*sailStates.alpha + (-0.577442)*sailStates.beta + (23.885103)*sailStates.p + (-253.343414)*sailStates.q + (-2.245352)*sailStates.r + (-0.085005)*sailStates.de;
	Cn = (-7.092097)*sailStates.alpha + (-0.097687)*sailStates.beta + (-2.590627)*sailStates.p + (12.864594)*sailStates.q + (-0.129950)*sailStates.r + (-0.000592)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end