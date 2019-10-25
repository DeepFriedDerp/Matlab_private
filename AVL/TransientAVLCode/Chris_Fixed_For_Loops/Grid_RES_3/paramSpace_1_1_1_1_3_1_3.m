function [aeroForces] = paramSpace_1_1_1_1_3_1_3(sailStates,airStates)

	CL = (-1.164244)*sailStates.alpha + (0.077258)*sailStates.beta + (-6.433091)*sailStates.p + (61.875412)*sailStates.q + (0.111406)*sailStates.r + (0.011616)*sailStates.de;
	CD = -2.120880;
	CY = (1.199326)*sailStates.alpha + (-0.029573)*sailStates.beta + (0.453251)*sailStates.p + (3.330447)*sailStates.q + (0.079604)*sailStates.r + (0.000762)*sailStates.de;

	Cl = (-2.445937)*sailStates.alpha + (-0.377828)*sailStates.beta + (-4.512244)*sailStates.p + (40.296787)*sailStates.q + (0.472263)*sailStates.r + (0.006241)*sailStates.de;
	Cm = (9.942065)*sailStates.alpha + (-0.327855)*sailStates.beta + (23.085016)*sailStates.p + (-249.744659)*sailStates.q + (-0.243378)*sailStates.r + (-0.084342)*sailStates.de;
	Cn = (-4.827248)*sailStates.alpha + (-0.070586)*sailStates.beta + (-1.919468)*sailStates.p + (9.820741)*sailStates.q + (-0.114574)*sailStates.r + (-0.000674)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end