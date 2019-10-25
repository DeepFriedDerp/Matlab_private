function [aeroForces] = paramSpace_4_3_2_1_1_1_1(sailStates,airStates)

	CL = (4.733552)*sailStates.alpha + (0.105132)*sailStates.beta + (-1.409030)*sailStates.p + (20.335630)*sailStates.q + (-1.185896)*sailStates.r + (0.008741)*sailStates.de;
	CD = -1.614030;
	CY = (0.141802)*sailStates.alpha + (-0.023945)*sailStates.beta + (-0.658160)*sailStates.p + (-1.002333)*sailStates.q + (0.130952)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (0.356048)*sailStates.alpha + (0.397950)*sailStates.beta + (-0.363555)*sailStates.p + (0.962649)*sailStates.q + (-1.356593)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-14.965887)*sailStates.alpha + (-0.429478)*sailStates.beta + (6.325858)*sailStates.p + (-108.591927)*sailStates.q + (3.872620)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-1.377477)*sailStates.alpha + (-0.071788)*sailStates.beta + (1.569656)*sailStates.p + (-6.199981)*sailStates.q + (-0.028117)*sailStates.r + (0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end