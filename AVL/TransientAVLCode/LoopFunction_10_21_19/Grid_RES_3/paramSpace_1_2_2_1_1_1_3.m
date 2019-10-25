function [aeroForces] = paramSpace_1_2_2_1_1_1_3(sailStates,airStates)

	CL = (5.120911)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.558503)*sailStates.p + (49.299595)*sailStates.q + (-3.001698)*sailStates.r + (0.012643)*sailStates.de;
	CD = -1.870920;
	CY = (-0.555869)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.061937)*sailStates.p + (-1.081942)*sailStates.q + (-0.187248)*sailStates.r + (-0.000234)*sailStates.de;

	Cl = (1.171138)*sailStates.alpha + (0.574127)*sailStates.beta + (-1.955126)*sailStates.p + (18.404503)*sailStates.q + (-2.588614)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (-9.095063)*sailStates.alpha + (0.000000)*sailStates.beta + (10.314334)*sailStates.p + (-161.621323)*sailStates.q + (10.017311)*sailStates.r + (-0.071238)*sailStates.de;
	Cn = (1.755802)*sailStates.alpha + (0.101234)*sailStates.beta + (2.136285)*sailStates.p + (-7.544880)*sailStates.q + (-0.018971)*sailStates.r + (0.000079)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end