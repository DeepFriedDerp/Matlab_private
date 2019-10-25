function [aeroForces] = paramSpace_4_1_3_2_2_2_2(sailStates,airStates)

	CL = (4.024233)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.702910)*sailStates.p + (35.549812)*sailStates.q + (-0.327746)*sailStates.r + (0.010740)*sailStates.de;
	CD = -0.031850;
	CY = (0.065771)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.015850)*sailStates.p + (0.520428)*sailStates.q + (0.002246)*sailStates.r + (0.000112)*sailStates.de;

	Cl = (1.308982)*sailStates.alpha + (-0.028801)*sailStates.beta + (-1.346772)*sailStates.p + (11.128821)*sailStates.q + (-0.104953)*sailStates.r + (0.000599)*sailStates.de;
	Cm = (-14.706486)*sailStates.alpha + (0.000000)*sailStates.beta + (9.354363)*sailStates.p + (-141.704483)*sailStates.q + (1.102032)*sailStates.r + (-0.069692)*sailStates.de;
	Cn = (0.097608)*sailStates.alpha + (-0.004048)*sailStates.beta + (-0.212219)*sailStates.p + (1.135798)*sailStates.q + (-0.018044)*sailStates.r + (-0.000137)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end