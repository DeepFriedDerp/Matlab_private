function [aeroForces] = paramSpace_1_4_2_2_1_3_3(sailStates,airStates)

	CL = (4.119705)*sailStates.alpha + (-0.028465)*sailStates.beta + (-2.793426)*sailStates.p + (34.613640)*sailStates.q + (0.077090)*sailStates.r + (0.009918)*sailStates.de;
	CD = -0.377940;
	CY = (0.002121)*sailStates.alpha + (-0.026282)*sailStates.beta + (0.313792)*sailStates.p + (-0.455225)*sailStates.q + (0.062433)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.388741)*sailStates.alpha + (-0.140318)*sailStates.beta + (-1.414348)*sailStates.p + (11.310867)*sailStates.q + (0.305160)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-14.621133)*sailStates.alpha + (0.122407)*sailStates.beta + (10.282971)*sailStates.p + (-145.756409)*sailStates.q + (-0.153773)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.202075)*sailStates.alpha + (-0.015960)*sailStates.beta + (-0.956970)*sailStates.p + (5.623997)*sailStates.q + (-0.073730)*sailStates.r + (0.000216)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end