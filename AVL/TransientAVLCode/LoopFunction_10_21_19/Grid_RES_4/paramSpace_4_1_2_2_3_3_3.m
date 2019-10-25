function [aeroForces] = paramSpace_4_1_2_2_3_3_3(sailStates,airStates)

	CL = (4.120811)*sailStates.alpha + (0.425593)*sailStates.beta + (-2.948651)*sailStates.p + (41.769669)*sailStates.q + (1.959348)*sailStates.r + (0.011432)*sailStates.de;
	CD = -0.365250;
	CY = (0.166758)*sailStates.alpha + (-0.023385)*sailStates.beta + (0.609107)*sailStates.p + (0.455226)*sailStates.q + (-0.121175)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.320900)*sailStates.alpha + (-0.186636)*sailStates.beta + (-1.557959)*sailStates.p + (14.398733)*sailStates.q + (1.586905)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-11.746366)*sailStates.alpha + (-1.559423)*sailStates.beta + (8.955964)*sailStates.p + (-145.756378)*sailStates.q + (-6.517548)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.577215)*sailStates.alpha + (0.060929)*sailStates.beta + (-1.135242)*sailStates.p + (3.691595)*sailStates.q + (-0.028195)*sailStates.r + (-0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end