function [aeroForces] = paramSpace_1_1_2_1_1_2_2(sailStates,airStates)

	CL = (4.732302)*sailStates.alpha + (0.643115)*sailStates.beta + (-5.711020)*sailStates.p + (53.725437)*sailStates.q + (2.076939)*sailStates.r + (0.010940)*sailStates.de;
	CD = -6.043850;
	CY = (2.138330)*sailStates.alpha + (-0.031161)*sailStates.beta + (1.220115)*sailStates.p + (3.321120)*sailStates.q + (0.160866)*sailStates.r + (0.000750)*sailStates.de;

	Cl = (-0.527736)*sailStates.alpha + (-0.624547)*sailStates.beta + (-3.956140)*sailStates.p + (34.326462)*sailStates.q + (2.257847)*sailStates.r + (0.005185)*sailStates.de;
	Cm = (2.555428)*sailStates.alpha + (-2.686324)*sailStates.beta + (21.230906)*sailStates.p + (-228.827332)*sailStates.q + (-7.009857)*sailStates.r + (-0.080652)*sailStates.de;
	Cn = (-8.026261)*sailStates.alpha + (-0.108819)*sailStates.beta + (-3.350568)*sailStates.p + (14.861807)*sailStates.q + (-0.075906)*sailStates.r + (-0.000550)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end