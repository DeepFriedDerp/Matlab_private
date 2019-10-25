function [aeroForces] = paramSpace_4_4_1_3_3_2_3(sailStates,airStates)

	CL = (3.781573)*sailStates.alpha + (-0.169315)*sailStates.beta + (-2.727605)*sailStates.p + (36.997086)*sailStates.q + (0.940999)*sailStates.r + (0.010733)*sailStates.de;
	CD = 0.071510;
	CY = (0.053894)*sailStates.alpha + (-0.025633)*sailStates.beta + (0.151496)*sailStates.p + (0.294837)*sailStates.q + (-0.030166)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.170441)*sailStates.alpha + (-0.148135)*sailStates.beta + (-1.322364)*sailStates.p + (11.190372)*sailStates.q + (0.607170)*sailStates.r + (0.000563)*sailStates.de;
	Cm = (-13.647007)*sailStates.alpha + (0.525779)*sailStates.beta + (9.101812)*sailStates.p + (-141.543854)*sailStates.q + (-3.142528)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (-0.236643)*sailStates.alpha + (0.022260)*sailStates.beta + (-0.142429)*sailStates.p + (-0.285741)*sailStates.q + (-0.040370)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end