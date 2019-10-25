function [aeroForces] = paramSpace_1_4_1_2_1_3_3(sailStates,airStates)

	CL = (4.061005)*sailStates.alpha + (-0.008403)*sailStates.beta + (-2.792645)*sailStates.p + (34.662239)*sailStates.q + (0.068226)*sailStates.r + (0.009830)*sailStates.de;
	CD = -0.346400;
	CY = (-0.000380)*sailStates.alpha + (-0.026377)*sailStates.beta + (0.299318)*sailStates.p + (-0.455226)*sailStates.q + (0.059587)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.382894)*sailStates.alpha + (-0.132132)*sailStates.beta + (-1.413977)*sailStates.p + (11.313056)*sailStates.q + (0.281556)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-14.417836)*sailStates.alpha + (-0.010401)*sailStates.beta + (10.272481)*sailStates.p + (-145.756409)*sailStates.q + (-0.101035)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.209086)*sailStates.alpha + (-0.014133)*sailStates.beta + (-0.935109)*sailStates.p + (5.612994)*sailStates.q + (-0.074357)*sailStates.r + (0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end