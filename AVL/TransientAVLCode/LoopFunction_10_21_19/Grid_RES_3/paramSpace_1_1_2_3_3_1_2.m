function [aeroForces] = paramSpace_1_1_2_3_3_1_2(sailStates,airStates)

	CL = (4.315745)*sailStates.alpha + (-0.314243)*sailStates.beta + (-2.517437)*sailStates.p + (37.149414)*sailStates.q + (-1.660355)*sailStates.r + (0.011013)*sailStates.de;
	CD = -0.255090;
	CY = (0.065599)*sailStates.alpha + (-0.026070)*sailStates.beta + (-0.579715)*sailStates.p + (0.491626)*sailStates.q + (-0.102219)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.472978)*sailStates.alpha + (0.171250)*sailStates.beta + (-1.215096)*sailStates.p + (10.921845)*sailStates.q + (-1.324183)*sailStates.r + (0.000416)*sailStates.de;
	Cm = (-13.111920)*sailStates.alpha + (1.161385)*sailStates.beta + (7.725396)*sailStates.p + (-133.990967)*sailStates.q + (5.539206)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (-0.038074)*sailStates.alpha + (0.048973)*sailStates.beta + (1.119125)*sailStates.p + (-4.730899)*sailStates.q + (0.001622)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end