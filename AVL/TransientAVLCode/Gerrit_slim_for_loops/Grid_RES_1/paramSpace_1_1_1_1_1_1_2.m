function [aeroForces] = paramSpace_1_1_1_1_1_1_2(sailStates,airStates)

	CL = (7.111188)*sailStates.alpha + (-0.685689)*sailStates.beta + (-2.340465)*sailStates.p + (37.872658)*sailStates.q + (-3.055422)*sailStates.r + (0.011517)*sailStates.de;
	CD = -2.587910;
	CY = (0.333165)*sailStates.alpha + (-0.027894)*sailStates.beta + (-1.347331)*sailStates.p + (1.328523)*sailStates.q + (-0.177474)*sailStates.r + (0.000281)*sailStates.de;

	Cl = (2.597359)*sailStates.alpha + (0.416835)*sailStates.beta + (-1.039774)*sailStates.p + (9.775872)*sailStates.q + (-2.673515)*sailStates.r + (0.000070)*sailStates.de;
	Cm = (-13.170356)*sailStates.alpha + (2.655467)*sailStates.beta + (6.384439)*sailStates.p + (-126.937889)*sailStates.q + (10.255870)*sailStates.r + (-0.067307)*sailStates.de;
	Cn = (-0.948900)*sailStates.alpha + (0.090688)*sailStates.beta + (2.878258)*sailStates.p + (-13.543108)*sailStates.q + (0.044939)*sailStates.r + (-0.000588)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end