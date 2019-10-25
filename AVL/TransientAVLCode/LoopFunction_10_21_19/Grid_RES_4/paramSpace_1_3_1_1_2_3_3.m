function [aeroForces] = paramSpace_1_3_1_1_2_3_3(sailStates,airStates)

	CL = (5.274552)*sailStates.alpha + (-0.080061)*sailStates.beta + (-3.161048)*sailStates.p + (34.688641)*sailStates.q + (0.908505)*sailStates.r + (0.009357)*sailStates.de;
	CD = -1.840600;
	CY = (0.330650)*sailStates.alpha + (-0.024203)*sailStates.beta + (0.683086)*sailStates.p + (0.662188)*sailStates.q + (0.135803)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.734069)*sailStates.alpha + (-0.383786)*sailStates.beta + (-1.792444)*sailStates.p + (14.354399)*sailStates.q + (1.097246)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-14.759360)*sailStates.alpha + (0.299473)*sailStates.beta + (12.379090)*sailStates.p + (-158.727356)*sailStates.q + (-2.862938)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-0.570768)*sailStates.alpha + (-0.068158)*sailStates.beta + (-1.922889)*sailStates.p + (9.618160)*sailStates.q + (-0.093388)*sailStates.r + (0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end