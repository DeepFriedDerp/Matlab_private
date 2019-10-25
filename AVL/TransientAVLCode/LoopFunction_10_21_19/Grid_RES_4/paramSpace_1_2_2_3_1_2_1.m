function [aeroForces] = paramSpace_1_2_2_3_1_2_1(sailStates,airStates)

	CL = (3.803060)*sailStates.alpha + (-0.061750)*sailStates.beta + (-2.243596)*sailStates.p + (33.088764)*sailStates.q + (-0.764257)*sailStates.r + (0.010474)*sailStates.de;
	CD = 0.077270;
	CY = (-0.072062)*sailStates.alpha + (-0.024225)*sailStates.beta + (-0.120133)*sailStates.p + (-0.684401)*sailStates.q + (-0.023871)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.064602)*sailStates.alpha + (0.071511)*sailStates.beta + (-0.981911)*sailStates.p + (8.099203)*sailStates.q + (-0.506671)*sailStates.r + (0.000078)*sailStates.de;
	Cm = (-13.595117)*sailStates.alpha + (0.234879)*sailStates.beta + (7.524985)*sailStates.p + (-128.521423)*sailStates.q + (2.597295)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.147196)*sailStates.alpha + (0.015625)*sailStates.beta + (0.128381)*sailStates.p + (0.518050)*sailStates.q + (-0.036460)*sailStates.r + (0.000190)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end