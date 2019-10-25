function [aeroForces] = paramSpace_1_1_2_2_1_3_3(sailStates,airStates)

	CL = (4.119705)*sailStates.alpha + (0.028465)*sailStates.beta + (-2.793426)*sailStates.p + (34.613636)*sailStates.q + (0.077090)*sailStates.r + (0.009918)*sailStates.de;
	CD = -0.377940;
	CY = (0.002121)*sailStates.alpha + (-0.023290)*sailStates.beta + (0.313792)*sailStates.p + (-0.455225)*sailStates.q + (0.062433)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.522866)*sailStates.alpha + (-0.138837)*sailStates.beta + (-1.508721)*sailStates.p + (12.498747)*sailStates.q + (0.286346)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-14.621132)*sailStates.alpha + (-0.122407)*sailStates.beta + (10.282971)*sailStates.p + (-145.756378)*sailStates.q + (-0.153772)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.191083)*sailStates.alpha + (-0.039568)*sailStates.beta + (-0.975742)*sailStates.p + (5.860281)*sailStates.q + (-0.077473)*sailStates.r + (0.000216)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end