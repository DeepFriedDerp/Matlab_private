function [aeroForces] = paramSpace_1_4_1_3_1_3_1(sailStates,airStates)

	CL = (3.849661)*sailStates.alpha + (0.049405)*sailStates.beta + (-2.174205)*sailStates.p + (30.538847)*sailStates.q + (-0.103270)*sailStates.r + (0.009772)*sailStates.de;
	CD = -0.083290;
	CY = (-0.099356)*sailStates.alpha + (-0.027177)*sailStates.beta + (0.170360)*sailStates.p + (-0.684401)*sailStates.q + (0.033960)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.017609)*sailStates.alpha + (-0.056664)*sailStates.beta + (-0.894007)*sailStates.p + (6.618621)*sailStates.q + (0.101397)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-14.237237)*sailStates.alpha + (-0.241052)*sailStates.beta + (7.886043)*sailStates.p + (-127.495163)*sailStates.q + (0.444265)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.383756)*sailStates.alpha + (-0.003594)*sailStates.beta + (-0.529477)*sailStates.p + (3.446187)*sailStates.q + (-0.050125)*sailStates.r + (0.000251)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end