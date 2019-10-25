function [aeroForces] = paramSpace_1_2_1_2_2_2_2(sailStates,airStates)

	CL = (3.956060)*sailStates.alpha + (0.037332)*sailStates.beta + (-2.701319)*sailStates.p + (35.525448)*sailStates.q + (-0.292085)*sailStates.r + (0.010611)*sailStates.de;
	CD = -0.011840;
	CY = (0.063751)*sailStates.alpha + (-0.024102)*sailStates.beta + (0.005246)*sailStates.p + (0.513810)*sailStates.q + (0.000654)*sailStates.r + (0.000110)*sailStates.de;

	Cl = (1.257051)*sailStates.alpha + (-0.010020)*sailStates.beta + (-1.314042)*sailStates.p + (10.705456)*sailStates.q + (-0.102234)*sailStates.r + (0.000512)*sailStates.de;
	Cm = (-14.427290)*sailStates.alpha + (-0.148613)*sailStates.beta + (9.345471)*sailStates.p + (-141.379639)*sailStates.q + (1.012794)*sailStates.r + (-0.069332)*sailStates.de;
	Cn = (0.091928)*sailStates.alpha + (-0.001801)*sailStates.beta + (-0.190459)*sailStates.p + (1.102326)*sailStates.q + (-0.015809)*sailStates.r + (-0.000117)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end