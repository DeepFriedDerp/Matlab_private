function [aeroForces] = paramSpace_2_4_3_2_1_2_3(sailStates,airStates)

	CL = (3.921412)*sailStates.alpha + (0.037677)*sailStates.beta + (-2.957214)*sailStates.p + (37.910728)*sailStates.q + (-0.178128)*sailStates.r + (0.011090)*sailStates.de;
	CD = 0.025210;
	CY = (-0.075733)*sailStates.alpha + (-0.025429)*sailStates.beta + (0.040530)*sailStates.p + (-0.668511)*sailStates.q + (0.002633)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.289527)*sailStates.alpha + (0.018763)*sailStates.beta + (-1.483439)*sailStates.p + (12.142897)*sailStates.q + (-0.090632)*sailStates.r + (0.000756)*sailStates.de;
	Cm = (-14.251241)*sailStates.alpha + (-0.111559)*sailStates.beta + (10.122778)*sailStates.p + (-147.557632)*sailStates.q + (0.600432)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (0.143567)*sailStates.alpha + (0.001800)*sailStates.beta + (-0.150365)*sailStates.p + (1.436430)*sailStates.q + (-0.009421)*sailStates.r + (0.000194)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end