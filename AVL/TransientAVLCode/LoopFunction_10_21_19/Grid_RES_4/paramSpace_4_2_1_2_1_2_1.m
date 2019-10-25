function [aeroForces] = paramSpace_4_2_1_2_1_2_1(sailStates,airStates)

	CL = (3.967593)*sailStates.alpha + (0.060214)*sailStates.beta + (-2.071308)*sailStates.p + (32.031658)*sailStates.q + (1.012237)*sailStates.r + (0.010579)*sailStates.de;
	CD = 0.020800;
	CY = (-0.105781)*sailStates.alpha + (-0.025413)*sailStates.beta + (0.272507)*sailStates.p + (-0.455227)*sailStates.q + (-0.054156)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.078015)*sailStates.alpha + (-0.097329)*sailStates.beta + (-0.847418)*sailStates.p + (7.078539)*sailStates.q + (0.677025)*sailStates.r + (-0.000184)*sailStates.de;
	Cm = (-13.801327)*sailStates.alpha + (-0.187258)*sailStates.beta + (6.674681)*sailStates.p + (-122.911674)*sailStates.q + (-3.354037)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.194075)*sailStates.alpha + (0.023621)*sailStates.beta + (-0.489922)*sailStates.p + (2.266338)*sailStates.q + (-0.004050)*sailStates.r + (0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end