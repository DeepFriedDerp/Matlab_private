function [aeroForces] = paramSpace_1_3_1_1_3_1_2(sailStates,airStates)

	CL = (7.756982)*sailStates.alpha + (0.704634)*sailStates.beta + (-2.592781)*sailStates.p + (42.366905)*sailStates.q + (-3.560971)*sailStates.r + (0.011888)*sailStates.de;
	CD = -3.069450;
	CY = (0.252718)*sailStates.alpha + (-0.020207)*sailStates.beta + (-1.519183)*sailStates.p + (1.671352)*sailStates.q + (-0.268032)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (2.961209)*sailStates.alpha + (0.892967)*sailStates.beta + (-1.144645)*sailStates.p + (11.235013)*sailStates.q + (-3.062850)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-12.460914)*sailStates.alpha + (-2.703759)*sailStates.beta + (6.428664)*sailStates.p + (-132.498779)*sailStates.q + (11.842006)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (-0.547093)*sailStates.alpha + (0.108728)*sailStates.beta + (3.217802)*sailStates.p + (-15.075988)*sailStates.q + (0.062849)*sailStates.r + (-0.000716)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end