function [aeroForces] = paramSpace_2_2_3_1_2_3_2(sailStates,airStates)

	CL = (6.241454)*sailStates.alpha + (0.153432)*sailStates.beta + (-2.508801)*sailStates.p + (32.301521)*sailStates.q + (1.892871)*sailStates.r + (0.010520)*sailStates.de;
	CD = -2.217470;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.981861)*sailStates.p + (0.000000)*sailStates.q + (0.064355)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.837788)*sailStates.alpha + (-0.449165)*sailStates.beta + (-1.206083)*sailStates.p + (9.286073)*sailStates.q + (1.861250)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-15.745238)*sailStates.alpha + (-0.617769)*sailStates.beta + (9.251950)*sailStates.p + (-137.194580)*sailStates.q + (-6.426798)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.460957)*sailStates.alpha + (-0.033389)*sailStates.beta + (-2.267991)*sailStates.p + (10.498528)*sailStates.q + (-0.021542)*sailStates.r + (0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end