function [aeroForces] = paramSpace_1_2_2_2_1_3_1(sailStates,airStates)

	CL = (4.351252)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.062866)*sailStates.p + (28.632290)*sailStates.q + (0.473393)*sailStates.r + (0.009934)*sailStates.de;
	CD = -0.456720;
	CY = (-0.192593)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.436212)*sailStates.p + (-1.027329)*sailStates.q + (0.076916)*sailStates.r + (-0.000217)*sailStates.de;

	Cl = (1.195126)*sailStates.alpha + (-0.177126)*sailStates.beta + (-0.844832)*sailStates.p + (5.946784)*sailStates.q + (0.616938)*sailStates.r + (-0.000133)*sailStates.de;
	Cm = (-15.536007)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.870471)*sailStates.p + (-125.588745)*sailStates.q + (-1.510177)*sailStates.r + (-0.067412)*sailStates.de;
	Cn = (0.714795)*sailStates.alpha + (-0.031232)*sailStates.beta + (-1.079948)*sailStates.p + (5.984805)*sailStates.q + (-0.055374)*sailStates.r + (0.000378)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end