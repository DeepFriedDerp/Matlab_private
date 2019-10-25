function [aeroForces] = paramSpace_1_1_2_3_1_2_1(sailStates,airStates)

	CL = (3.744953)*sailStates.alpha + (-0.183137)*sailStates.beta + (-2.224722)*sailStates.p + (32.820072)*sailStates.q + (-0.756718)*sailStates.r + (0.010314)*sailStates.de;
	CD = 0.076460;
	CY = (-0.071593)*sailStates.alpha + (-0.022537)*sailStates.beta + (-0.118391)*sailStates.p + (-0.684401)*sailStates.q + (-0.023525)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.096939)*sailStates.alpha + (0.037974)*sailStates.beta + (-1.004478)*sailStates.p + (8.419253)*sailStates.q + (-0.507690)*sailStates.r + (0.000159)*sailStates.de;
	Cm = (-13.388792)*sailStates.alpha + (0.696705)*sailStates.beta + (7.462833)*sailStates.p + (-127.495163)*sailStates.q + (2.571887)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.163107)*sailStates.alpha + (0.011671)*sailStates.beta + (0.119701)*sailStates.p + (0.601936)*sailStates.q + (-0.037496)*sailStates.r + (0.000188)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end