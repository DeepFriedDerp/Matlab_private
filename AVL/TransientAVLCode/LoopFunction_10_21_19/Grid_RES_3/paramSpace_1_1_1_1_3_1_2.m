function [aeroForces] = paramSpace_1_1_1_1_3_1_2(sailStates,airStates)

	CL = (7.756982)*sailStates.alpha + (-0.704634)*sailStates.beta + (-2.592781)*sailStates.p + (42.366905)*sailStates.q + (-3.560971)*sailStates.r + (0.011888)*sailStates.de;
	CD = -3.069450;
	CY = (0.252718)*sailStates.alpha + (-0.029455)*sailStates.beta + (-1.519183)*sailStates.p + (1.671352)*sailStates.q + (-0.268032)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (3.064880)*sailStates.alpha + (0.480598)*sailStates.beta + (-1.229263)*sailStates.p + (12.295881)*sailStates.q + (-3.077871)*sailStates.r + (0.000345)*sailStates.de;
	Cm = (-12.460913)*sailStates.alpha + (2.703760)*sailStates.beta + (6.428664)*sailStates.p + (-132.498779)*sailStates.q + (11.842005)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (-0.362920)*sailStates.alpha + (0.133468)*sailStates.beta + (3.202881)*sailStates.p + (-14.888928)*sailStates.q + (0.060200)*sailStates.r + (-0.000716)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end