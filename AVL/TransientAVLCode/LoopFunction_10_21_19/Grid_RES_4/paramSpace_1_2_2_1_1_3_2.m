function [aeroForces] = paramSpace_1_2_2_1_1_3_2(sailStates,airStates)

	CL = (6.624877)*sailStates.alpha + (0.122380)*sailStates.beta + (-2.358937)*sailStates.p + (27.100161)*sailStates.q + (1.687593)*sailStates.r + (0.009027)*sailStates.de;
	CD = -2.544110;
	CY = (-0.164724)*sailStates.alpha + (-0.023148)*sailStates.beta + (1.067588)*sailStates.p + (-1.664524)*sailStates.q + (0.212416)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (2.438936)*sailStates.alpha + (-0.430514)*sailStates.beta + (-1.155472)*sailStates.p + (7.925439)*sailStates.q + (1.746027)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-18.231596)*sailStates.alpha + (-0.463118)*sailStates.beta + (10.209098)*sailStates.p + (-137.222183)*sailStates.q + (-5.440133)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.866397)*sailStates.alpha + (-0.099980)*sailStates.beta + (-2.589931)*sailStates.p + (13.668774)*sailStates.q + (-0.122229)*sailStates.r + (0.000693)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end