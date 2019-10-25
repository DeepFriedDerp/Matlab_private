function [aeroForces] = paramSpace_1_1_1_2_2_2_1(sailStates,airStates)

	CL = (3.768605)*sailStates.alpha + (-0.169561)*sailStates.beta + (-2.094211)*sailStates.p + (31.768906)*sailStates.q + (-0.746002)*sailStates.r + (0.010320)*sailStates.de;
	CD = 0.072800;
	CY = (-0.003818)*sailStates.alpha + (-0.024090)*sailStates.beta + (-0.173415)*sailStates.p + (-0.267957)*sailStates.q + (-0.030552)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.045569)*sailStates.alpha + (0.056507)*sailStates.beta + (-0.888194)*sailStates.p + (7.294790)*sailStates.q + (-0.524900)*sailStates.r + (-0.000066)*sailStates.de;
	Cm = (-13.369812)*sailStates.alpha + (0.684670)*sailStates.beta + (6.976925)*sailStates.p + (-123.711861)*sailStates.q + (2.541675)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (0.004067)*sailStates.alpha + (0.014949)*sailStates.beta + (0.260972)*sailStates.p + (-0.456040)*sailStates.q + (-0.019168)*sailStates.r + (0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end