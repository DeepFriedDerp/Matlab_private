function [aeroForces] = paramSpace_4_3_1_1_2_3_2(sailStates,airStates)

	CL = (6.550539)*sailStates.alpha + (-0.232606)*sailStates.beta + (-2.651299)*sailStates.p + (43.141289)*sailStates.q + (3.225256)*sailStates.r + (0.012338)*sailStates.de;
	CD = -2.363270;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (1.232009)*sailStates.p + (0.000001)*sailStates.q + (-0.245062)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.934398)*sailStates.alpha + (-0.685233)*sailStates.beta + (-1.201616)*sailStates.p + (11.799231)*sailStates.q + (2.727474)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-10.951134)*sailStates.alpha + (0.848736)*sailStates.beta + (6.713544)*sailStates.p + (-134.847153)*sailStates.q + (-10.643734)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.171125)*sailStates.alpha + (0.120109)*sailStates.beta + (-2.627085)*sailStates.p + (11.232014)*sailStates.q + (0.027380)*sailStates.r + (0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end