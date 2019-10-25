function [aeroForces] = paramSpace_3_1_1_3_3_3_2(sailStates,airStates)

	CL = (4.146131)*sailStates.alpha + (0.170805)*sailStates.beta + (-2.569536)*sailStates.p + (35.431561)*sailStates.q + (0.840263)*sailStates.r + (0.011076)*sailStates.de;
	CD = -0.126380;
	CY = (0.062663)*sailStates.alpha + (-0.024413)*sailStates.beta + (0.280536)*sailStates.p + (0.498142)*sailStates.q + (-0.018440)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.306107)*sailStates.alpha + (-0.104115)*sailStates.beta + (-1.256385)*sailStates.p + (10.512734)*sailStates.q + (0.698612)*sailStates.r + (0.000480)*sailStates.de;
	Cm = (-14.181365)*sailStates.alpha + (-0.581677)*sailStates.beta + (8.607151)*sailStates.p + (-136.384659)*sailStates.q + (-2.823678)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (-0.034199)*sailStates.alpha + (0.010483)*sailStates.beta + (-0.591838)*sailStates.p + (2.200595)*sailStates.q + (-0.001775)*sailStates.r + (-0.000073)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end