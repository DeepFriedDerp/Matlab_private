function [aeroForces] = paramSpace_1_2_2_2_3_3_3(sailStates,airStates)

	CL = (4.067486)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.804568)*sailStates.p + (35.439632)*sailStates.q + (-0.195430)*sailStates.r + (0.010302)*sailStates.de;
	CD = -0.225590;
	CY = (0.142878)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.108374)*sailStates.p + (1.027328)*sailStates.q + (0.019109)*sailStates.r + (0.000220)*sailStates.de;

	Cl = (1.330021)*sailStates.alpha + (-0.095167)*sailStates.beta + (-1.460873)*sailStates.p + (12.136287)*sailStates.q + (0.069052)*sailStates.r + (0.000810)*sailStates.de;
	Cm = (-14.663345)*sailStates.alpha + (0.000000)*sailStates.beta + (9.952753)*sailStates.p + (-145.469635)*sailStates.q + (0.688026)*sailStates.r + (-0.069407)*sailStates.de;
	Cn = (0.049607)*sailStates.alpha + (-0.016780)*sailStates.beta + (-0.507269)*sailStates.p + (2.399105)*sailStates.q + (-0.031849)*sailStates.r + (-0.000248)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end