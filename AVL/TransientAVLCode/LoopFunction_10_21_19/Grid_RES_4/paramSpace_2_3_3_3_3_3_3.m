function [aeroForces] = paramSpace_2_3_3_3_3_3_3(sailStates,airStates)

	CL = (4.140272)*sailStates.alpha + (-0.023591)*sailStates.beta + (-2.804989)*sailStates.p + (36.315716)*sailStates.q + (0.159274)*sailStates.r + (0.011026)*sailStates.de;
	CD = -0.111890;
	CY = (0.085751)*sailStates.alpha + (-0.024795)*sailStates.beta + (0.149143)*sailStates.p + (0.563441)*sailStates.q + (0.009795)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.317497)*sailStates.alpha + (-0.100600)*sailStates.beta + (-1.395857)*sailStates.p + (11.359508)*sailStates.q + (0.260785)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.794401)*sailStates.alpha + (0.112202)*sailStates.beta + (9.714894)*sailStates.p + (-144.107040)*sailStates.q + (-0.559171)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.001596)*sailStates.alpha + (-0.006131)*sailStates.beta + (-0.427470)*sailStates.p + (1.769867)*sailStates.q + (-0.005000)*sailStates.r + (-0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end