function [aeroForces] = paramSpace_3_2_3_1_3_3_2(sailStates,airStates)

	CL = (5.604508)*sailStates.alpha + (0.179571)*sailStates.beta + (-2.641557)*sailStates.p + (37.542984)*sailStates.q + (2.117670)*sailStates.r + (0.011565)*sailStates.de;
	CD = -1.824940;
	CY = (0.221197)*sailStates.alpha + (-0.024313)*sailStates.beta + (0.859299)*sailStates.p + (1.693499)*sailStates.q + (-0.056262)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.189853)*sailStates.alpha + (-0.451417)*sailStates.beta + (-1.253251)*sailStates.p + (10.661421)*sailStates.q + (1.959431)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-12.524757)*sailStates.alpha + (-0.716746)*sailStates.beta + (8.455706)*sailStates.p + (-137.990799)*sailStates.q + (-7.210966)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.014275)*sailStates.alpha + (0.032764)*sailStates.beta + (-1.907202)*sailStates.p + (7.133910)*sailStates.q + (0.001811)*sailStates.r + (-0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end