function [aeroForces] = paramSpace_1_1_1_2_2_2_1(sailStates,airStates)

	CL = (3.688015)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.163029)*sailStates.p + (31.527601)*sailStates.q + (-0.679578)*sailStates.r + (0.009688)*sailStates.de;
	CD = 0.063310;
	CY = (0.031814)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.078011)*sailStates.p + (0.199285)*sailStates.q + (-0.019472)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.060034)*sailStates.alpha + (0.031176)*sailStates.beta + (-0.945809)*sailStates.p + (7.757074)*sailStates.q + (-0.364601)*sailStates.r + (0.000027)*sailStates.de;
	Cm = (-13.570395)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.443296)*sailStates.p + (-127.104668)*sailStates.q + (2.347854)*sailStates.r + (-0.065753)*sailStates.de;
	Cn = (0.146306)*sailStates.alpha + (0.007773)*sailStates.beta + (-0.037478)*sailStates.p + (0.802595)*sailStates.q + (-0.041664)*sailStates.r + (-0.000034)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end