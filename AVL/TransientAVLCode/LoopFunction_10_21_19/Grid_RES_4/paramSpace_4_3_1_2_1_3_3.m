function [aeroForces] = paramSpace_4_3_1_2_1_3_3(sailStates,airStates)

	CL = (4.806243)*sailStates.alpha + (-0.153520)*sailStates.beta + (-2.923744)*sailStates.p + (42.238251)*sailStates.q + (2.344801)*sailStates.r + (0.011678)*sailStates.de;
	CD = -0.636430;
	CY = (-0.004678)*sailStates.alpha + (-0.023962)*sailStates.beta + (0.836569)*sailStates.p + (-1.057314)*sailStates.q + (-0.166290)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.767580)*sailStates.alpha + (-0.427845)*sailStates.beta + (-1.476461)*sailStates.p + (13.758300)*sailStates.q + (1.873476)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-12.868390)*sailStates.alpha + (0.537528)*sailStates.beta + (8.510582)*sailStates.p + (-144.624466)*sailStates.q + (-7.741047)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.374892)*sailStates.alpha + (0.073459)*sailStates.beta + (-1.635248)*sailStates.p + (7.284728)*sailStates.q + (0.010607)*sailStates.r + (0.000469)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end