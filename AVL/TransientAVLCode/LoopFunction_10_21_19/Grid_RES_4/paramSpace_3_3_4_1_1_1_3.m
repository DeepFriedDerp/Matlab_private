function [aeroForces] = paramSpace_3_3_4_1_1_1_3(sailStates,airStates)

	CL = (5.065361)*sailStates.alpha + (0.113157)*sailStates.beta + (-3.375856)*sailStates.p + (39.596367)*sailStates.q + (-1.315088)*sailStates.r + (0.010907)*sailStates.de;
	CD = -1.630700;
	CY = (-0.465500)*sailStates.alpha + (-0.024090)*sailStates.beta + (-0.641902)*sailStates.p + (-1.915494)*sailStates.q + (0.041870)*sailStates.r + (-0.000419)*sailStates.de;

	Cl = (1.308761)*sailStates.alpha + (0.425129)*sailStates.beta + (-1.885248)*sailStates.p + (15.619691)*sailStates.q + (-1.358139)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-13.272998)*sailStates.alpha + (-0.436844)*sailStates.beta + (12.003486)*sailStates.p + (-160.694275)*sailStates.q + (4.447367)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (0.910971)*sailStates.alpha + (-0.025732)*sailStates.beta + (1.632632)*sailStates.p + (-6.587429)*sailStates.q + (-0.009783)*sailStates.r + (0.000362)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end