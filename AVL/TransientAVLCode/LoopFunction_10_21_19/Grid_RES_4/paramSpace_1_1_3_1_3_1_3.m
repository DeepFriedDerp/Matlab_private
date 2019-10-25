function [aeroForces] = paramSpace_1_1_3_1_3_1_3(sailStates,airStates)

	CL = (7.513950)*sailStates.alpha + (-0.822536)*sailStates.beta + (-3.434853)*sailStates.p + (50.460011)*sailStates.q + (-3.995048)*sailStates.r + (0.012531)*sailStates.de;
	CD = -3.104030;
	CY = (-0.248731)*sailStates.alpha + (-0.031949)*sailStates.beta + (-1.614483)*sailStates.p + (2.326705)*sailStates.q + (-0.321057)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (3.240621)*sailStates.alpha + (0.437557)*sailStates.beta + (-1.924392)*sailStates.p + (19.342279)*sailStates.q + (-3.388546)*sailStates.r + (0.001479)*sailStates.de;
	Cm = (-11.988358)*sailStates.alpha + (3.019865)*sailStates.beta + (8.824508)*sailStates.p + (-155.326050)*sailStates.q + (13.179820)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (2.027475)*sailStates.alpha + (0.153361)*sailStates.beta + (3.272367)*sailStates.p + (-15.041274)*sailStates.q + (0.052903)*sailStates.r + (-0.000984)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end