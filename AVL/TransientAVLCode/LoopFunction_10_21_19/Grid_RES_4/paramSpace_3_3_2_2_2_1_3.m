function [aeroForces] = paramSpace_3_3_2_2_2_1_3(sailStates,airStates)

	CL = (4.406430)*sailStates.alpha + (0.056557)*sailStates.beta + (-2.942672)*sailStates.p + (37.011616)*sailStates.q + (-0.627496)*sailStates.r + (0.011013)*sailStates.de;
	CD = -0.415800;
	CY = (-0.077845)*sailStates.alpha + (-0.024944)*sailStates.beta + (-0.392457)*sailStates.p + (-0.100924)*sailStates.q + (0.025727)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.457348)*sailStates.alpha + (0.213523)*sailStates.beta + (-1.512009)*sailStates.p + (12.314305)*sailStates.q + (-0.685596)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.871271)*sailStates.alpha + (-0.238961)*sailStates.beta + (10.325292)*sailStates.p + (-148.239990)*sailStates.q + (2.140712)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.045705)*sailStates.alpha + (-0.012472)*sailStates.beta + (0.967063)*sailStates.p + (-4.598055)*sailStates.q + (-0.012005)*sailStates.r + (-0.000051)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end