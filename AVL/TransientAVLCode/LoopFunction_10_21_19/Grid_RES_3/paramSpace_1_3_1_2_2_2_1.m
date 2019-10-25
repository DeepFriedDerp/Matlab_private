function [aeroForces] = paramSpace_1_3_1_2_2_2_1(sailStates,airStates)

	CL = (3.768605)*sailStates.alpha + (0.169561)*sailStates.beta + (-2.094212)*sailStates.p + (31.768906)*sailStates.q + (-0.746002)*sailStates.r + (0.010320)*sailStates.de;
	CD = 0.072800;
	CY = (-0.003818)*sailStates.alpha + (-0.025572)*sailStates.beta + (-0.173415)*sailStates.p + (-0.267957)*sailStates.q + (-0.030552)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (0.906192)*sailStates.alpha + (0.134029)*sailStates.beta + (-0.803576)*sailStates.p + (6.233918)*sailStates.q + (-0.509878)*sailStates.r + (-0.000292)*sailStates.de;
	Cm = (-13.369812)*sailStates.alpha + (-0.684670)*sailStates.beta + (6.976927)*sailStates.p + (-123.711845)*sailStates.q + (2.541675)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (-0.043825)*sailStates.alpha + (0.018647)*sailStates.beta + (0.275893)*sailStates.p + (-0.643100)*sailStates.q + (-0.016520)*sailStates.r + (0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end