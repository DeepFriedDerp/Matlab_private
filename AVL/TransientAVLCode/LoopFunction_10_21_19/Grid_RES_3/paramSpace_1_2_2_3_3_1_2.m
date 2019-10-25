function [aeroForces] = paramSpace_1_2_2_3_3_1_2(sailStates,airStates)

	CL = (4.369678)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.534359)*sailStates.p + (37.387695)*sailStates.q + (-1.666309)*sailStates.r + (0.011160)*sailStates.de;
	CD = -0.255070;
	CY = (0.066021)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.581056)*sailStates.p + (0.491628)*sailStates.q + (-0.102456)*sailStates.r + (0.000105)*sailStates.de;

	Cl = (1.430219)*sailStates.alpha + (0.270917)*sailStates.beta + (-1.180722)*sailStates.p + (10.458274)*sailStates.q + (-1.320808)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-13.294564)*sailStates.alpha + (0.000000)*sailStates.beta + (7.781628)*sailStates.p + (-134.907364)*sailStates.q + (5.559252)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (-0.080844)*sailStates.alpha + (0.047770)*sailStates.beta + (1.128438)*sailStates.p + (-4.828548)*sailStates.q + (0.002790)*sailStates.r + (-0.000232)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end