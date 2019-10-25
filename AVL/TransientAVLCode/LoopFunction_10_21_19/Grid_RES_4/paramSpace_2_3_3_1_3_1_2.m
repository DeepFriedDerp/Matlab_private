function [aeroForces] = paramSpace_2_3_3_1_3_1_2(sailStates,airStates)

	CL = (7.658763)*sailStates.alpha + (0.213257)*sailStates.beta + (-2.607719)*sailStates.p + (37.713432)*sailStates.q + (-2.993541)*sailStates.r + (0.011589)*sailStates.de;
	CD = -2.965280;
	CY = (0.227761)*sailStates.alpha + (-0.024432)*sailStates.beta + (-1.391914)*sailStates.p + (1.693499)*sailStates.q + (-0.091171)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (2.868155)*sailStates.alpha + (0.692035)*sailStates.beta + (-1.199506)*sailStates.p + (10.315951)*sailStates.q + (-2.656035)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-15.348849)*sailStates.alpha + (-0.810714)*sailStates.beta + (8.070199)*sailStates.p + (-136.398376)*sailStates.q + (10.113780)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.636145)*sailStates.alpha + (0.039357)*sailStates.beta + (3.011707)*sailStates.p + (-14.754010)*sailStates.q + (0.028377)*sailStates.r + (-0.000742)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end