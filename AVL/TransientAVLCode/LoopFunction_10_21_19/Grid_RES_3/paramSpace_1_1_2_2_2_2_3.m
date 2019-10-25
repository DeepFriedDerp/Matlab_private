function [aeroForces] = paramSpace_1_1_2_2_2_2_3(sailStates,airStates)

	CL = (3.791704)*sailStates.alpha + (-0.179369)*sailStates.beta + (-2.876667)*sailStates.p + (38.296398)*sailStates.q + (-1.013732)*sailStates.r + (0.010802)*sailStates.de;
	CD = 0.065550;
	CY = (-0.007110)*sailStates.alpha + (-0.025506)*sailStates.beta + (-0.239730)*sailStates.p + (0.267957)*sailStates.q + (-0.042271)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.373773)*sailStates.alpha + (0.045162)*sailStates.beta + (-1.529539)*sailStates.p + (13.411196)*sailStates.q + (-0.721655)*sailStates.r + (0.000963)*sailStates.de;
	Cm = (-13.494680)*sailStates.alpha + (0.642736)*sailStates.beta + (9.532726)*sailStates.p + (-145.513718)*sailStates.q + (3.407882)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.272732)*sailStates.alpha + (0.016279)*sailStates.beta + (0.296833)*sailStates.p + (-0.581926)*sailStates.q + (-0.027352)*sailStates.r + (-0.000107)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end