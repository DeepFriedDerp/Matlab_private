function [aeroForces] = paramSpace_4_1_2_2_1_2_2(sailStates,airStates)

	CL = (3.944135)*sailStates.alpha + (0.220884)*sailStates.beta + (-2.439309)*sailStates.p + (35.114052)*sailStates.q + (1.168297)*sailStates.r + (0.010513)*sailStates.de;
	CD = 0.029710;
	CY = (-0.097529)*sailStates.alpha + (-0.027114)*sailStates.beta + (0.333006)*sailStates.p + (-0.756269)*sailStates.q + (-0.066212)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.346143)*sailStates.alpha + (-0.057899)*sailStates.beta + (-1.187712)*sailStates.p + (10.463655)*sailStates.q + (0.828825)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-13.631642)*sailStates.alpha + (-0.758172)*sailStates.beta + (7.855132)*sailStates.p + (-132.741776)*sailStates.q + (-3.889994)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (-0.017038)*sailStates.alpha + (0.026721)*sailStates.beta + (-0.539456)*sailStates.p + (2.272726)*sailStates.q + (-0.010641)*sailStates.r + (0.000260)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end