function [aeroForces] = paramSpace_1_2_3_1_3_3_1(sailStates,airStates)

	CL = (4.733552)*sailStates.alpha + (0.105132)*sailStates.beta + (-1.409031)*sailStates.p + (20.335632)*sailStates.q + (1.185897)*sailStates.r + (0.008741)*sailStates.de;
	CD = -1.614030;
	CY = (-0.141802)*sailStates.alpha + (-0.026007)*sailStates.beta + (0.658160)*sailStates.p + (1.002333)*sailStates.q + (0.130952)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (0.423808)*sailStates.alpha + (-0.339562)*sailStates.beta + (-0.395099)*sailStates.p + (1.359617)*sailStates.q + (1.350333)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-14.965888)*sailStates.alpha + (-0.429478)*sailStates.beta + (6.325859)*sailStates.p + (-108.591942)*sailStates.q + (-3.872621)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (1.357499)*sailStates.alpha + (-0.074912)*sailStates.beta + (-1.575931)*sailStates.p + (6.278943)*sailStates.q + (-0.029362)*sailStates.r + (-0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end