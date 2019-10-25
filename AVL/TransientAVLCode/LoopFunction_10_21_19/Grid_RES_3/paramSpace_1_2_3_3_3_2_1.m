function [aeroForces] = paramSpace_1_2_3_3_3_2_1(sailStates,airStates)

	CL = (3.999702)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.237614)*sailStates.p + (33.126514)*sailStates.q + (-0.906118)*sailStates.r + (0.010732)*sailStates.de;
	CD = 0.031360;
	CY = (0.066187)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.229737)*sailStates.p + (0.318253)*sailStates.q + (-0.040479)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.125286)*sailStates.alpha + (0.102171)*sailStates.beta + (-0.959644)*sailStates.p + (7.928630)*sailStates.q + (-0.603314)*sailStates.r + (-0.000027)*sailStates.de;
	Cm = (-14.126427)*sailStates.alpha + (0.000000)*sailStates.beta + (7.354074)*sailStates.p + (-127.854218)*sailStates.q + (3.014609)*sailStates.r + (-0.067624)*sailStates.de;
	Cn = (-0.081771)*sailStates.alpha + (0.018016)*sailStates.beta + (0.388325)*sailStates.p + (-1.663440)*sailStates.q + (-0.008346)*sailStates.r + (-0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end