function [aeroForces] = paramSpace_1_3_1_3_1_2_2(sailStates,airStates)

	CL = (3.782744)*sailStates.alpha + (0.171155)*sailStates.beta + (-2.497917)*sailStates.p + (34.989601)*sailStates.q + (-0.759485)*sailStates.r + (0.010504)*sailStates.de;
	CD = 0.086020;
	CY = (-0.061222)*sailStates.alpha + (-0.026191)*sailStates.beta + (-0.137879)*sailStates.p + (-0.491626)*sailStates.q + (-0.024265)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.103582)*sailStates.alpha + (0.130184)*sailStates.beta + (-1.132085)*sailStates.p + (9.270630)*sailStates.q + (-0.520477)*sailStates.r + (0.000246)*sailStates.de;
	Cm = (-13.543375)*sailStates.alpha + (-0.691308)*sailStates.beta + (8.398405)*sailStates.p + (-135.234604)*sailStates.q + (2.598624)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.166138)*sailStates.alpha + (0.019423)*sailStates.beta + (0.144029)*sailStates.p + (0.401632)*sailStates.q + (-0.031462)*sailStates.r + (0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end