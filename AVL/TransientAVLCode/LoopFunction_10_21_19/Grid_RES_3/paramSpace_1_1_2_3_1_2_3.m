function [aeroForces] = paramSpace_1_1_2_3_1_2_3(sailStates,airStates)

	CL = (3.792048)*sailStates.alpha + (-0.157736)*sailStates.beta + (-2.751662)*sailStates.p + (37.062199)*sailStates.q + (-0.838183)*sailStates.r + (0.010734)*sailStates.de;
	CD = 0.070970;
	CY = (-0.056023)*sailStates.alpha + (-0.024029)*sailStates.beta + (-0.146195)*sailStates.p + (-0.318253)*sailStates.q + (-0.025778)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.310888)*sailStates.alpha + (0.033392)*sailStates.beta + (-1.424485)*sailStates.p + (12.308451)*sailStates.q + (-0.577807)*sailStates.r + (0.000809)*sailStates.de;
	Cm = (-13.627536)*sailStates.alpha + (0.570590)*sailStates.beta + (9.233378)*sailStates.p + (-142.287766)*sailStates.q + (2.832689)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.268840)*sailStates.alpha + (0.010622)*sailStates.beta + (0.120976)*sailStates.p + (0.558035)*sailStates.q + (-0.036263)*sailStates.r + (0.000075)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end