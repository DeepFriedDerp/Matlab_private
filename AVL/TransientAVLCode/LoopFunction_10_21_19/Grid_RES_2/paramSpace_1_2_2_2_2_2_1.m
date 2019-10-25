function [aeroForces] = paramSpace_1_2_2_2_2_2_1(sailStates,airStates)

	CL = (4.027384)*sailStates.alpha + (-0.001077)*sailStates.beta + (-2.280147)*sailStates.p + (31.973907)*sailStates.q + (-0.163233)*sailStates.r + (0.010528)*sailStates.de;
	CD = -0.049080;
	CY = (0.030502)*sailStates.alpha + (-0.024521)*sailStates.beta + (0.069143)*sailStates.p + (0.299436)*sailStates.q + (0.009124)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.057314)*sailStates.alpha + (-0.041068)*sailStates.beta + (-0.969058)*sailStates.p + (7.451824)*sailStates.q + (0.036453)*sailStates.r + (-0.000043)*sailStates.de;
	Cm = (-14.763784)*sailStates.alpha + (0.066449)*sailStates.beta + (7.966262)*sailStates.p + (-129.699127)*sailStates.q + (0.540385)*sailStates.r + (-0.068159)*sailStates.de;
	Cn = (0.136006)*sailStates.alpha + (-0.004983)*sailStates.beta + (-0.259906)*sailStates.p + (1.181897)*sailStates.q + (-0.012797)*sailStates.r + (-0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end