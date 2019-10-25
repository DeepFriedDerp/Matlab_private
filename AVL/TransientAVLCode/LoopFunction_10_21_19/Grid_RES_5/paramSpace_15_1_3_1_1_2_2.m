function [aeroForces] = paramSpace_15_1_3_1_1_2_2(sailStates,airStates)

	CL = (5.193339)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.996089)*sailStates.p + (45.626583)*sailStates.q + (3.015813)*sailStates.r + (0.011718)*sailStates.de;
	CD = -1.048610;
	CY = (0.029330)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.091954)*sailStates.p + (-1.423513)*sailStates.q + (-0.272306)*sailStates.r + (-0.000301)*sailStates.de;

	Cl = (2.057600)*sailStates.alpha + (-0.490036)*sailStates.beta + (-1.549039)*sailStates.p + (15.446337)*sailStates.q + (2.454324)*sailStates.r + (0.000888)*sailStates.de;
	Cm = (-11.335699)*sailStates.alpha + (0.000000)*sailStates.beta + (7.878691)*sailStates.p + (-145.460434)*sailStates.q + (-9.884617)*sailStates.r + (-0.067604)*sailStates.de;
	Cn = (-0.737279)*sailStates.alpha + (0.122180)*sailStates.beta + (-2.127061)*sailStates.p + (9.150496)*sailStates.q + (0.014730)*sailStates.r + (0.000587)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end