function [aeroForces] = paramSpace_3_3_4_1_3_1_2(sailStates,airStates)

	CL = (7.197697)*sailStates.alpha + (0.159679)*sailStates.beta + (-2.525363)*sailStates.p + (32.241173)*sailStates.q + (-2.317857)*sailStates.r + (0.010462)*sailStates.de;
	CD = -2.753320;
	CY = (0.196001)*sailStates.alpha + (-0.025759)*sailStates.beta + (-1.225687)*sailStates.p + (1.693500)*sailStates.q + (0.080514)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (2.645902)*sailStates.alpha + (0.594543)*sailStates.beta + (-1.183800)*sailStates.p + (8.854136)*sailStates.q + (-2.176811)*sailStates.r + (0.000339)*sailStates.de;
	Cm = (-17.241116)*sailStates.alpha + (-0.595884)*sailStates.beta + (9.439699)*sailStates.p + (-137.990799)*sailStates.q + (7.801871)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (-0.785180)*sailStates.alpha + (-0.033196)*sailStates.beta + (2.783818)*sailStates.p + (-14.251508)*sailStates.q + (-0.035142)*sailStates.r + (-0.000738)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end