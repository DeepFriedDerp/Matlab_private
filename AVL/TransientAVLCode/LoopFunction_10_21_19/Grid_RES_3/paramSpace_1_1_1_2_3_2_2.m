function [aeroForces] = paramSpace_1_1_1_2_3_2_2(sailStates,airStates)

	CL = (3.922046)*sailStates.alpha + (-0.210918)*sailStates.beta + (-2.464944)*sailStates.p + (35.172947)*sailStates.q + (-1.081153)*sailStates.r + (0.010498)*sailStates.de;
	CD = 0.047970;
	CY = (0.097498)*sailStates.alpha + (-0.026932)*sailStates.beta + (-0.337445)*sailStates.p + (0.759371)*sailStates.q + (-0.059573)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.353194)*sailStates.alpha + (0.073667)*sailStates.beta + (-1.196169)*sailStates.p + (10.389524)*sailStates.q + (-0.799288)*sailStates.r + (0.000400)*sailStates.de;
	Cm = (-13.583269)*sailStates.alpha + (0.823297)*sailStates.beta + (8.017237)*sailStates.p + (-133.652283)*sailStates.q + (3.645488)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (0.003826)*sailStates.alpha + (0.024628)*sailStates.beta + (0.547487)*sailStates.p + (-2.248778)*sailStates.q + (-0.007313)*sailStates.r + (-0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end