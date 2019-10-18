function [aeroForces] = paramSpace_1_2_2_1_1_2_1(sailStates,airStates)

	CL = (7.646895)*sailStates.alpha + (-0.524892)*sailStates.beta + (-2.559332)*sailStates.p + (29.607035)*sailStates.q + (0.242879)*sailStates.r + (0.008882)*sailStates.de;
	CD = -4.579340;
	CY = (1.864515)*sailStates.alpha + (-0.005182)*sailStates.beta + (-0.249976)*sailStates.p + (15.201123)*sailStates.q + (-0.028603)*sailStates.r + (0.003236)*sailStates.de;

	Cl = (-1.705828)*sailStates.alpha + (-0.497095)*sailStates.beta + (-1.354385)*sailStates.p + (11.161165)*sailStates.q + (0.917516)*sailStates.r + (0.000315)*sailStates.de;
	Cm = (-13.428656)*sailStates.alpha + (2.581306)*sailStates.beta + (9.190418)*sailStates.p + (-137.575928)*sailStates.q + (-1.086235)*sailStates.r + (-0.068350)*sailStates.de;
	Cn = (-1.930678)*sailStates.alpha + (-0.072778)*sailStates.beta + (-0.026298)*sailStates.p + (-10.908792)*sailStates.q + (0.131841)*sailStates.r + (-0.004324)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end