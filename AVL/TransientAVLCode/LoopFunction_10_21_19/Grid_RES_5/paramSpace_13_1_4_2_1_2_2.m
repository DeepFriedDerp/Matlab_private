function [aeroForces] = paramSpace_13_1_4_2_1_2_2(sailStates,airStates)

	CL = (4.176698)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.735761)*sailStates.p + (38.825039)*sailStates.q + (1.614212)*sailStates.r + (0.011073)*sailStates.de;
	CD = -0.150050;
	CY = (-0.022012)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.557859)*sailStates.p + (-0.546498)*sailStates.q + (-0.098424)*sailStates.r + (-0.000117)*sailStates.de;

	Cl = (1.455027)*sailStates.alpha + (-0.257135)*sailStates.beta + (-1.349723)*sailStates.p + (11.988386)*sailStates.q + (1.289980)*sailStates.r + (0.000588)*sailStates.de;
	Cm = (-13.082238)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.540253)*sailStates.p + (-140.819473)*sailStates.q + (-5.422361)*sailStates.r + (-0.068914)*sailStates.de;
	Cn = (-0.147905)*sailStates.alpha + (0.045340)*sailStates.beta + (-1.027018)*sailStates.p + (4.133925)*sailStates.q + (-0.004614)*sailStates.r + (0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end