function [aeroForces] = paramSpace_4_3_3_2_2_1_3(sailStates,airStates)

	CL = (4.050057)*sailStates.alpha + (-0.000034)*sailStates.beta + (-2.789988)*sailStates.p + (35.006882)*sailStates.q + (0.124023)*sailStates.r + (0.010070)*sailStates.de;
	CD = -0.272440;
	CY = (-0.068729)*sailStates.alpha + (-0.024646)*sailStates.beta + (-0.191884)*sailStates.p + (-0.301044)*sailStates.q + (0.038157)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.348821)*sailStates.alpha + (0.103881)*sailStates.beta + (-1.440728)*sailStates.p + (11.821136)*sailStates.q + (-0.134744)*sailStates.r + (0.000805)*sailStates.de;
	Cm = (-14.594325)*sailStates.alpha + (-0.009223)*sailStates.beta + (10.086190)*sailStates.p + (-145.703583)*sailStates.q + (-0.496659)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.144645)*sailStates.alpha + (-0.018692)*sailStates.beta + (0.707270)*sailStates.p + (-3.976688)*sailStates.q + (-0.056876)*sailStates.r + (0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end