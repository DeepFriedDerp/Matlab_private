function [aeroForces] = paramSpace_2_2_1_1_1_1_1(sailStates,airStates)

	CL = (5.338329)*sailStates.alpha + (-0.181305)*sailStates.beta + (-1.756732)*sailStates.p + (30.391390)*sailStates.q + (-2.008304)*sailStates.r + (0.011133)*sailStates.de;
	CD = -1.826050;
	CY = (0.058196)*sailStates.alpha + (-0.024090)*sailStates.beta + (-0.838042)*sailStates.p + (-1.915496)*sailStates.q + (-0.054726)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (0.560635)*sailStates.alpha + (0.453741)*sailStates.beta + (-0.530464)*sailStates.p + (3.955791)*sailStates.q + (-1.887399)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-11.455361)*sailStates.alpha + (0.743393)*sailStates.beta + (5.499819)*sailStates.p + (-113.694908)*sailStates.q + (6.859903)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (-1.404968)*sailStates.alpha + (0.032572)*sailStates.beta + (1.902594)*sailStates.p + (-7.086629)*sailStates.q + (0.002617)*sailStates.r + (0.000424)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end