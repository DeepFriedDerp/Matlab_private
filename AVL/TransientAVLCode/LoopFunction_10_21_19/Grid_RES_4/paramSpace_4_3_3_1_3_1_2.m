function [aeroForces] = paramSpace_4_3_3_1_3_1_2(sailStates,airStates)

	CL = (6.624877)*sailStates.alpha + (0.122381)*sailStates.beta + (-2.358937)*sailStates.p + (27.100161)*sailStates.q + (-1.687593)*sailStates.r + (0.009027)*sailStates.de;
	CD = -2.544110;
	CY = (0.164724)*sailStates.alpha + (-0.026804)*sailStates.beta + (-1.067588)*sailStates.p + (1.664524)*sailStates.q + (0.212416)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (2.383421)*sailStates.alpha + (0.504379)*sailStates.beta + (-1.123935)*sailStates.p + (7.528468)*sailStates.q + (-1.752314)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-18.231596)*sailStates.alpha + (-0.463118)*sailStates.beta + (10.209097)*sailStates.p + (-137.222183)*sailStates.q + (5.440130)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (-0.897768)*sailStates.alpha + (-0.085982)*sailStates.beta + (2.583658)*sailStates.p + (-13.589810)*sailStates.q + (-0.120979)*sailStates.r + (-0.000693)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end