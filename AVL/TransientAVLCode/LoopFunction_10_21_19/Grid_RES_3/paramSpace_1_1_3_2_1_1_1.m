function [aeroForces] = paramSpace_1_1_3_2_1_1_1(sailStates,airStates)

	CL = (4.248977)*sailStates.alpha + (-0.306897)*sailStates.beta + (-2.184696)*sailStates.p + (34.749565)*sailStates.q + (-1.549005)*sailStates.r + (0.011158)*sailStates.de;
	CD = -0.356760;
	CY = (-0.052514)*sailStates.alpha + (-0.022497)*sailStates.beta + (-0.484445)*sailStates.p + (-1.027327)*sailStates.q + (-0.085518)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.040508)*sailStates.alpha + (0.193895)*sailStates.beta + (-0.923245)*sailStates.p + (8.100809)*sailStates.q + (-1.250473)*sailStates.r + (-0.000021)*sailStates.de;
	Cm = (-12.378381)*sailStates.alpha + (1.101810)*sailStates.beta + (6.634432)*sailStates.p + (-124.672379)*sailStates.q + (5.160790)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (-0.246346)*sailStates.alpha + (0.048847)*sailStates.beta + (1.016771)*sailStates.p + (-3.504588)*sailStates.q + (-0.012543)*sailStates.r + (0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end