function [aeroForces] = paramSpace_6_1_2_2_2_2_2(sailStates,airStates)

	CL = (4.094839)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.762025)*sailStates.p + (36.090012)*sailStates.q + (0.039699)*sailStates.r + (0.011004)*sailStates.de;
	CD = -0.051960;
	CY = (0.065813)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.090028)*sailStates.p + (0.466417)*sailStates.q + (0.006279)*sailStates.r + (0.000101)*sailStates.de;

	Cl = (1.333053)*sailStates.alpha + (-0.063860)*sailStates.beta + (-1.375625)*sailStates.p + (11.247765)*sailStates.q + (0.134431)*sailStates.r + (0.000618)*sailStates.de;
	Cm = (-14.768589)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.543741)*sailStates.p + (-142.955811)*sailStates.q + (-0.129859)*sailStates.r + (-0.070744)*sailStates.de;
	Cn = (0.031893)*sailStates.alpha + (-0.004465)*sailStates.beta + (-0.307188)*sailStates.p + (1.399671)*sailStates.q + (-0.005352)*sailStates.r + (-0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end