function [aeroForces] = paramSpace_1_1_4_2_2_2_1(sailStates,airStates)

	CL = (3.818306)*sailStates.alpha + (-0.151918)*sailStates.beta + (-2.074756)*sailStates.p + (31.639072)*sailStates.q + (-0.811143)*sailStates.r + (0.010420)*sailStates.de;
	CD = 0.049650;
	CY = (-0.011653)*sailStates.alpha + (-0.023922)*sailStates.beta + (-0.150777)*sailStates.p + (-0.301043)*sailStates.q + (-0.030024)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.040160)*sailStates.alpha + (0.036571)*sailStates.beta + (-0.883881)*sailStates.p + (7.359228)*sailStates.q + (-0.519400)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-13.628725)*sailStates.alpha + (0.467349)*sailStates.beta + (6.871465)*sailStates.p + (-122.964470)*sailStates.q + (2.703586)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.022534)*sailStates.alpha + (0.014446)*sailStates.beta + (0.227990)*sailStates.p + (-0.461893)*sailStates.q + (-0.023231)*sailStates.r + (0.000058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end