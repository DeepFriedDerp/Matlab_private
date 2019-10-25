function [aeroForces] = paramSpace_4_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.459738)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.118989)*sailStates.p + (34.184498)*sailStates.q + (-1.616014)*sailStates.r + (0.011203)*sailStates.de;
	CD = -0.604160;
	CY = (-0.038801)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.583482)*sailStates.p + (-1.241891)*sailStates.q + (-0.081871)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (0.907855)*sailStates.alpha + (0.341545)*sailStates.beta + (-0.812972)*sailStates.p + (6.801414)*sailStates.q + (-1.400566)*sailStates.r + (-0.000272)*sailStates.de;
	Cm = (-12.120667)*sailStates.alpha + (0.000000)*sailStates.beta + (6.473048)*sailStates.p + (-123.350212)*sailStates.q + (5.468451)*sailStates.r + (-0.067889)*sailStates.de;
	Cn = (-0.503631)*sailStates.alpha + (0.048001)*sailStates.beta + (1.252529)*sailStates.p + (-4.377306)*sailStates.q + (-0.005266)*sailStates.r + (0.000273)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end