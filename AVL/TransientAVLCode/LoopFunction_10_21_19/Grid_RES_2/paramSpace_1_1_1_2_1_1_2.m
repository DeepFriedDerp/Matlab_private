function [aeroForces] = paramSpace_1_1_1_2_1_1_2(sailStates,airStates)

	CL = (4.033447)*sailStates.alpha + (-0.185693)*sailStates.beta + (-2.773092)*sailStates.p + (38.000423)*sailStates.q + (-1.160653)*sailStates.r + (0.011128)*sailStates.de;
	CD = -0.079950;
	CY = (-0.071633)*sailStates.alpha + (-0.024437)*sailStates.beta + (-0.368273)*sailStates.p + (-0.299436)*sailStates.q + (-0.048463)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.339135)*sailStates.alpha + (0.143187)*sailStates.beta + (-1.406110)*sailStates.p + (12.156011)*sailStates.q + (-0.944657)*sailStates.r + (0.000722)*sailStates.de;
	Cm = (-13.451154)*sailStates.alpha + (0.734505)*sailStates.beta + (9.055655)*sailStates.p + (-142.147675)*sailStates.q + (3.934052)*sailStates.r + (-0.069412)*sailStates.de;
	Cn = (0.218543)*sailStates.alpha + (0.024824)*sailStates.beta + (0.667687)*sailStates.p + (-2.100136)*sailStates.q + (-0.012260)*sailStates.r + (0.000037)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end