function [aeroForces] = paramSpace_1_1_1_2_3_1_1(sailStates,airStates)

	CL = (4.701526)*sailStates.alpha + (-0.404752)*sailStates.beta + (-2.143170)*sailStates.p + (35.086605)*sailStates.q + (-1.960961)*sailStates.r + (0.010947)*sailStates.de;
	CD = -0.626270;
	CY = (0.198353)*sailStates.alpha + (-0.026191)*sailStates.beta + (-0.765164)*sailStates.p + (0.491414)*sailStates.q + (-0.134966)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.471781)*sailStates.alpha + (0.249837)*sailStates.beta + (-0.897557)*sailStates.p + (8.176560)*sailStates.q + (-1.632496)*sailStates.r + (-0.000110)*sailStates.de;
	Cm = (-12.309960)*sailStates.alpha + (1.575093)*sailStates.beta + (6.150306)*sailStates.p + (-122.751343)*sailStates.q + (6.552952)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.648017)*sailStates.alpha + (0.068119)*sailStates.beta + (1.582354)*sailStates.p + (-6.979470)*sailStates.q + (0.018887)*sailStates.r + (-0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end