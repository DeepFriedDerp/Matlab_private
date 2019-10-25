function [aeroForces] = paramSpace_3_4_1_3_3_2_3(sailStates,airStates)

	CL = (3.967701)*sailStates.alpha + (-0.023278)*sailStates.beta + (-2.812780)*sailStates.p + (36.758976)*sailStates.q + (0.221327)*sailStates.r + (0.011048)*sailStates.de;
	CD = 0.031450;
	CY = (0.051662)*sailStates.alpha + (-0.025111)*sailStates.beta + (-0.017341)*sailStates.p + (0.432842)*sailStates.q + (0.001091)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.255496)*sailStates.alpha + (-0.022896)*sailStates.beta + (-1.365892)*sailStates.p + (11.070704)*sailStates.q + (0.109373)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-14.455472)*sailStates.alpha + (-0.000387)*sailStates.beta + (9.621117)*sailStates.p + (-143.531296)*sailStates.q + (-0.722451)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (-0.113471)*sailStates.alpha + (0.001435)*sailStates.beta + (0.086519)*sailStates.p + (-0.848206)*sailStates.q + (-0.007187)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end