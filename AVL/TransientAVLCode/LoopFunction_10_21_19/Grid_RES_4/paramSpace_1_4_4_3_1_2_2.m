function [aeroForces] = paramSpace_1_4_4_3_1_2_2(sailStates,airStates)

	CL = (3.827235)*sailStates.alpha + (0.155629)*sailStates.beta + (-2.476817)*sailStates.p + (34.860535)*sailStates.q + (-0.840725)*sailStates.r + (0.010607)*sailStates.de;
	CD = 0.064910;
	CY = (-0.061027)*sailStates.alpha + (-0.026192)*sailStates.beta + (-0.120641)*sailStates.p + (-0.489618)*sailStates.q + (-0.024050)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.084053)*sailStates.alpha + (0.131488)*sailStates.beta + (-1.116555)*sailStates.p + (9.208652)*sailStates.q + (-0.524938)*sailStates.r + (0.000233)*sailStates.de;
	Cm = (-13.806528)*sailStates.alpha + (-0.480221)*sailStates.beta + (8.291525)*sailStates.p + (-134.519470)*sailStates.q + (2.810934)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (0.171189)*sailStates.alpha + (0.020363)*sailStates.beta + (0.118924)*sailStates.p + (0.336851)*sailStates.q + (-0.036797)*sailStates.r + (0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end