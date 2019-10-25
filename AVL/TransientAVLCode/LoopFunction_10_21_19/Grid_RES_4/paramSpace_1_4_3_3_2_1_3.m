function [aeroForces] = paramSpace_1_4_3_3_2_1_3(sailStates,airStates)

	CL = (4.105264)*sailStates.alpha + (0.361154)*sailStates.beta + (-2.762268)*sailStates.p + (39.455494)*sailStates.q + (-1.736631)*sailStates.r + (0.011102)*sailStates.de;
	CD = -0.187410;
	CY = (-0.035133)*sailStates.alpha + (-0.024186)*sailStates.beta + (-0.546793)*sailStates.p + (0.194784)*sailStates.q + (-0.108757)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.308107)*sailStates.alpha + (0.376942)*sailStates.beta + (-1.328787)*sailStates.p + (11.833048)*sailStates.q + (-1.346920)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-12.618314)*sailStates.alpha + (-1.302321)*sailStates.beta + (8.491520)*sailStates.p + (-140.845245)*sailStates.q + (5.772563)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.207746)*sailStates.alpha + (0.052528)*sailStates.beta + (1.017825)*sailStates.p + (-3.931014)*sailStates.q + (-0.012922)*sailStates.r + (-0.000152)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end