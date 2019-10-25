function [aeroForces] = paramSpace_4_2_1_3_3_2_3(sailStates,airStates)

	CL = (3.840645)*sailStates.alpha + (0.057025)*sailStates.beta + (-2.746489)*sailStates.p + (37.265045)*sailStates.q + (0.948408)*sailStates.r + (0.010898)*sailStates.de;
	CD = 0.072130;
	CY = (0.054349)*sailStates.alpha + (-0.024693)*sailStates.beta + (0.153018)*sailStates.p + (0.294836)*sailStates.q + (-0.030469)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.275599)*sailStates.alpha + (-0.066696)*sailStates.beta + (-1.394197)*sailStates.p + (12.058159)*sailStates.q + (0.624499)*sailStates.r + (0.000742)*sailStates.de;
	Cm = (-13.858940)*sailStates.alpha + (-0.177084)*sailStates.beta + (9.164115)*sailStates.p + (-142.570129)*sailStates.q + (-3.167192)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.272752)*sailStates.alpha + (0.015699)*sailStates.beta + (-0.132001)*sailStates.p + (-0.438309)*sailStates.q + (-0.043052)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end