function [aeroForces] = paramSpace_4_1_4_2_3_3_2(sailStates,airStates)

	CL = (4.158981)*sailStates.alpha + (0.445663)*sailStates.beta + (-2.559706)*sailStates.p + (38.563747)*sailStates.q + (1.820831)*sailStates.r + (0.011057)*sailStates.de;
	CD = -0.357960;
	CY = (0.101299)*sailStates.alpha + (-0.022144)*sailStates.beta + (0.590068)*sailStates.p + (0.756267)*sailStates.q + (-0.117291)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.219705)*sailStates.alpha + (-0.201938)*sailStates.beta + (-1.239209)*sailStates.p + (11.340346)*sailStates.q + (1.506158)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-11.579359)*sailStates.alpha + (-1.751441)*sailStates.beta + (7.684949)*sailStates.p + (-134.899979)*sailStates.q + (-6.099002)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.155563)*sailStates.alpha + (0.061466)*sailStates.beta + (-1.142146)*sailStates.p + (3.634882)*sailStates.q + (-0.023813)*sailStates.r + (-0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end