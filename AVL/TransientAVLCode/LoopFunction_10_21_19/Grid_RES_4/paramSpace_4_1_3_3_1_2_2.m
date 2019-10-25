function [aeroForces] = paramSpace_4_1_3_3_1_2_2(sailStates,airStates)

	CL = (3.860771)*sailStates.alpha + (0.231924)*sailStates.beta + (-2.446478)*sailStates.p + (35.118332)*sailStates.q + (1.108426)*sailStates.r + (0.010428)*sailStates.de;
	CD = 0.055340;
	CY = (-0.062690)*sailStates.alpha + (-0.026395)*sailStates.beta + (0.304970)*sailStates.p + (-0.489620)*sailStates.q + (-0.060680)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.309435)*sailStates.alpha + (-0.058193)*sailStates.beta + (-1.192253)*sailStates.p + (10.451971)*sailStates.q + (0.796135)*sailStates.r + (0.000422)*sailStates.de;
	Cm = (-13.406001)*sailStates.alpha + (-0.858445)*sailStates.beta + (7.936856)*sailStates.p + (-133.122253)*sailStates.q + (-3.717751)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.064194)*sailStates.alpha + (0.024974)*sailStates.beta + (-0.471672)*sailStates.p + (1.677125)*sailStates.q + (-0.017368)*sailStates.r + (0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end