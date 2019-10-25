function [aeroForces] = paramSpace_2_2_3_3_3_3_3(sailStates,airStates)

	CL = (4.140272)*sailStates.alpha + (0.023591)*sailStates.beta + (-2.804989)*sailStates.p + (36.315716)*sailStates.q + (0.159274)*sailStates.r + (0.011026)*sailStates.de;
	CD = -0.111890;
	CY = (0.085751)*sailStates.alpha + (-0.025157)*sailStates.beta + (0.149143)*sailStates.p + (0.563441)*sailStates.q + (0.009795)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.364997)*sailStates.alpha + (-0.094035)*sailStates.beta + (-1.428506)*sailStates.p + (11.763385)*sailStates.q + (0.258660)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.794402)*sailStates.alpha + (-0.112202)*sailStates.beta + (9.714893)*sailStates.p + (-144.107025)*sailStates.q + (-0.559171)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (-0.003820)*sailStates.alpha + (-0.006626)*sailStates.beta + (-0.429610)*sailStates.p + (1.796338)*sailStates.q + (-0.005139)*sailStates.r + (-0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end