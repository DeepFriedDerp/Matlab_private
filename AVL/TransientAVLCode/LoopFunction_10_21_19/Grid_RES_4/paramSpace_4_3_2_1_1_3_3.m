function [aeroForces] = paramSpace_4_3_2_1_1_3_3(sailStates,airStates)

	CL = (7.577060)*sailStates.alpha + (-0.275373)*sailStates.beta + (-3.453730)*sailStates.p + (50.728355)*sailStates.q + (4.002522)*sailStates.r + (0.012708)*sailStates.de;
	CD = -3.105100;
	CY = (0.247097)*sailStates.alpha + (-0.022582)*sailStates.beta + (1.616115)*sailStates.p + (-2.326712)*sailStates.q + (-0.321382)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (3.212943)*sailStates.alpha + (-0.804888)*sailStates.beta + (-1.870278)*sailStates.p + (18.625238)*sailStates.q + (3.381116)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-12.173330)*sailStates.alpha + (1.010897)*sailStates.beta + (8.886735)*sailStates.p + (-156.352325)*sailStates.q + (-13.204854)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-1.887042)*sailStates.alpha + (0.137913)*sailStates.beta + (-3.287156)*sailStates.p + (15.204041)*sailStates.q + (0.055182)*sailStates.r + (0.000992)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end