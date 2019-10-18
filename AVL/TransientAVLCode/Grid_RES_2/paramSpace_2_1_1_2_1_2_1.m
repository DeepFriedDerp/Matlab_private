function [aeroForces] = paramSpace_2_1_1_2_1_2_1(sailStates,airStates)

	CL = (5.629992)*sailStates.alpha + (-1.786306)*sailStates.beta + (-3.617498)*sailStates.p + (49.497799)*sailStates.q + (2.024891)*sailStates.r + (0.012635)*sailStates.de;
	CD = -5.002890;
	CY = (1.837155)*sailStates.alpha + (-0.116603)*sailStates.beta + (0.223026)*sailStates.p + (14.668053)*sailStates.q + (-0.024168)*sailStates.r + (0.003102)*sailStates.de;

	Cl = (-4.155473)*sailStates.alpha + (-0.947660)*sailStates.beta + (-1.823789)*sailStates.p + (15.683466)*sailStates.q + (2.212687)*sailStates.r + (0.001529)*sailStates.de;
	Cm = (0.709346)*sailStates.alpha + (7.900561)*sailStates.beta + (11.434373)*sailStates.p + (-162.872589)*sailStates.q + (-7.130983)*sailStates.r + (-0.068038)*sailStates.de;
	Cn = (-2.017385)*sailStates.alpha + (0.191533)*sailStates.beta + (-0.692812)*sailStates.p + (-8.979001)*sailStates.q + (-0.180087)*sailStates.r + (-0.004042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end