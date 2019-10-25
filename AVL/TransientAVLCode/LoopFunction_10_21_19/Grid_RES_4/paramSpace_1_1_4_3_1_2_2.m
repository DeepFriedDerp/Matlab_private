function [aeroForces] = paramSpace_1_1_4_3_1_2_2(sailStates,airStates)

	CL = (3.827235)*sailStates.alpha + (-0.155629)*sailStates.beta + (-2.476817)*sailStates.p + (34.860535)*sailStates.q + (-0.840725)*sailStates.r + (0.010607)*sailStates.de;
	CD = 0.064910;
	CY = (-0.061027)*sailStates.alpha + (-0.023380)*sailStates.beta + (-0.120641)*sailStates.p + (-0.489618)*sailStates.q + (-0.024050)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.223826)*sailStates.alpha + (0.023290)*sailStates.beta + (-1.210960)*sailStates.p + (10.396535)*sailStates.q + (-0.543589)*sailStates.r + (0.000487)*sailStates.de;
	Cm = (-13.806528)*sailStates.alpha + (0.480221)*sailStates.beta + (8.291525)*sailStates.p + (-134.519470)*sailStates.q + (2.810934)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (0.220642)*sailStates.alpha + (0.010424)*sailStates.beta + (0.100146)*sailStates.p + (0.573135)*sailStates.q + (-0.040507)*sailStates.r + (0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end