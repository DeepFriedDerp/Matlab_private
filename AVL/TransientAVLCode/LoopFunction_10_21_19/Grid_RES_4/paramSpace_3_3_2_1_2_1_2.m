function [aeroForces] = paramSpace_3_3_2_1_2_1_2(sailStates,airStates)

	CL = (6.241454)*sailStates.alpha + (0.153432)*sailStates.beta + (-2.508801)*sailStates.p + (32.301521)*sailStates.q + (-1.892872)*sailStates.r + (0.010520)*sailStates.de;
	CD = -2.217470;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.981861)*sailStates.p + (-0.000000)*sailStates.q + (0.064355)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.784639)*sailStates.alpha + (0.531891)*sailStates.beta + (-1.173433)*sailStates.p + (8.882199)*sailStates.q + (-1.863376)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-15.745238)*sailStates.alpha + (-0.617769)*sailStates.beta + (9.251950)*sailStates.p + (-137.194580)*sailStates.q + (6.426798)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.500485)*sailStates.alpha + (-0.030913)*sailStates.beta + (2.265851)*sailStates.p + (-10.472057)*sailStates.q + (-0.021403)*sailStates.r + (-0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end