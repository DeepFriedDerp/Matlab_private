function [aeroForces] = paramSpace_1_2_3_2_3_3_1(sailStates,airStates)

	CL = (4.118488)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.023514)*sailStates.p + (28.797409)*sailStates.q + (0.093247)*sailStates.r + (0.010033)*sailStates.de;
	CD = -0.280870;
	CY = (0.022087)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.213186)*sailStates.p + (0.491415)*sailStates.q + (0.037637)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (0.953177)*sailStates.alpha + (-0.126199)*sailStates.beta + (-0.820284)*sailStates.p + (6.014542)*sailStates.q + (0.327701)*sailStates.r + (-0.000222)*sailStates.de;
	Cm = (-15.056770)*sailStates.alpha + (0.000000)*sailStates.beta + (7.418169)*sailStates.p + (-123.667763)*sailStates.q + (-0.298503)*sailStates.r + (-0.067234)*sailStates.de;
	Cn = (0.326510)*sailStates.alpha + (-0.022252)*sailStates.beta + (-0.600854)*sailStates.p + (2.555248)*sailStates.q + (-0.022997)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end