function [aeroForces] = paramSpace_3_1_3_2_1_1_1(sailStates,airStates)

	CL = (4.064185)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.342361)*sailStates.p + (35.115314)*sailStates.q + (-1.240970)*sailStates.r + (0.011030)*sailStates.de;
	CD = -0.079450;
	CY = (-0.038753)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.354223)*sailStates.p + (-0.546499)*sailStates.q + (-0.062479)*sailStates.r + (-0.000116)*sailStates.de;

	Cl = (1.109944)*sailStates.alpha + (0.198913)*sailStates.beta + (-1.022517)*sailStates.p + (8.690561)*sailStates.q + (-0.951113)*sailStates.r + (0.000086)*sailStates.de;
	Cm = (-13.287084)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.449725)*sailStates.p + (-130.238892)*sailStates.q + (4.152351)*sailStates.r + (-0.067853)*sailStates.de;
	Cn = (-0.051225)*sailStates.alpha + (0.035074)*sailStates.beta + (0.678491)*sailStates.p + (-2.204158)*sailStates.q + (-0.016277)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end