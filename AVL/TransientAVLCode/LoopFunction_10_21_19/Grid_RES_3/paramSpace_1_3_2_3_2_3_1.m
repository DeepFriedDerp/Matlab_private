function [aeroForces] = paramSpace_1_3_2_3_2_3_1(sailStates,airStates)

	CL = (3.944539)*sailStates.alpha + (0.015124)*sailStates.beta + (-2.188270)*sailStates.p + (30.800579)*sailStates.q + (-0.125386)*sailStates.r + (0.010077)*sailStates.de;
	CD = -0.093290;
	CY = (-0.035719)*sailStates.alpha + (-0.025268)*sailStates.beta + (0.134985)*sailStates.p + (-0.173374)*sailStates.q + (0.023802)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.008512)*sailStates.alpha + (-0.057011)*sailStates.beta + (-0.902944)*sailStates.p + (6.763820)*sailStates.q + (0.093335)*sailStates.r + (-0.000113)*sailStates.de;
	Cm = (-14.542464)*sailStates.alpha + (-0.024519)*sailStates.beta + (7.821620)*sailStates.p + (-127.559647)*sailStates.q + (0.462193)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (0.280876)*sailStates.alpha + (-0.006577)*sailStates.beta + (-0.431702)*sailStates.p + (2.451462)*sailStates.q + (-0.031590)*sailStates.r + (0.000086)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end