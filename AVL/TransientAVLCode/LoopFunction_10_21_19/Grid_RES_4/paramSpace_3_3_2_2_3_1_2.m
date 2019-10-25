function [aeroForces] = paramSpace_3_3_2_2_3_1_2(sailStates,airStates)

	CL = (4.685112)*sailStates.alpha + (0.068260)*sailStates.beta + (-2.548194)*sailStates.p + (33.710560)*sailStates.q + (-0.880959)*sailStates.r + (0.010814)*sailStates.de;
	CD = -0.543490;
	CY = (0.093005)*sailStates.alpha + (-0.025223)*sailStates.beta + (-0.533120)*sailStates.p + (0.769434)*sailStates.q + (0.034915)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.501875)*sailStates.alpha + (0.254599)*sailStates.beta + (-1.188265)*sailStates.p + (9.251995)*sailStates.q + (-0.892712)*sailStates.r + (0.000318)*sailStates.de;
	Cm = (-15.530739)*sailStates.alpha + (-0.278762)*sailStates.beta + (9.070818)*sailStates.p + (-137.556381)*sailStates.q + (2.986491)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.367741)*sailStates.alpha + (-0.014467)*sailStates.beta + (1.234372)*sailStates.p + (-6.352699)*sailStates.q + (-0.017296)*sailStates.r + (-0.000318)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end