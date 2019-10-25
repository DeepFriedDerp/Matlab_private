function [aeroForces] = paramSpace_3_3_3_1_3_3_2(sailStates,airStates)

	CL = (5.604509)*sailStates.alpha + (-0.179571)*sailStates.beta + (-2.641557)*sailStates.p + (37.542984)*sailStates.q + (2.117669)*sailStates.r + (0.011565)*sailStates.de;
	CD = -1.824940;
	CY = (0.221197)*sailStates.alpha + (-0.025640)*sailStates.beta + (0.859299)*sailStates.p + (1.693499)*sailStates.q + (-0.056262)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.142796)*sailStates.alpha + (-0.543668)*sailStates.beta + (-1.220603)*sailStates.p + (10.257546)*sailStates.q + (1.957277)*sailStates.r + (0.000339)*sailStates.de;
	Cm = (-12.524756)*sailStates.alpha + (0.716746)*sailStates.beta + (8.455705)*sailStates.p + (-137.990799)*sailStates.q + (-7.210970)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.060999)*sailStates.alpha + (0.032457)*sailStates.beta + (-1.909342)*sailStates.p + (7.160381)*sailStates.q + (0.001952)*sailStates.r + (-0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end