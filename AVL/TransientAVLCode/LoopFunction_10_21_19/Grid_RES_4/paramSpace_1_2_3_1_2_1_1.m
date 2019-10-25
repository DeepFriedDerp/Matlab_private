function [aeroForces] = paramSpace_1_2_3_1_2_1_1(sailStates,airStates)

	CL = (6.263788)*sailStates.alpha + (-0.224193)*sailStates.beta + (-1.798178)*sailStates.p + (35.925640)*sailStates.q + (-2.891848)*sailStates.r + (0.011842)*sailStates.de;
	CD = -2.337600;
	CY = (0.336312)*sailStates.alpha + (-0.024295)*sailStates.beta + (-1.141357)*sailStates.p + (-0.662188)*sailStates.q + (-0.227054)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (1.345047)*sailStates.alpha + (0.536608)*sailStates.beta + (-0.533215)*sailStates.p + (5.461367)*sailStates.q + (-2.476919)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-9.328321)*sailStates.alpha + (0.840526)*sailStates.beta + (3.950836)*sailStates.p + (-110.966957)*sailStates.q + (9.556870)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (-1.964010)*sailStates.alpha + (0.121343)*sailStates.beta + (2.562322)*sailStates.p + (-10.990680)*sailStates.q + (0.038120)*sailStates.r + (0.000016)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end