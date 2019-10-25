function [aeroForces] = paramSpace_5_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.489076)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.113786)*sailStates.p + (33.322945)*sailStates.q + (-1.469410)*sailStates.r + (0.011167)*sailStates.de;
	CD = -0.604850;
	CY = (-0.034907)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.556376)*sailStates.p + (-1.178226)*sailStates.q + (-0.058353)*sailStates.r + (-0.000251)*sailStates.de;

	Cl = (0.915048)*sailStates.alpha + (0.325644)*sailStates.beta + (-0.812376)*sailStates.p + (6.569533)*sailStates.q + (-1.306186)*sailStates.r + (-0.000286)*sailStates.de;
	Cm = (-12.737578)*sailStates.alpha + (0.000000)*sailStates.beta + (6.685394)*sailStates.p + (-123.632645)*sailStates.q + (5.002216)*sailStates.r + (-0.068451)*sailStates.de;
	Cn = (-0.505742)*sailStates.alpha + (0.034227)*sailStates.beta + (1.206676)*sailStates.p + (-4.298680)*sailStates.q + (-0.001992)*sailStates.r + (0.000259)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end