function [aeroForces] = paramSpace_1_3_4_2_1_2_1(sailStates,airStates)

	CL = (3.844146)*sailStates.alpha + (0.042209)*sailStates.beta + (-2.115971)*sailStates.p + (31.782419)*sailStates.q + (-0.624867)*sailStates.r + (0.010585)*sailStates.de;
	CD = 0.055760;
	CY = (-0.125183)*sailStates.alpha + (-0.025991)*sailStates.beta + (-0.032092)*sailStates.p + (-1.057314)*sailStates.q + (-0.006497)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (0.927607)*sailStates.alpha + (0.069903)*sailStates.beta + (-0.843651)*sailStates.p + (6.602767)*sailStates.q + (-0.352897)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-13.985341)*sailStates.alpha + (-0.127856)*sailStates.beta + (7.192851)*sailStates.p + (-125.069839)*sailStates.q + (2.102463)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.184372)*sailStates.alpha + (0.013325)*sailStates.beta + (-0.010966)*sailStates.p + (1.096159)*sailStates.q + (-0.039116)*sailStates.r + (0.000289)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end