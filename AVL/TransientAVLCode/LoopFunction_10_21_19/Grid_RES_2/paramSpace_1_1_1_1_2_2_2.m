function [aeroForces] = paramSpace_1_1_1_1_2_2_2(sailStates,airStates)

	CL = (4.215040)*sailStates.alpha + (0.058363)*sailStates.beta + (-2.943644)*sailStates.p + (36.222000)*sailStates.q + (0.232437)*sailStates.r + (0.010399)*sailStates.de;
	CD = -0.442350;
	CY = (0.198474)*sailStates.alpha + (-0.026820)*sailStates.beta + (0.240345)*sailStates.p + (1.226114)*sailStates.q + (0.031555)*sailStates.r + (0.000264)*sailStates.de;

	Cl = (1.396359)*sailStates.alpha + (-0.162047)*sailStates.beta + (-1.598309)*sailStates.p + (13.307117)*sailStates.q + (0.404018)*sailStates.r + (0.001049)*sailStates.de;
	Cm = (-14.455931)*sailStates.alpha + (-0.233176)*sailStates.beta + (10.509645)*sailStates.p + (-148.931046)*sailStates.q + (-0.751805)*sailStates.r + (-0.070142)*sailStates.de;
	Cn = (-0.117253)*sailStates.alpha + (-0.024121)*sailStates.beta + (-0.782039)*sailStates.p + (3.462533)*sailStates.q + (-0.022020)*sailStates.r + (-0.000264)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end