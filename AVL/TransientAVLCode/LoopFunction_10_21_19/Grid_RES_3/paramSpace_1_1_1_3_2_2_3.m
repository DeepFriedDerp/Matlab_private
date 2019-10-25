function [aeroForces] = paramSpace_1_1_1_3_2_2_3(sailStates,airStates)

	CL = (3.782278)*sailStates.alpha + (-0.197923)*sailStates.beta + (-2.737783)*sailStates.p + (37.192135)*sailStates.q + (-0.976412)*sailStates.r + (0.010626)*sailStates.de;
	CD = 0.083170;
	CY = (-0.005131)*sailStates.alpha + (-0.025311)*sailStates.beta + (-0.244057)*sailStates.p + (0.173375)*sailStates.q + (-0.043050)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.344892)*sailStates.alpha + (0.053885)*sailStates.beta + (-1.415965)*sailStates.p + (12.333876)*sailStates.q + (-0.713095)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-13.399824)*sailStates.alpha + (0.781034)*sailStates.beta + (9.071419)*sailStates.p + (-141.665955)*sailStates.q + (3.313065)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.227036)*sailStates.alpha + (0.017340)*sailStates.beta + (0.314589)*sailStates.p + (-0.571923)*sailStates.q + (-0.026434)*sailStates.r + (-0.000062)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end