function [aeroForces] = paramSpace_3_3_4_2_3_3_1(sailStates,airStates)

	CL = (4.333124)*sailStates.alpha + (-0.100931)*sailStates.beta + (-2.198219)*sailStates.p + (32.900253)*sailStates.q + (1.101112)*sailStates.r + (0.011051)*sailStates.de;
	CD = -0.365880;
	CY = (0.038475)*sailStates.alpha + (-0.025379)*sailStates.beta + (0.434051)*sailStates.p + (0.870359)*sailStates.q + (-0.028357)*sailStates.r + (0.000186)*sailStates.de;

	Cl = (0.979441)*sailStates.alpha + (-0.275112)*sailStates.beta + (-0.876146)*sailStates.p + (6.842349)*sailStates.q + (0.999896)*sailStates.r + (-0.000209)*sailStates.de;
	Cm = (-13.715926)*sailStates.alpha + (0.421250)*sailStates.beta + (7.273486)*sailStates.p + (-126.510948)*sailStates.q + (-3.773348)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (0.335548)*sailStates.alpha + (0.016555)*sailStates.beta + (-0.939162)*sailStates.p + (3.373051)*sailStates.q + (-0.000665)*sailStates.r + (-0.000190)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end