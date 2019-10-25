function [aeroForces] = paramSpace_1_1_2_2_1_2_3(sailStates,airStates)

	CL = (3.729182)*sailStates.alpha + (-0.155224)*sailStates.beta + (-2.896693)*sailStates.p + (38.185074)*sailStates.q + (-0.818411)*sailStates.r + (0.010807)*sailStates.de;
	CD = 0.074620;
	CY = (-0.081529)*sailStates.alpha + (-0.023593)*sailStates.beta + (-0.118566)*sailStates.p + (-0.491415)*sailStates.q + (-0.020906)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.321123)*sailStates.alpha + (0.026408)*sailStates.beta + (-1.542004)*sailStates.p + (13.375973)*sailStates.q + (-0.561509)*sailStates.r + (0.001009)*sailStates.de;
	Cm = (-13.470544)*sailStates.alpha + (0.562505)*sailStates.beta + (9.764179)*sailStates.p + (-146.474228)*sailStates.q + (2.771967)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.326174)*sailStates.alpha + (0.008332)*sailStates.beta + (0.042835)*sailStates.p + (1.140443)*sailStates.q + (-0.043513)*sailStates.r + (0.000128)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end