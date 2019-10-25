function [aeroForces] = paramSpace_1_1_1_2_3_3_3(sailStates,airStates)

	CL = (3.947652)*sailStates.alpha + (-0.017084)*sailStates.beta + (-2.786718)*sailStates.p + (35.259296)*sailStates.q + (-0.201346)*sailStates.r + (0.010055)*sailStates.de;
	CD = -0.189900;
	CY = (0.138903)*sailStates.alpha + (-0.027673)*sailStates.beta + (0.090273)*sailStates.p + (1.027328)*sailStates.q + (0.015820)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.374563)*sailStates.alpha + (-0.102504)*sailStates.beta + (-1.494783)*sailStates.p + (12.602473)*sailStates.q + (0.033921)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-14.235642)*sailStates.alpha + (0.071502)*sailStates.beta + (9.884169)*sailStates.p + (-144.553253)*sailStates.q + (0.738024)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.058943)*sailStates.alpha + (-0.018862)*sailStates.beta + (-0.487380)*sailStates.p + (2.481912)*sailStates.q + (-0.033513)*sailStates.r + (-0.000230)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end