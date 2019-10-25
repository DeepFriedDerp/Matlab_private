function [aeroForces] = paramSpace_3_2_2_2_2_1_3(sailStates,airStates)

	CL = (4.406430)*sailStates.alpha + (-0.056557)*sailStates.beta + (-2.942672)*sailStates.p + (37.011616)*sailStates.q + (-0.627496)*sailStates.r + (0.011013)*sailStates.de;
	CD = -0.415800;
	CY = (-0.077845)*sailStates.alpha + (-0.025009)*sailStates.beta + (-0.392457)*sailStates.p + (-0.100924)*sailStates.q + (0.025727)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.503405)*sailStates.alpha + (0.186841)*sailStates.beta + (-1.544658)*sailStates.p + (12.718181)*sailStates.q + (-0.683470)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-14.871272)*sailStates.alpha + (0.238961)*sailStates.beta + (10.325293)*sailStates.p + (-148.239975)*sailStates.q + (2.140712)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.060236)*sailStates.alpha + (-0.013769)*sailStates.beta + (0.969203)*sailStates.p + (-4.624527)*sailStates.q + (-0.012145)*sailStates.r + (-0.000051)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end