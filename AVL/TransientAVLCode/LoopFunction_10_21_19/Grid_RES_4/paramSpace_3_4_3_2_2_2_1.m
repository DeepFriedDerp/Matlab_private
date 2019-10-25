function [aeroForces] = paramSpace_3_4_3_2_2_2_1(sailStates,airStates)

	CL = (3.931056)*sailStates.alpha + (-0.072508)*sailStates.beta + (-2.144822)*sailStates.p + (31.452406)*sailStates.q + (0.282221)*sailStates.r + (0.010673)*sailStates.de;
	CD = 0.031880;
	CY = (0.001482)*sailStates.alpha + (-0.024904)*sailStates.beta + (0.066095)*sailStates.p + (0.100923)*sailStates.q + (-0.004329)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (0.923375)*sailStates.alpha + (-0.052594)*sailStates.beta + (-0.821386)*sailStates.p + (6.059350)*sailStates.q + (0.192335)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-14.267450)*sailStates.alpha + (0.293793)*sailStates.beta + (7.345788)*sailStates.p + (-125.105080)*sailStates.q + (-0.968116)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.016405)*sailStates.alpha + (0.002664)*sailStates.beta + (-0.103181)*sailStates.p + (0.248965)*sailStates.q + (-0.002349)*sailStates.r + (-0.000027)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end