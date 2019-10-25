function [aeroForces] = paramSpace_1_4_2_1_1_3_3(sailStates,airStates)

	CL = (6.125331)*sailStates.alpha + (-0.320510)*sailStates.beta + (-3.192161)*sailStates.p + (34.096462)*sailStates.q + (1.351551)*sailStates.r + (0.009309)*sailStates.de;
	CD = -2.449550;
	CY = (0.266052)*sailStates.alpha + (-0.028080)*sailStates.beta + (0.963993)*sailStates.p + (-1.002334)*sailStates.q + (0.191786)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (2.366337)*sailStates.alpha + (-0.518420)*sailStates.beta + (-1.783172)*sailStates.p + (13.794625)*sailStates.q + (1.482722)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-15.915708)*sailStates.alpha + (1.232419)*sailStates.beta + (12.898248)*sailStates.p + (-160.076111)*sailStates.q + (-4.321338)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-0.623823)*sailStates.alpha + (-0.065353)*sailStates.beta + (-2.499238)*sailStates.p + (13.343016)*sailStates.q + (-0.131694)*sailStates.r + (0.000524)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end