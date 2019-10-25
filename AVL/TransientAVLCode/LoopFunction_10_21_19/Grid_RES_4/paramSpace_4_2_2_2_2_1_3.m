function [aeroForces] = paramSpace_4_2_2_2_2_1_3(sailStates,airStates)

	CL = (4.102160)*sailStates.alpha + (-0.006835)*sailStates.beta + (-2.790790)*sailStates.p + (34.957932)*sailStates.q + (0.115023)*sailStates.r + (0.010159)*sailStates.de;
	CD = -0.297190;
	CY = (-0.071246)*sailStates.alpha + (-0.025286)*sailStates.beta + (-0.206448)*sailStates.p + (-0.301043)*sailStates.q + (0.041076)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.396420)*sailStates.alpha + (0.119031)*sailStates.beta + (-1.472659)*sailStates.p + (12.215895)*sailStates.q + (-0.152321)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-14.796154)*sailStates.alpha + (0.053907)*sailStates.beta + (10.096678)*sailStates.p + (-145.703583)*sailStates.q + (-0.443930)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.135085)*sailStates.alpha + (-0.025676)*sailStates.beta + (0.735495)*sailStates.p + (-4.066748)*sailStates.q + (-0.057800)*sailStates.r + (0.000030)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end