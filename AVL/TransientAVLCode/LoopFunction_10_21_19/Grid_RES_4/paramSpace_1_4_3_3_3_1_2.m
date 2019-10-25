function [aeroForces] = paramSpace_1_4_3_3_3_1_2(sailStates,airStates)

	CL = (4.291567)*sailStates.alpha + (0.364783)*sailStates.beta + (-2.497102)*sailStates.p + (37.399387)*sailStates.q + (-1.761315)*sailStates.r + (0.010972)*sailStates.de;
	CD = -0.254270;
	CY = (0.065931)*sailStates.alpha + (-0.023279)*sailStates.beta + (-0.593683)*sailStates.p + (0.489620)*sailStates.q + (-0.118073)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.339655)*sailStates.alpha + (0.387392)*sailStates.beta + (-1.114010)*sailStates.p + (9.876856)*sailStates.q + (-1.367353)*sailStates.r + (0.000167)*sailStates.de;
	Cm = (-12.832750)*sailStates.alpha + (-1.313547)*sailStates.beta + (7.514042)*sailStates.p + (-133.122269)*sailStates.q + (5.843379)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.118095)*sailStates.alpha + (0.052367)*sailStates.beta + (1.158370)*sailStates.p + (-4.993988)*sailStates.q + (0.002456)*sailStates.r + (-0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end