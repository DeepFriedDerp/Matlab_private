function [aeroForces] = paramSpace_1_1_3_3_3_1_2(sailStates,airStates)

	CL = (4.291567)*sailStates.alpha + (-0.364783)*sailStates.beta + (-2.497102)*sailStates.p + (37.399387)*sailStates.q + (-1.761315)*sailStates.r + (0.010972)*sailStates.de;
	CD = -0.254270;
	CY = (0.065931)*sailStates.alpha + (-0.026293)*sailStates.beta + (-0.593683)*sailStates.p + (0.489620)*sailStates.q + (-0.118073)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.470806)*sailStates.alpha + (0.158982)*sailStates.beta + (-1.208400)*sailStates.p + (11.064736)*sailStates.q + (-1.386086)*sailStates.r + (0.000422)*sailStates.de;
	Cm = (-12.832750)*sailStates.alpha + (1.313547)*sailStates.beta + (7.514041)*sailStates.p + (-133.122253)*sailStates.q + (5.843380)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.016729)*sailStates.alpha + (0.056313)*sailStates.beta + (1.139595)*sailStates.p + (-4.757703)*sailStates.q + (-0.001270)*sailStates.r + (-0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end