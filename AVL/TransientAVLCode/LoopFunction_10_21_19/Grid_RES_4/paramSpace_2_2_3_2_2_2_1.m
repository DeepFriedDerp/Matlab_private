function [aeroForces] = paramSpace_2_2_3_2_2_2_1(sailStates,airStates)

	CL = (4.006192)*sailStates.alpha + (-0.017274)*sailStates.beta + (-2.164562)*sailStates.p + (31.702145)*sailStates.q + (-0.276677)*sailStates.r + (0.010869)*sailStates.de;
	CD = 0.027860;
	CY = (-0.003955)*sailStates.alpha + (-0.024944)*sailStates.beta + (-0.051863)*sailStates.p + (-0.100923)*sailStates.q + (-0.003403)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.051427)*sailStates.alpha + (0.024401)*sailStates.beta + (-0.895860)*sailStates.p + (6.939291)*sailStates.q + (-0.174843)*sailStates.r + (-0.000139)*sailStates.de;
	Cm = (-14.558964)*sailStates.alpha + (0.053479)*sailStates.beta + (7.415474)*sailStates.p + (-126.149185)*sailStates.q + (0.930288)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.003570)*sailStates.alpha + (0.001867)*sailStates.beta + (0.077811)*sailStates.p + (-0.186260)*sailStates.q + (-0.002538)*sailStates.r + (0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end