function [aeroForces] = paramSpace_1_1_4_3_3_2_2(sailStates,airStates)

	CL = (3.931508)*sailStates.alpha + (-0.190510)*sailStates.beta + (-2.447902)*sailStates.p + (35.021889)*sailStates.q + (-1.091514)*sailStates.r + (0.010601)*sailStates.de;
	CD = 0.038810;
	CY = (0.062687)*sailStates.alpha + (-0.026192)*sailStates.beta + (-0.276289)*sailStates.p + (0.489619)*sailStates.q + (-0.054905)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.307132)*sailStates.alpha + (0.045511)*sailStates.beta + (-1.192975)*sailStates.p + (10.447552)*sailStates.q + (-0.749398)*sailStates.r + (0.000422)*sailStates.de;
	Cm = (-13.798389)*sailStates.alpha + (0.595301)*sailStates.beta + (7.956058)*sailStates.p + (-133.122253)*sailStates.q + (3.621219)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (0.059671)*sailStates.alpha + (0.021975)*sailStates.beta + (0.428489)*sailStates.p + (-1.654908)*sailStates.q + (-0.017002)*sailStates.r + (-0.000188)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end