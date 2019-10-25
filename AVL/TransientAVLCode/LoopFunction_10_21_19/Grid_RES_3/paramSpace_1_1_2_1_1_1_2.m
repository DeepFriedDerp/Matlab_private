function [aeroForces] = paramSpace_1_1_2_1_1_1_2(sailStates,airStates)

	CL = (5.500316)*sailStates.alpha + (-0.573192)*sailStates.beta + (-2.681792)*sailStates.p + (41.819313)*sailStates.q + (-2.689796)*sailStates.r + (0.012011)*sailStates.de;
	CD = -1.843790;
	CY = (-0.235489)*sailStates.alpha + (-0.020620)*sailStates.beta + (-0.966551)*sailStates.p + (-1.671349)*sailStates.q + (-0.170429)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.156718)*sailStates.alpha + (0.389386)*sailStates.beta + (-1.284547)*sailStates.p + (12.138209)*sailStates.q + (-2.341679)*sailStates.r + (0.000545)*sailStates.de;
	Cm = (-9.967527)*sailStates.alpha + (2.193154)*sailStates.beta + (7.458854)*sailStates.p + (-136.726761)*sailStates.q + (8.978422)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.181220)*sailStates.alpha + (0.096098)*sailStates.beta + (2.055832)*sailStates.p + (-7.292208)*sailStates.q + (-0.010464)*sailStates.r + (0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end