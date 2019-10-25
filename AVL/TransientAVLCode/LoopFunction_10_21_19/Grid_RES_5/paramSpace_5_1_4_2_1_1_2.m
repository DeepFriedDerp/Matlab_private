function [aeroForces] = paramSpace_5_1_4_2_1_1_2(sailStates,airStates)

	CL = (4.132065)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.793994)*sailStates.p + (37.753845)*sailStates.q + (-0.995973)*sailStates.r + (0.011368)*sailStates.de;
	CD = -0.079580;
	CY = (-0.067971)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.299092)*sailStates.p + (-0.322048)*sailStates.q + (-0.031470)*sailStates.r + (-0.000070)*sailStates.de;

	Cl = (1.322121)*sailStates.alpha + (0.162521)*sailStates.beta + (-1.385476)*sailStates.p + (11.701508)*sailStates.q + (-0.781812)*sailStates.r + (0.000639)*sailStates.de;
	Cm = (-14.142301)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.247139)*sailStates.p + (-143.031982)*sailStates.q + (3.335006)*sailStates.r + (-0.070367)*sailStates.de;
	Cn = (0.154200)*sailStates.alpha + (0.017082)*sailStates.beta + (0.573851)*sailStates.p + (-2.037196)*sailStates.q + (-0.006767)*sailStates.r + (0.000019)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end