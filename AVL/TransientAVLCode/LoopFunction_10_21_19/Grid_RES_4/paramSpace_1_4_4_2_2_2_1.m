function [aeroForces] = paramSpace_1_4_4_2_2_2_1(sailStates,airStates)

	CL = (3.818306)*sailStates.alpha + (0.151918)*sailStates.beta + (-2.074756)*sailStates.p + (31.639072)*sailStates.q + (-0.811143)*sailStates.r + (0.010420)*sailStates.de;
	CD = 0.049650;
	CY = (-0.011653)*sailStates.alpha + (-0.025650)*sailStates.beta + (-0.150777)*sailStates.p + (-0.301043)*sailStates.q + (-0.030024)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (0.884076)*sailStates.alpha + (0.133227)*sailStates.beta + (-0.789476)*sailStates.p + (6.171344)*sailStates.q + (-0.500749)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-13.628725)*sailStates.alpha + (-0.467349)*sailStates.beta + (6.871465)*sailStates.p + (-122.964470)*sailStates.q + (2.703586)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.032219)*sailStates.alpha + (0.019329)*sailStates.beta + (0.246768)*sailStates.p + (-0.698178)*sailStates.q + (-0.019521)*sailStates.r + (0.000058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end