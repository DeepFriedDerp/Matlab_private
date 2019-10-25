function [aeroForces] = paramSpace_2_2_1_3_3_3_1(sailStates,airStates)

	CL = (4.097192)*sailStates.alpha + (0.012404)*sailStates.beta + (-2.284060)*sailStates.p + (32.131977)*sailStates.q + (0.210605)*sailStates.r + (0.010715)*sailStates.de;
	CD = -0.084510;
	CY = (0.038261)*sailStates.alpha + (-0.025176)*sailStates.beta + (0.140392)*sailStates.p + (0.432842)*sailStates.q + (0.009156)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.137889)*sailStates.alpha + (-0.082602)*sailStates.beta + (-1.003101)*sailStates.p + (7.819530)*sailStates.q + (0.266739)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.742023)*sailStates.alpha + (-0.031304)*sailStates.beta + (7.970948)*sailStates.p + (-129.813766)*sailStates.q + (-0.689456)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.152037)*sailStates.alpha + (-0.005921)*sailStates.beta + (-0.400918)*sailStates.p + (1.807920)*sailStates.q + (-0.004660)*sailStates.r + (-0.000075)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end