function [aeroForces] = paramSpace_1_1_3_2_2_1_3(sailStates,airStates)

	CL = (4.447384)*sailStates.alpha + (-0.364607)*sailStates.beta + (-2.946680)*sailStates.p + (41.444817)*sailStates.q + (-2.020923)*sailStates.r + (0.011546)*sailStates.de;
	CD = -0.486670;
	CY = (-0.082035)*sailStates.alpha + (-0.025440)*sailStates.beta + (-0.690873)*sailStates.p + (0.267957)*sailStates.q + (-0.121794)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.556461)*sailStates.alpha + (0.211622)*sailStates.beta + (-1.551843)*sailStates.p + (14.255136)*sailStates.q + (-1.637294)*sailStates.r + (0.000963)*sailStates.de;
	Cm = (-12.608993)*sailStates.alpha + (1.294089)*sailStates.beta + (8.949909)*sailStates.p + (-145.513718)*sailStates.q + (6.713198)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.472687)*sailStates.alpha + (0.059400)*sailStates.beta + (1.335070)*sailStates.p + (-5.368147)*sailStates.q + (-0.005274)*sailStates.r + (-0.000220)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end