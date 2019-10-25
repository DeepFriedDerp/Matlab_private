function [aeroForces] = paramSpace_2_1_2_2_2_2_1(sailStates,airStates)

	CL = (3.931056)*sailStates.alpha + (-0.072508)*sailStates.beta + (-2.144822)*sailStates.p + (31.452406)*sailStates.q + (-0.282221)*sailStates.r + (0.010673)*sailStates.de;
	CD = 0.031880;
	CY = (-0.001482)*sailStates.alpha + (-0.024668)*sailStates.beta + (-0.066095)*sailStates.p + (-0.100923)*sailStates.q + (-0.004329)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (1.088354)*sailStates.alpha + (0.019607)*sailStates.beta + (-0.919079)*sailStates.p + (7.267913)*sailStates.q + (-0.198781)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-14.267450)*sailStates.alpha + (0.293793)*sailStates.beta + (7.345788)*sailStates.p + (-125.105080)*sailStates.q + (0.968116)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.004142)*sailStates.alpha + (0.002068)*sailStates.beta + (0.096778)*sailStates.p + (-0.169752)*sailStates.q + (-0.002771)*sailStates.r + (0.000027)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end