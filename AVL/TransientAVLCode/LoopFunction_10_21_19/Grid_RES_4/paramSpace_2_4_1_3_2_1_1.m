function [aeroForces] = paramSpace_2_4_1_3_2_1_1(sailStates,airStates)

	CL = (4.197276)*sailStates.alpha + (0.248561)*sailStates.beta + (-2.303589)*sailStates.p + (33.399906)*sailStates.q + (-0.961748)*sailStates.r + (0.010863)*sailStates.de;
	CD = -0.185960;
	CY = (0.034437)*sailStates.alpha + (-0.024876)*sailStates.beta + (-0.394991)*sailStates.p + (-0.065299)*sailStates.q + (-0.025882)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.089614)*sailStates.alpha + (0.258839)*sailStates.beta + (-0.942634)*sailStates.p + (7.342451)*sailStates.q + (-0.841615)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-13.996787)*sailStates.alpha + (-1.035095)*sailStates.beta + (7.671588)*sailStates.p + (-129.003830)*sailStates.q + (3.290592)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.278932)*sailStates.alpha + (0.012243)*sailStates.beta + (0.821610)*sailStates.p + (-3.415504)*sailStates.q + (0.002431)*sailStates.r + (-0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end