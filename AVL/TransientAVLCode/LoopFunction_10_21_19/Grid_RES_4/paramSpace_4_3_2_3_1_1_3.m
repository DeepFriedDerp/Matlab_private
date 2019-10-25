function [aeroForces] = paramSpace_4_3_2_3_1_1_3(sailStates,airStates)

	CL = (3.925737)*sailStates.alpha + (-0.024491)*sailStates.beta + (-2.666849)*sailStates.p + (35.145950)*sailStates.q + (0.546885)*sailStates.r + (0.010339)*sailStates.de;
	CD = -0.037550;
	CY = (-0.081968)*sailStates.alpha + (-0.024272)*sailStates.beta + (0.020127)*sailStates.p + (-0.684401)*sailStates.q + (-0.003979)*sailStates.r + (-0.000146)*sailStates.de;

	Cl = (1.265488)*sailStates.alpha + (0.004666)*sailStates.beta + (-1.328489)*sailStates.p + (11.099454)*sailStates.q + (0.234521)*sailStates.r + (0.000589)*sailStates.de;
	Cm = (-14.453176)*sailStates.alpha + (0.064022)*sailStates.beta + (9.250888)*sailStates.p + (-141.172913)*sailStates.q + (-1.854706)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (-0.136873)*sailStates.alpha + (-0.002004)*sailStates.beta + (0.201083)*sailStates.p + (-1.211858)*sailStates.q + (-0.034166)*sailStates.r + (0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end