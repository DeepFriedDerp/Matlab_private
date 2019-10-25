function [aeroForces] = paramSpace_1_4_2_3_3_1_2(sailStates,airStates)

	CL = (4.260950)*sailStates.alpha + (0.385530)*sailStates.beta + (-2.496389)*sailStates.p + (37.447598)*sailStates.q + (-1.769783)*sailStates.r + (0.010886)*sailStates.de;
	CD = -0.250820;
	CY = (0.065934)*sailStates.alpha + (-0.023177)*sailStates.beta + (-0.608024)*sailStates.p + (0.489619)*sailStates.q + (-0.120961)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.341838)*sailStates.alpha + (0.395035)*sailStates.beta + (-1.113671)*sailStates.p + (9.879066)*sailStates.q + (-1.390614)*sailStates.r + (0.000167)*sailStates.de;
	Cm = (-12.636556)*sailStates.alpha + (-1.445120)*sailStates.beta + (7.504442)*sailStates.p + (-133.122269)*sailStates.q + (5.891644)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.117520)*sailStates.alpha + (0.053618)*sailStates.beta + (1.179985)*sailStates.p + (-5.005098)*sailStates.q + (0.002156)*sailStates.r + (-0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end