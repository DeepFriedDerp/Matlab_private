function [aeroForces] = paramSpace_2_2_2_2_2_1_2(sailStates,airStates)

	CL = (5.407598)*sailStates.alpha + (-4.103890)*sailStates.beta + (-3.485993)*sailStates.p + (48.005001)*sailStates.q + (2.326783)*sailStates.r + (0.010476)*sailStates.de;
	CD = -6.421160;
	CY = (1.833509)*sailStates.alpha + (-0.276609)*sailStates.beta + (0.372764)*sailStates.p + (15.740953)*sailStates.q + (-0.037927)*sailStates.r + (0.002998)*sailStates.de;

	Cl = (-5.897412)*sailStates.alpha + (-1.306797)*sailStates.beta + (-1.697107)*sailStates.p + (14.485586)*sailStates.q + (2.583952)*sailStates.r + (0.001262)*sailStates.de;
	Cm = (6.885373)*sailStates.alpha + (18.711052)*sailStates.beta + (10.776245)*sailStates.p + (-152.282654)*sailStates.q + (-8.272842)*sailStates.r + (-0.055380)*sailStates.de;
	Cn = (-1.933078)*sailStates.alpha + (0.394894)*sailStates.beta + (-1.035054)*sailStates.p + (-8.496223)*sailStates.q + (-0.204192)*sailStates.r + (-0.003937)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end