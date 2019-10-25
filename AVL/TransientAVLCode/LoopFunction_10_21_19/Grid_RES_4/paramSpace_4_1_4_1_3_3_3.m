function [aeroForces] = paramSpace_4_1_4_1_3_3_3(sailStates,airStates)

	CL = (4.980875)*sailStates.alpha + (0.747010)*sailStates.beta + (-3.531102)*sailStates.p + (50.009724)*sailStates.q + (3.162796)*sailStates.r + (0.012384)*sailStates.de;
	CD = -1.885160;
	CY = (0.569619)*sailStates.alpha + (-0.021284)*sailStates.beta + (1.114669)*sailStates.p + (1.002330)*sailStates.q + (-0.221614)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (1.142968)*sailStates.alpha + (-0.372642)*sailStates.beta + (-1.984664)*sailStates.p + (19.173143)*sailStates.q + (2.737225)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-8.038760)*sailStates.alpha + (-2.897519)*sailStates.beta + (9.941657)*sailStates.p + (-160.076126)*sailStates.q + (-10.542452)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-1.941255)*sailStates.alpha + (0.114970)*sailStates.beta + (-2.200432)*sailStates.p + (7.488491)*sailStates.q + (-0.028793)*sailStates.r + (-0.000073)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end