function [aeroForces] = paramSpace_1_2_3_1_2_2_3(sailStates,airStates)

	CL = (3.542935)*sailStates.alpha + (-0.080998)*sailStates.beta + (-3.332847)*sailStates.p + (42.522038)*sailStates.q + (-1.324395)*sailStates.r + (0.011132)*sailStates.de;
	CD = 0.083670;
	CY = (-0.035702)*sailStates.alpha + (-0.025657)*sailStates.beta + (-0.319567)*sailStates.p + (0.662187)*sailStates.q + (-0.063542)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.337890)*sailStates.alpha + (0.101321)*sailStates.beta + (-1.878621)*sailStates.p + (16.841242)*sailStates.q + (-0.949058)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-12.659002)*sailStates.alpha + (0.277956)*sailStates.beta + (10.929354)*sailStates.p + (-158.727341)*sailStates.q + (4.425375)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (0.522795)*sailStates.alpha + (0.025020)*sailStates.beta + (0.374675)*sailStates.p + (-0.809347)*sailStates.q + (-0.039994)*sailStates.r + (-0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end