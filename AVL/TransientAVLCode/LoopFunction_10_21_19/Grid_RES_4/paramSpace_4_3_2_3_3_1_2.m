function [aeroForces] = paramSpace_4_3_2_3_3_1_2(sailStates,airStates)

	CL = (4.016952)*sailStates.alpha + (-0.008224)*sailStates.beta + (-2.445035)*sailStates.p + (32.847858)*sailStates.q + (0.195496)*sailStates.r + (0.010220)*sailStates.de;
	CD = -0.117430;
	CY = (0.058256)*sailStates.alpha + (-0.025480)*sailStates.beta + (-0.166414)*sailStates.p + (0.489619)*sailStates.q + (0.033084)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.220267)*sailStates.alpha + (0.059840)*sailStates.beta + (-1.140691)*sailStates.p + (9.066727)*sailStates.q + (-0.053722)*sailStates.r + (0.000322)*sailStates.de;
	Cm = (-14.824185)*sailStates.alpha + (0.010155)*sailStates.beta + (8.776471)*sailStates.p + (-135.545776)*sailStates.q + (-0.710836)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (-0.317040)*sailStates.alpha + (-0.010000)*sailStates.beta + (0.552993)*sailStates.p + (-3.490964)*sailStates.q + (-0.054197)*sailStates.r + (-0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end