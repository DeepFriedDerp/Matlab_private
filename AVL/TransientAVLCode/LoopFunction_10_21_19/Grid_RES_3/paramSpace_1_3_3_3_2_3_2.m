function [aeroForces] = paramSpace_1_3_3_3_2_3_2(sailStates,airStates)

	CL = (4.014548)*sailStates.alpha + (0.001448)*sailStates.beta + (-2.442024)*sailStates.p + (32.873207)*sailStates.q + (-0.204027)*sailStates.r + (0.010299)*sailStates.de;
	CD = -0.103790;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.126652)*sailStates.p + (0.000000)*sailStates.q + (0.022332)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.147437)*sailStates.alpha + (-0.052829)*sailStates.beta + (-1.110721)*sailStates.p + (8.740776)*sailStates.q + (0.050991)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-14.791013)*sailStates.alpha + (0.096127)*sailStates.beta + (8.656538)*sailStates.p + (-134.612778)*sailStates.q + (0.696552)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.218682)*sailStates.alpha + (-0.006858)*sailStates.beta + (-0.439730)*sailStates.p + (2.420813)*sailStates.q + (-0.034267)*sailStates.r + (0.000022)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end