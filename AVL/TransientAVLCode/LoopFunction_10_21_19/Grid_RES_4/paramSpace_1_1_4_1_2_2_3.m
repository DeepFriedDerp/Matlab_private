function [aeroForces] = paramSpace_1_1_4_1_2_2_3(sailStates,airStates)

	CL = (3.517470)*sailStates.alpha + (-0.219597)*sailStates.beta + (-3.314949)*sailStates.p + (42.204727)*sailStates.q + (-1.307014)*sailStates.r + (0.011056)*sailStates.de;
	CD = 0.077700;
	CY = (-0.030183)*sailStates.alpha + (-0.026687)*sailStates.beta + (-0.303361)*sailStates.p + (0.662188)*sailStates.q + (-0.060271)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.353728)*sailStates.alpha + (0.029626)*sailStates.beta + (-1.901642)*sailStates.p + (17.159138)*sailStates.q + (-0.926053)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-12.649111)*sailStates.alpha + (0.692642)*sailStates.beta + (10.878456)*sailStates.p + (-157.701111)*sailStates.q + (4.343370)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.518577)*sailStates.alpha + (0.020058)*sailStates.beta + (0.344225)*sailStates.p + (-0.714645)*sailStates.q + (-0.040903)*sailStates.r + (-0.000258)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end