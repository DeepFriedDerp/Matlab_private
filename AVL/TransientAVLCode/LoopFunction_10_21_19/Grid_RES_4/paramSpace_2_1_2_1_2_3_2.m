function [aeroForces] = paramSpace_2_1_2_1_2_3_2(sailStates,airStates)

	CL = (6.138895)*sailStates.alpha + (0.438366)*sailStates.beta + (-2.489027)*sailStates.p + (32.051899)*sailStates.q + (1.886772)*sailStates.r + (0.010327)*sailStates.de;
	CD = -2.185380;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.967521)*sailStates.p + (-0.000000)*sailStates.q + (0.063415)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.869760)*sailStates.alpha + (-0.357052)*sailStates.beta + (-1.229289)*sailStates.p + (9.614690)*sailStates.q + (1.836951)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-15.446347)*sailStates.alpha + (-1.713742)*sailStates.beta + (9.182005)*sailStates.p + (-136.150452)*sailStates.q + (-6.384989)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.419883)*sailStates.alpha + (-0.035377)*sailStates.beta + (-2.248869)*sailStates.p + (10.515132)*sailStates.q + (-0.021715)*sailStates.r + (0.000195)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end