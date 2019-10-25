function [aeroForces] = paramSpace_4_3_4_3_2_1_2(sailStates,airStates)

	CL = (3.873269)*sailStates.alpha + (-0.027628)*sailStates.beta + (-2.429209)*sailStates.p + (33.025742)*sailStates.q + (0.337607)*sailStates.r + (0.010042)*sailStates.de;
	CD = -0.030500;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.059675)*sailStates.p + (0.000000)*sailStates.q + (0.011870)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.182089)*sailStates.alpha + (0.022824)*sailStates.beta + (-1.131009)*sailStates.p + (9.096693)*sailStates.q + (0.096095)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.280165)*sailStates.alpha + (0.118019)*sailStates.beta + (8.589334)*sailStates.p + (-134.847153)*sailStates.q + (-1.213500)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.234737)*sailStates.alpha + (-0.003877)*sailStates.beta + (0.345206)*sailStates.p + (-2.354563)*sailStates.q + (-0.043272)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end