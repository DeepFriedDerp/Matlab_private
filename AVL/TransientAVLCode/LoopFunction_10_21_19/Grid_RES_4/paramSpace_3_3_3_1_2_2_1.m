function [aeroForces] = paramSpace_3_3_3_1_2_2_1(sailStates,airStates)

	CL = (3.746643)*sailStates.alpha + (-0.021492)*sailStates.beta + (-1.681880)*sailStates.p + (27.809361)*sailStates.q + (0.221085)*sailStates.r + (0.010633)*sailStates.de;
	CD = 0.031190;
	CY = (0.010422)*sailStates.alpha + (-0.025063)*sailStates.beta + (0.047089)*sailStates.p + (0.221995)*sailStates.q + (-0.003079)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (0.569912)*sailStates.alpha + (-0.035878)*sailStates.beta + (-0.468961)*sailStates.p + (2.878641)*sailStates.q + (0.144381)*sailStates.r + (-0.000847)*sailStates.de;
	Cm = (-13.701221)*sailStates.alpha + (0.088931)*sailStates.beta + (5.801842)*sailStates.p + (-112.898659)*sailStates.q + (-0.762468)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (0.052086)*sailStates.alpha + (0.002197)*sailStates.beta + (-0.087500)*sailStates.p + (0.192195)*sailStates.q + (-0.001753)*sailStates.r + (-0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end