function [aeroForces] = paramSpace_2_4_1_3_1_2_2(sailStates,airStates)

	CL = (3.961617)*sailStates.alpha + (0.083149)*sailStates.beta + (-2.551775)*sailStates.p + (34.700050)*sailStates.q + (-0.213871)*sailStates.r + (0.010829)*sailStates.de;
	CD = 0.043490;
	CY = (-0.061570)*sailStates.alpha + (-0.025475)*sailStates.beta + (-0.016794)*sailStates.p + (-0.498142)*sailStates.q + (-0.001048)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.153202)*sailStates.alpha + (0.041349)*sailStates.beta + (-1.152941)*sailStates.p + (9.100266)*sailStates.q + (-0.153065)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-14.385848)*sailStates.alpha + (-0.393650)*sailStates.beta + (8.742225)*sailStates.p + (-136.384674)*sailStates.q + (0.762842)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (0.116488)*sailStates.alpha + (0.003176)*sailStates.beta + (-0.028219)*sailStates.p + (0.831230)*sailStates.q + (-0.007279)*sailStates.r + (0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end