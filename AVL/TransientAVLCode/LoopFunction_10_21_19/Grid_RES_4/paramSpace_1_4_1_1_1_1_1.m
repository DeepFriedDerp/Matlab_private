function [aeroForces] = paramSpace_1_4_1_1_1_1_1(sailStates,airStates)

	CL = (5.241805)*sailStates.alpha + (0.651518)*sailStates.beta + (-1.827379)*sailStates.p + (35.478260)*sailStates.q + (-2.473033)*sailStates.r + (0.011509)*sailStates.de;
	CD = -1.823040;
	CY = (0.016028)*sailStates.alpha + (-0.032916)*sailStates.beta + (-0.903556)*sailStates.p + (-2.326709)*sailStates.q + (-0.179479)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (0.448936)*sailStates.alpha + (0.686666)*sailStates.beta + (-0.491466)*sailStates.p + (4.511314)*sailStates.q + (-2.154591)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-8.047687)*sailStates.alpha + (-2.573739)*sailStates.beta + (4.442408)*sailStates.p + (-112.315697)*sailStates.q + (8.237138)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-1.505869)*sailStates.alpha + (0.106597)*sailStates.beta + (2.057301)*sailStates.p + (-7.378447)*sailStates.q + (-0.000640)*sailStates.r + (0.000522)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end