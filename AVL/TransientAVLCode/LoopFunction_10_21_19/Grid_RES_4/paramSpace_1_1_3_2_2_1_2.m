function [aeroForces] = paramSpace_1_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.476188)*sailStates.alpha + (-0.431185)*sailStates.beta + (-2.538839)*sailStates.p + (38.591778)*sailStates.q + (-1.997382)*sailStates.r + (0.011225)*sailStates.de;
	CD = -0.488650;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.681506)*sailStates.p + (0.000000)*sailStates.q + (-0.135560)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.440678)*sailStates.alpha + (0.206427)*sailStates.beta + (-1.226022)*sailStates.p + (11.375338)*sailStates.q + (-1.618389)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-12.210907)*sailStates.alpha + (1.576721)*sailStates.beta + (7.445392)*sailStates.p + (-133.820877)*sailStates.q + (6.626619)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.030059)*sailStates.alpha + (0.068323)*sailStates.beta + (1.352308)*sailStates.p + (-5.333431)*sailStates.q + (-0.004438)*sailStates.r + (-0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end