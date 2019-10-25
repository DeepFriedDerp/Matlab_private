function [aeroForces] = paramSpace_3_2_4_1_3_3_2(sailStates,airStates)

	CL = (5.609891)*sailStates.alpha + (0.186841)*sailStates.beta + (-2.641306)*sailStates.p + (37.559570)*sailStates.q + (2.126499)*sailStates.r + (0.011534)*sailStates.de;
	CD = -1.841580;
	CY = (0.221175)*sailStates.alpha + (-0.024193)*sailStates.beta + (0.874287)*sailStates.p + (1.693498)*sailStates.q + (-0.057125)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.182196)*sailStates.alpha + (-0.458657)*sailStates.beta + (-1.253130)*sailStates.p + (10.662179)*sailStates.q + (1.983405)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-12.446527)*sailStates.alpha + (-0.762658)*sailStates.beta + (8.452370)*sailStates.p + (-137.990799)*sailStates.q + (-7.261856)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.012897)*sailStates.alpha + (0.033114)*sailStates.beta + (-1.929363)*sailStates.p + (7.145483)*sailStates.q + (0.001207)*sailStates.r + (-0.000337)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end