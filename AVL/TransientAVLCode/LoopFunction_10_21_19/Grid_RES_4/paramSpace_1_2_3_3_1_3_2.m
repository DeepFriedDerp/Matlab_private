function [aeroForces] = paramSpace_1_2_3_3_1_3_2(sailStates,airStates)

	CL = (4.016952)*sailStates.alpha + (-0.008224)*sailStates.beta + (-2.445035)*sailStates.p + (32.847858)*sailStates.q + (-0.195496)*sailStates.r + (0.010220)*sailStates.de;
	CD = -0.117430;
	CY = (-0.058256)*sailStates.alpha + (-0.024472)*sailStates.beta + (0.166414)*sailStates.p + (-0.489619)*sailStates.q + (0.033084)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.269711)*sailStates.alpha + (-0.067955)*sailStates.beta + (-1.172234)*sailStates.p + (9.463700)*sailStates.q + (0.047462)*sailStates.r + (0.000408)*sailStates.de;
	Cm = (-14.824185)*sailStates.alpha + (0.010155)*sailStates.beta + (8.776471)*sailStates.p + (-135.545776)*sailStates.q + (0.710836)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (0.321094)*sailStates.alpha + (-0.015420)*sailStates.beta + (-0.559268)*sailStates.p + (3.569927)*sailStates.q + (-0.055442)*sailStates.r + (0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end