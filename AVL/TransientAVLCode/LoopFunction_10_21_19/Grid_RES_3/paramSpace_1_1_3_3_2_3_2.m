function [aeroForces] = paramSpace_1_1_3_3_2_3_2(sailStates,airStates)

	CL = (4.014548)*sailStates.alpha + (-0.001448)*sailStates.beta + (-2.442025)*sailStates.p + (32.873207)*sailStates.q + (-0.204026)*sailStates.r + (0.010299)*sailStates.de;
	CD = -0.103790;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.126652)*sailStates.p + (0.000000)*sailStates.q + (0.022332)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.280113)*sailStates.alpha + (-0.075377)*sailStates.beta + (-1.195374)*sailStates.p + (9.801642)*sailStates.q + (0.036165)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-14.791013)*sailStates.alpha + (-0.096127)*sailStates.beta + (8.656537)*sailStates.p + (-134.612778)*sailStates.q + (0.696552)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.226915)*sailStates.alpha + (-0.015748)*sailStates.beta + (-0.454656)*sailStates.p + (2.607872)*sailStates.q + (-0.036882)*sailStates.r + (0.000022)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end