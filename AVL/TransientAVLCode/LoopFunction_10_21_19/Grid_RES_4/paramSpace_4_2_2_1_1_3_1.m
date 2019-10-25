function [aeroForces] = paramSpace_4_2_2_1_1_3_1(sailStates,airStates)

	CL = (7.459600)*sailStates.alpha + (0.244001)*sailStates.beta + (-1.749050)*sailStates.p + (36.199844)*sailStates.q + (3.318019)*sailStates.r + (0.011836)*sailStates.de;
	CD = -2.988650;
	CY = (-0.688317)*sailStates.alpha + (-0.026007)*sailStates.beta + (1.405883)*sailStates.p + (-1.002335)*sailStates.q + (-0.279612)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (2.345388)*sailStates.alpha + (-0.593388)*sailStates.beta + (-0.502644)*sailStates.p + (5.548096)*sailStates.q + (2.826713)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-10.513184)*sailStates.alpha + (-0.905819)*sailStates.beta + (3.380766)*sailStates.p + (-108.591942)*sailStates.q + (-10.933359)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (2.589479)*sailStates.alpha + (0.136861)*sailStates.beta + (-3.120377)*sailStates.p + (14.777960)*sailStates.q + (0.078247)*sailStates.r + (0.000483)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end