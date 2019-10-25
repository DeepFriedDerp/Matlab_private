function [aeroForces] = paramSpace_1_3_1_3_2_3_3(sailStates,airStates)

	CL = (3.862520)*sailStates.alpha + (0.061455)*sailStates.beta + (-2.693184)*sailStates.p + (35.118874)*sailStates.q + (-0.317071)*sailStates.r + (0.010215)*sailStates.de;
	CD = -0.044410;
	CY = (0.027612)*sailStates.alpha + (-0.024351)*sailStates.beta + (0.060240)*sailStates.p + (0.173374)*sailStates.q + (0.010605)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.237220)*sailStates.alpha + (-0.017505)*sailStates.beta + (-1.317234)*sailStates.p + (10.725623)*sailStates.q + (-0.085436)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.148814)*sailStates.alpha + (-0.257090)*sailStates.beta + (9.456307)*sailStates.p + (-141.665955)*sailStates.q + (1.130254)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.176232)*sailStates.alpha + (-0.001770)*sailStates.beta + (-0.360687)*sailStates.p + (2.345387)*sailStates.q + (-0.037874)*sailStates.r + (-0.000001)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end