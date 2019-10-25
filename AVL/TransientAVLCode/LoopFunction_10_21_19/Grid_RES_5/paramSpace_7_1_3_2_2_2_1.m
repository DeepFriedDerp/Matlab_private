function [aeroForces] = paramSpace_7_1_3_2_2_2_1(sailStates,airStates)

	CL = (4.148815)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.352596)*sailStates.p + (32.906712)*sailStates.q + (0.269926)*sailStates.r + (0.010936)*sailStates.de;
	CD = -0.075600;
	CY = (0.033273)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.159401)*sailStates.p + (0.381223)*sailStates.q + (0.005580)*sailStates.r + (0.000082)*sailStates.de;

	Cl = (1.145838)*sailStates.alpha + (-0.095133)*sailStates.beta + (-1.034221)*sailStates.p + (8.076272)*sailStates.q + (0.316494)*sailStates.r + (0.000058)*sailStates.de;
	Cm = (-14.861991)*sailStates.alpha + (0.000000)*sailStates.beta + (8.138456)*sailStates.p + (-131.546402)*sailStates.q + (-0.933520)*sailStates.r + (-0.069816)*sailStates.de;
	Cn = (0.115192)*sailStates.alpha + (-0.003322)*sailStates.beta + (-0.394038)*sailStates.p + (1.562151)*sailStates.q + (-0.001505)*sailStates.r + (-0.000082)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end