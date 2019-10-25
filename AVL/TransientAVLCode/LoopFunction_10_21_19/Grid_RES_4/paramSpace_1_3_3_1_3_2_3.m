function [aeroForces] = paramSpace_1_3_3_1_3_2_3(sailStates,airStates)

	CL = (3.953428)*sailStates.alpha + (0.100807)*sailStates.beta + (-3.283721)*sailStates.p + (42.796234)*sailStates.q + (-1.750565)*sailStates.r + (0.011118)*sailStates.de;
	CD = -0.032800;
	CY = (0.092870)*sailStates.alpha + (-0.022582)*sailStates.beta + (-0.584094)*sailStates.p + (2.326709)*sailStates.q + (-0.116100)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (1.646213)*sailStates.alpha + (0.240324)*sailStates.beta + (-1.816506)*sailStates.p + (16.530998)*sailStates.q + (-1.292592)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-13.322370)*sailStates.alpha + (-0.343249)*sailStates.beta + (10.359281)*sailStates.p + (-156.352325)*sailStates.q + (5.801866)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (0.540932)*sailStates.alpha + (0.038714)*sailStates.beta + (0.939004)*sailStates.p + (-4.675586)*sailStates.q + (0.001378)*sailStates.r + (-0.000764)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end