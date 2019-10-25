function [aeroForces] = paramSpace_1_3_2_2_1_3_3(sailStates,airStates)

	CL = (4.236095)*sailStates.alpha + (-0.055484)*sailStates.beta + (-2.827698)*sailStates.p + (34.978676)*sailStates.q + (0.201166)*sailStates.r + (0.010169)*sailStates.de;
	CD = -0.417240;
	CY = (0.003629)*sailStates.alpha + (-0.026069)*sailStates.beta + (0.352044)*sailStates.p + (-0.491414)*sailStates.q + (0.062075)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.433915)*sailStates.alpha + (-0.165210)*sailStates.beta + (-1.435543)*sailStates.p + (11.468558)*sailStates.q + (0.400894)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-14.874482)*sailStates.alpha + (0.247799)*sailStates.beta + (10.359426)*sailStates.p + (-146.474228)*sailStates.q + (-0.603850)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.172933)*sailStates.alpha + (-0.018741)*sailStates.beta + (-1.009655)*sailStates.p + (5.754434)*sailStates.q + (-0.062708)*sailStates.r + (0.000225)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end