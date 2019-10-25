function [aeroForces] = paramSpace_1_1_2_1_2_1_1(sailStates,airStates)

	CL = (6.213993)*sailStates.alpha + (-0.588937)*sailStates.beta + (-1.777925)*sailStates.p + (34.822395)*sailStates.q + (-2.813740)*sailStates.r + (0.011597)*sailStates.de;
	CD = -2.345820;
	CY = (0.344660)*sailStates.alpha + (-0.023346)*sailStates.beta + (-1.139184)*sailStates.p + (-0.589406)*sailStates.q + (-0.200869)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (1.369879)*sailStates.alpha + (0.432981)*sailStates.beta + (-0.552160)*sailStates.p + (5.485859)*sailStates.q + (-2.443845)*sailStates.r + (-0.000668)*sailStates.de;
	Cm = (-9.691788)*sailStates.alpha + (2.243836)*sailStates.beta + (4.150180)*sailStates.p + (-110.634644)*sailStates.q + (9.359206)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (-1.922354)*sailStates.alpha + (0.110396)*sailStates.beta + (2.543734)*sailStates.p + (-10.928054)*sailStates.q + (0.034780)*sailStates.r + (-0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end