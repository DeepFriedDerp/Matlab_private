function [aeroForces] = paramSpace_2_1_1_3_2_1_1(sailStates,airStates)

	CL = (4.197276)*sailStates.alpha + (-0.248561)*sailStates.beta + (-2.303589)*sailStates.p + (33.399906)*sailStates.q + (-0.961748)*sailStates.r + (0.010863)*sailStates.de;
	CD = -0.185960;
	CY = (0.034437)*sailStates.alpha + (-0.024696)*sailStates.beta + (-0.394991)*sailStates.p + (-0.065299)*sailStates.q + (-0.025882)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.245941)*sailStates.alpha + (0.136334)*sailStates.beta + (-1.040322)*sailStates.p + (8.551012)*sailStates.q + (-0.848146)*sailStates.r + (0.000129)*sailStates.de;
	Cm = (-13.996787)*sailStates.alpha + (1.035095)*sailStates.beta + (7.671588)*sailStates.p + (-129.003830)*sailStates.q + (3.290592)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.216216)*sailStates.alpha + (0.013658)*sailStates.beta + (0.815207)*sailStates.p + (-3.336291)*sailStates.q + (0.002003)*sailStates.r + (-0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end