function [aeroForces] = paramSpace_4_3_2_1_2_2_3(sailStates,airStates)

	CL = (3.542936)*sailStates.alpha + (-0.080998)*sailStates.beta + (-3.332847)*sailStates.p + (42.522038)*sailStates.q + (1.324395)*sailStates.r + (0.011132)*sailStates.de;
	CD = 0.083670;
	CY = (0.035702)*sailStates.alpha + (-0.024295)*sailStates.beta + (0.319567)*sailStates.p + (-0.662187)*sailStates.q + (-0.063542)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.303069)*sailStates.alpha + (-0.164966)*sailStates.beta + (-1.847078)*sailStates.p + (16.444265)*sailStates.q + (0.942798)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-12.658998)*sailStates.alpha + (0.277956)*sailStates.beta + (10.929355)*sailStates.p + (-158.727356)*sailStates.q + (-4.425375)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-0.503764)*sailStates.alpha + (0.027948)*sailStates.beta + (-0.380949)*sailStates.p + (0.888311)*sailStates.q + (-0.038749)*sailStates.r + (0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end