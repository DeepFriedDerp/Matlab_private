function [aeroForces] = paramSpace_3_3_4_1_3_3_1(sailStates,airStates)

	CL = (5.338328)*sailStates.alpha + (-0.181305)*sailStates.beta + (-1.756732)*sailStates.p + (30.391390)*sailStates.q + (2.008304)*sailStates.r + (0.011133)*sailStates.de;
	CD = -1.826050;
	CY = (-0.058196)*sailStates.alpha + (-0.025862)*sailStates.beta + (0.838042)*sailStates.p + (1.915496)*sailStates.q + (-0.054726)*sailStates.r + (0.000407)*sailStates.de;

	Cl = (0.501675)*sailStates.alpha + (-0.537998)*sailStates.beta + (-0.497819)*sailStates.p + (3.551913)*sailStates.q + (1.885217)*sailStates.r + (-0.000810)*sailStates.de;
	Cm = (-11.455361)*sailStates.alpha + (0.743393)*sailStates.beta + (5.499820)*sailStates.p + (-113.694908)*sailStates.q + (-6.859904)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (1.452326)*sailStates.alpha + (0.032430)*sailStates.beta + (-1.904733)*sailStates.p + (7.113101)*sailStates.q + (0.002761)*sailStates.r + (-0.000424)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end