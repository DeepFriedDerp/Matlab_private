function [aeroForces] = paramSpace_14_1_1_1_1_2_1(sailStates,airStates)

	CL = (5.247493)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.055732)*sailStates.p + (36.131252)*sailStates.q + (2.374423)*sailStates.r + (0.011453)*sailStates.de;
	CD = -1.004450;
	CY = (-0.276551)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.895297)*sailStates.p + (-0.550479)*sailStates.q + (-0.190242)*sailStates.r + (-0.000115)*sailStates.de;

	Cl = (1.557050)*sailStates.alpha + (-0.425833)*sailStates.beta + (-0.770635)*sailStates.p + (7.382657)*sailStates.q + (1.920960)*sailStates.r + (-0.000377)*sailStates.de;
	Cm = (-11.940783)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.279287)*sailStates.p + (-119.415161)*sailStates.q + (-7.804719)*sailStates.r + (-0.066020)*sailStates.de;
	Cn = (1.024332)*sailStates.alpha + (0.090514)*sailStates.beta + (-1.922811)*sailStates.p + (8.839965)*sailStates.q + (0.034891)*sailStates.r + (0.000301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end