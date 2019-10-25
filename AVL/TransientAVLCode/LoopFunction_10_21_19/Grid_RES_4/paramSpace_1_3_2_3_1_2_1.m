function [aeroForces] = paramSpace_1_3_2_3_1_2_1(sailStates,airStates)

	CL = (3.803060)*sailStates.alpha + (0.061751)*sailStates.beta + (-2.243596)*sailStates.p + (33.088764)*sailStates.q + (-0.764257)*sailStates.r + (0.010474)*sailStates.de;
	CD = 0.077270;
	CY = (-0.072062)*sailStates.alpha + (-0.025728)*sailStates.beta + (-0.120133)*sailStates.p + (-0.684401)*sailStates.q + (-0.023871)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.014511)*sailStates.alpha + (0.102393)*sailStates.beta + (-0.950373)*sailStates.p + (7.702234)*sailStates.q + (-0.500383)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-13.595117)*sailStates.alpha + (-0.234879)*sailStates.beta + (7.524985)*sailStates.p + (-128.521423)*sailStates.q + (2.597296)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.129320)*sailStates.alpha + (0.018967)*sailStates.beta + (0.134654)*sailStates.p + (0.439088)*sailStates.q + (-0.035210)*sailStates.r + (0.000190)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end