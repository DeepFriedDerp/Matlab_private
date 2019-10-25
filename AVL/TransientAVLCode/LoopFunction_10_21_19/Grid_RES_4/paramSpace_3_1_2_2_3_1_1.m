function [aeroForces] = paramSpace_3_1_2_2_3_1_1(sailStates,airStates)

	CL = (4.572809)*sailStates.alpha + (-0.211859)*sailStates.beta + (-2.126439)*sailStates.p + (30.185915)*sailStates.q + (-0.935937)*sailStates.r + (0.010464)*sailStates.de;
	CD = -0.549850;
	CY = (0.196116)*sailStates.alpha + (-0.023949)*sailStates.beta + (-0.549902)*sailStates.p + (0.870359)*sailStates.q + (0.036012)*sailStates.r + (0.000185)*sailStates.de;

	Cl = (1.368051)*sailStates.alpha + (0.175684)*sailStates.beta + (-0.915681)*sailStates.p + (6.934864)*sailStates.q + (-0.933050)*sailStates.r + (-0.000038)*sailStates.de;
	Cm = (-15.203423)*sailStates.alpha + (0.859575)*sailStates.beta + (7.661349)*sailStates.p + (-125.466835)*sailStates.q + (3.169680)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (-0.695187)*sailStates.alpha + (-0.018407)*sailStates.beta + (1.251185)*sailStates.p + (-6.434209)*sailStates.q + (-0.016919)*sailStates.r + (-0.000340)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end