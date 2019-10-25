function [aeroForces] = paramSpace_3_4_1_1_3_1_1(sailStates,airStates)

	CL = (6.998488)*sailStates.alpha + (0.557558)*sailStates.beta + (-1.621729)*sailStates.p + (24.758028)*sailStates.q + (-2.460452)*sailStates.r + (0.010004)*sailStates.de;
	CD = -2.881670;
	CY = (0.699465)*sailStates.alpha + (-0.026223)*sailStates.beta + (-1.306590)*sailStates.p + (1.915492)*sailStates.q + (0.085436)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (1.960274)*sailStates.alpha + (0.734073)*sailStates.beta + (-0.419692)*sailStates.p + (1.668613)*sailStates.q + (-2.345928)*sailStates.r + (-0.000891)*sailStates.de;
	Cm = (-16.607250)*sailStates.alpha + (-2.246031)*sailStates.beta + (6.428751)*sailStates.p + (-112.650780)*sailStates.q + (8.338262)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-2.728160)*sailStates.alpha + (-0.032418)*sailStates.beta + (2.874332)*sailStates.p + (-14.320969)*sailStates.q + (-0.032897)*sailStates.r + (-0.000736)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end