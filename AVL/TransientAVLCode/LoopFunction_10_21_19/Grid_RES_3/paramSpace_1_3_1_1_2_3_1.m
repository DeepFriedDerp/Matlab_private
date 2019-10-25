function [aeroForces] = paramSpace_1_3_1_1_2_3_1(sailStates,airStates)

	CL = (5.412341)*sailStates.alpha + (-0.315825)*sailStates.beta + (-1.473580)*sailStates.p + (20.758507)*sailStates.q + (1.667143)*sailStates.r + (0.008742)*sailStates.de;
	CD = -2.043440;
	CY = (-0.406282)*sailStates.alpha + (-0.026462)*sailStates.beta + (0.914292)*sailStates.p + (-0.589406)*sailStates.q + (0.161270)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (0.937453)*sailStates.alpha + (-0.538355)*sailStates.beta + (-0.371101)*sailStates.p + (0.699547)*sailStates.q + (1.713478)*sailStates.r + (-0.000892)*sailStates.de;
	Cm = (-15.796853)*sailStates.alpha + (1.169760)*sailStates.beta + (6.762067)*sailStates.p + (-110.634644)*sailStates.q + (-5.453536)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (2.009886)*sailStates.alpha + (-0.066657)*sailStates.beta + (-2.113555)*sailStates.p + (10.012932)*sailStates.q + (-0.059205)*sailStates.r + (0.000325)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end