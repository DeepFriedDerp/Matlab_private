function [aeroForces] = paramSpace_3_3_3_3_2_3_3(sailStates,airStates)

	CL = (4.259016)*sailStates.alpha + (-0.079330)*sailStates.beta + (-2.843784)*sailStates.p + (37.866627)*sailStates.q + (1.024780)*sailStates.r + (0.011312)*sailStates.de;
	CD = -0.191080;
	CY = (0.035125)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.402019)*sailStates.p + (-0.065300)*sailStates.q + (-0.026352)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.392561)*sailStates.alpha + (-0.220778)*sailStates.beta + (-1.409619)*sailStates.p + (11.763897)*sailStates.q + (0.878118)*sailStates.r + (0.000645)*sailStates.de;
	Cm = (-14.242605)*sailStates.alpha + (0.312286)*sailStates.beta + (9.478664)*sailStates.p + (-144.341232)*sailStates.q + (-3.483065)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (-0.094976)*sailStates.alpha + (0.012777)*sailStates.beta + (-0.814017)*sailStates.p + (3.414139)*sailStates.q + (0.001818)*sailStates.r + (0.000085)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end