function [aeroForces] = paramSpace_1_1_1_3_3_3_2(sailStates,airStates)

	CL = (3.875604)*sailStates.alpha + (-0.065940)*sailStates.beta + (-2.427402)*sailStates.p + (33.060448)*sailStates.q + (-0.352967)*sailStates.r + (0.010089)*sailStates.de;
	CD = -0.022270;
	CY = (0.059828)*sailStates.alpha + (-0.026191)*sailStates.beta + (0.009564)*sailStates.p + (0.491627)*sailStates.q + (0.001640)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.259538)*sailStates.alpha + (-0.045828)*sailStates.beta + (-1.186451)*sailStates.p + (9.829715)*sailStates.q + (-0.130192)*sailStates.r + (0.000416)*sailStates.de;
	Cm = (-14.223596)*sailStates.alpha + (0.271104)*sailStates.beta + (8.483705)*sailStates.p + (-133.990967)*sailStates.q + (1.238623)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (0.150641)*sailStates.alpha + (-0.007332)*sailStates.beta + (-0.232252)*sailStates.p + (1.462878)*sailStates.q + (-0.027137)*sailStates.r + (-0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end