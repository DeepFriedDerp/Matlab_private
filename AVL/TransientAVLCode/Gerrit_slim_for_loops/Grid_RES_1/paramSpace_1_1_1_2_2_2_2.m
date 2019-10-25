function [aeroForces] = paramSpace_1_1_1_2_2_2_2(sailStates,airStates)

	CL = (6.738209)*sailStates.alpha + (0.154860)*sailStates.beta + (-2.488780)*sailStates.p + (31.535652)*sailStates.q + (-0.774643)*sailStates.r + (0.009173)*sailStates.de;
	CD = -2.106900;
	CY = (1.686107)*sailStates.alpha + (-0.056708)*sailStates.beta + (-0.727120)*sailStates.p + (13.646749)*sailStates.q + (-0.096694)*sailStates.r + (0.002899)*sailStates.de;

	Cl = (1.126444)*sailStates.alpha + (-0.238272)*sailStates.beta + (-1.351735)*sailStates.p + (11.890974)*sailStates.q + (-0.172267)*sailStates.r + (0.000416)*sailStates.de;
	Cm = (-17.412416)*sailStates.alpha + (-0.840470)*sailStates.beta + (8.316795)*sailStates.p + (-134.270523)*sailStates.q + (2.451293)*sailStates.r + (-0.068017)*sailStates.de;
	Cn = (-1.613810)*sailStates.alpha + (0.006264)*sailStates.beta + (1.045374)*sailStates.p + (-14.144341)*sailStates.q + (0.139794)*sailStates.r + (-0.003916)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end