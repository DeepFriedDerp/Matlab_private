function [aeroForces] = paramSpace_4_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.249752)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.761522)*sailStates.p + (38.319473)*sailStates.q + (-1.416980)*sailStates.r + (0.011225)*sailStates.de;
	CD = -0.164600;
	CY = (0.023002)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.502498)*sailStates.p + (0.520429)*sailStates.q + (-0.070640)*sailStates.r + (0.000112)*sailStates.de;

	Cl = (1.458581)*sailStates.alpha + (0.230376)*sailStates.beta + (-1.365219)*sailStates.p + (11.852380)*sailStates.q + (-1.135641)*sailStates.r + (0.000599)*sailStates.de;
	Cm = (-13.718097)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.839440)*sailStates.p + (-141.704483)*sailStates.q + (4.765902)*sailStates.r + (-0.069692)*sailStates.de;
	Cn = (0.105123)*sailStates.alpha + (0.032377)*sailStates.beta + (0.947125)*sailStates.p + (-4.012587)*sailStates.q + (0.000462)*sailStates.r + (-0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end