function [aeroForces] = paramSpace_4_2_1_1_2_3_2(sailStates,airStates)

	CL = (6.550539)*sailStates.alpha + (0.232606)*sailStates.beta + (-2.651299)*sailStates.p + (43.141289)*sailStates.q + (3.225256)*sailStates.r + (0.012338)*sailStates.de;
	CD = -2.363270;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (1.232009)*sailStates.p + (0.000001)*sailStates.q + (-0.245062)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.972509)*sailStates.alpha + (-0.545222)*sailStates.beta + (-1.233164)*sailStates.p + (12.196198)*sailStates.q + (2.733707)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-10.951134)*sailStates.alpha + (-0.848736)*sailStates.beta + (6.713544)*sailStates.p + (-134.847153)*sailStates.q + (-10.643732)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.107678)*sailStates.alpha + (0.124644)*sailStates.beta + (-2.620809)*sailStates.p + (11.153052)*sailStates.q + (0.026140)*sailStates.r + (0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end