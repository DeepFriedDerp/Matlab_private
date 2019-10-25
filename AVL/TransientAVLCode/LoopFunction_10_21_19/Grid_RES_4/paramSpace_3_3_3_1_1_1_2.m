function [aeroForces] = paramSpace_3_3_3_1_1_1_2(sailStates,airStates)

	CL = (5.425332)*sailStates.alpha + (0.125794)*sailStates.beta + (-2.491518)*sailStates.p + (32.411606)*sailStates.q + (-1.441873)*sailStates.r + (0.010487)*sailStates.de;
	CD = -1.689840;
	CY = (-0.202608)*sailStates.alpha + (-0.024313)*sailStates.beta + (-0.693104)*sailStates.p + (-1.693498)*sailStates.q + (0.045369)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.145006)*sailStates.alpha + (0.446178)*sailStates.beta + (-1.162704)*sailStates.p + (8.912542)*sailStates.q + (-1.478073)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-14.573486)*sailStates.alpha + (-0.501969)*sailStates.beta + (9.054230)*sailStates.p + (-136.398376)*sailStates.q + (4.899632)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.210960)*sailStates.alpha + (-0.026778)*sailStates.beta + (1.681507)*sailStates.p + (-6.657872)*sailStates.q + (-0.008248)*sailStates.r + (0.000335)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end