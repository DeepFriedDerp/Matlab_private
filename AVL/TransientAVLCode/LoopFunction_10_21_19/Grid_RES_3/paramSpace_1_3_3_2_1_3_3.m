function [aeroForces] = paramSpace_1_3_3_2_1_3_3(sailStates,airStates)

	CL = (4.295662)*sailStates.alpha + (-0.080267)*sailStates.beta + (-2.828682)*sailStates.p + (34.920654)*sailStates.q + (0.213368)*sailStates.r + (0.010274)*sailStates.de;
	CD = -0.443040;
	CY = (0.006969)*sailStates.alpha + (-0.025948)*sailStates.beta + (0.371535)*sailStates.p + (-0.491416)*sailStates.q + (0.065465)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.441239)*sailStates.alpha + (-0.176131)*sailStates.beta + (-1.436006)*sailStates.p + (11.465945)*sailStates.q + (0.432674)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-15.118255)*sailStates.alpha + (0.406861)*sailStates.beta + (10.371937)*sailStates.p + (-146.474228)*sailStates.q + (-0.674806)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.163035)*sailStates.alpha + (-0.020836)*sailStates.beta + (-1.038853)*sailStates.p + (5.769254)*sailStates.q + (-0.062444)*sailStates.r + (0.000209)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end