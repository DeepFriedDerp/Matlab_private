function [aeroForces] = paramSpace_4_1_2_2_2_2_2(sailStates,airStates)

	CL = (3.989168)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.702360)*sailStates.p + (35.584988)*sailStates.q + (-0.336661)*sailStates.r + (0.010676)*sailStates.de;
	CD = -0.016460;
	CY = (0.064437)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.001043)*sailStates.p + (0.520429)*sailStates.q + (0.000128)*sailStates.r + (0.000112)*sailStates.de;

	Cl = (1.309711)*sailStates.alpha + (-0.021395)*sailStates.beta + (-1.346502)*sailStates.p + (11.130419)*sailStates.q + (-0.128916)*sailStates.r + (0.000599)*sailStates.de;
	Cm = (-14.563103)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.347080)*sailStates.p + (-141.704483)*sailStates.q + (1.153853)*sailStates.r + (-0.069692)*sailStates.de;
	Cn = (0.102913)*sailStates.alpha + (-0.003007)*sailStates.beta + (-0.190152)*sailStates.p + (1.124428)*sailStates.q + (-0.018240)*sailStates.r + (-0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end