function [aeroForces] = paramSpace_1_3_3_3_3_1_2(sailStates,airStates)

	CL = (4.345623)*sailStates.alpha + (0.289124)*sailStates.beta + (-2.518306)*sailStates.p + (37.091827)*sailStates.q + (-1.648883)*sailStates.r + (0.011117)*sailStates.de;
	CD = -0.252130;
	CY = (0.065597)*sailStates.alpha + (-0.023714)*sailStates.beta + (-0.560400)*sailStates.p + (0.491624)*sailStates.q + (-0.098767)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.350466)*sailStates.alpha + (0.352664)*sailStates.beta + (-1.130875)*sailStates.p + (9.858344)*sailStates.q + (-1.277999)*sailStates.r + (0.000188)*sailStates.de;
	Cm = (-13.346184)*sailStates.alpha + (-1.003776)*sailStates.beta + (7.736864)*sailStates.p + (-133.990982)*sailStates.q + (5.474167)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (-0.124762)*sailStates.alpha + (0.043749)*sailStates.beta + (1.105111)*sailStates.p + (-4.903000)*sailStates.q + (0.004402)*sailStates.r + (-0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end