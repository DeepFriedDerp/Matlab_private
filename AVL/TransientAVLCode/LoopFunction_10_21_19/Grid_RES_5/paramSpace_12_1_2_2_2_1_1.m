function [aeroForces] = paramSpace_12_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.089023)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.299097)*sailStates.p + (31.965281)*sailStates.q + (-0.001254)*sailStates.r + (0.010540)*sailStates.de;
	CD = -0.092020;
	CY = (0.079511)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.182801)*sailStates.p + (0.520429)*sailStates.q + (0.025673)*sailStates.r + (0.000111)*sailStates.de;

	Cl = (1.166461)*sailStates.alpha + (0.070524)*sailStates.beta + (-1.012821)*sailStates.p + (7.846968)*sailStates.q + (-0.164320)*sailStates.r + (0.000082)*sailStates.de;
	Cm = (-14.973776)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.166951)*sailStates.p + (-130.856766)*sailStates.q + (-0.014666)*sailStates.r + (-0.068597)*sailStates.de;
	Cn = (-0.316482)*sailStates.alpha + (-0.009912)*sailStates.beta + (0.510354)*sailStates.p + (-3.030881)*sailStates.q + (-0.028641)*sailStates.r + (-0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end