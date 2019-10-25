function [aeroForces] = paramSpace_2_4_3_2_1_3_1(sailStates,airStates)

	CL = (4.572808)*sailStates.alpha + (-0.211859)*sailStates.beta + (-2.126439)*sailStates.p + (30.185917)*sailStates.q + (0.935937)*sailStates.r + (0.010464)*sailStates.de;
	CD = -0.549850;
	CY = (-0.196116)*sailStates.alpha + (-0.025623)*sailStates.beta + (0.549902)*sailStates.p + (-0.870359)*sailStates.q + (0.036012)*sailStates.r + (-0.000185)*sailStates.de;

	Cl = (1.198735)*sailStates.alpha + (-0.300919)*sailStates.beta + (-0.817982)*sailStates.p + (5.726304)*sailStates.q + (0.939411)*sailStates.r + (-0.000295)*sailStates.de;
	Cm = (-15.203423)*sailStates.alpha + (0.859575)*sailStates.beta + (7.661350)*sailStates.p + (-125.466835)*sailStates.q + (-3.169681)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (0.746951)*sailStates.alpha + (-0.012831)*sailStates.beta + (-1.244782)*sailStates.p + (6.354995)*sailStates.q + (-0.016502)*sailStates.r + (0.000340)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end