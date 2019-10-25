function [aeroForces] = paramSpace_2_3_3_2_2_2_1(sailStates,airStates)

	CL = (4.006192)*sailStates.alpha + (0.017274)*sailStates.beta + (-2.164562)*sailStates.p + (31.702145)*sailStates.q + (-0.276676)*sailStates.r + (0.010869)*sailStates.de;
	CD = 0.027860;
	CY = (-0.003955)*sailStates.alpha + (-0.025009)*sailStates.beta + (-0.051863)*sailStates.p + (-0.100923)*sailStates.q + (-0.003403)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (0.995828)*sailStates.alpha + (0.035434)*sailStates.beta + (-0.863211)*sailStates.p + (6.535412)*sailStates.q + (-0.172717)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-14.558964)*sailStates.alpha + (-0.053479)*sailStates.beta + (7.415474)*sailStates.p + (-126.149185)*sailStates.q + (0.930288)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (-0.002703)*sailStates.alpha + (0.002055)*sailStates.beta + (0.079950)*sailStates.p + (-0.212732)*sailStates.q + (-0.002398)*sailStates.r + (0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end