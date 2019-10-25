function [aeroForces] = paramSpace_9_1_2_1_1_1_2(sailStates,airStates)

	CL = (4.444255)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.065946)*sailStates.p + (38.309402)*sailStates.q + (-0.814654)*sailStates.r + (0.011198)*sailStates.de;
	CD = -0.558430;
	CY = (-0.214540)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.404135)*sailStates.p + (-1.046669)*sailStates.q + (0.014149)*sailStates.r + (-0.000228)*sailStates.de;

	Cl = (1.374794)*sailStates.alpha + (0.244437)*sailStates.beta + (-1.622483)*sailStates.p + (13.444660)*sailStates.q + (-0.850281)*sailStates.r + (0.001016)*sailStates.de;
	Cm = (-14.330441)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.625073)*sailStates.p + (-151.326889)*sailStates.q + (2.796751)*sailStates.r + (-0.071886)*sailStates.de;
	Cn = (0.297305)*sailStates.alpha + (-0.008536)*sailStates.beta + (0.984512)*sailStates.p + (-3.856230)*sailStates.q + (-0.002814)*sailStates.r + (0.000217)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end