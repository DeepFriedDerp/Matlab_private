function [aeroForces] = paramSpace_2_1_1_3_3_1_3(sailStates,airStates)

	CL = (4.301481)*sailStates.alpha + (-0.177054)*sailStates.beta + (-2.824126)*sailStates.p + (36.831036)*sailStates.q + (-0.794307)*sailStates.r + (0.011092)*sailStates.de;
	CD = -0.233230;
	CY = (0.017866)*sailStates.alpha + (-0.024956)*sailStates.beta + (-0.409899)*sailStates.p + (0.499211)*sailStates.q + (-0.000047)*sailStates.r + (0.000108)*sailStates.de;

	Cl = (1.538225)*sailStates.alpha + (0.136746)*sailStates.beta + (-1.463790)*sailStates.p + (12.224720)*sailStates.q + (-0.749087)*sailStates.r + (0.000802)*sailStates.de;
	Cm = (-14.661839)*sailStates.alpha + (0.750665)*sailStates.beta + (9.655603)*sailStates.p + (-143.851379)*sailStates.q + (2.725417)*sailStates.r + (-0.070292)*sailStates.de;
	Cn = (-0.001639)*sailStates.alpha + (0.000211)*sailStates.beta + (0.887721)*sailStates.p + (-4.286699)*sailStates.q + (-0.000177)*sailStates.r + (-0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end