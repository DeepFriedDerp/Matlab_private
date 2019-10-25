function [aeroForces] = paramSpace_15_1_2_1_1_2_2(sailStates,airStates)

	CL = (5.225719)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.997149)*sailStates.p + (45.566429)*sailStates.q + (3.006630)*sailStates.r + (0.011827)*sailStates.de;
	CD = -1.047010;
	CY = (0.026149)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.077695)*sailStates.p + (-1.423507)*sailStates.q + (-0.268648)*sailStates.r + (-0.000301)*sailStates.de;

	Cl = (2.054533)*sailStates.alpha + (-0.482895)*sailStates.beta + (-1.549523)*sailStates.p + (15.443628)*sailStates.q + (2.430693)*sailStates.r + (0.000888)*sailStates.de;
	Cm = (-11.577903)*sailStates.alpha + (0.000000)*sailStates.beta + (7.891673)*sailStates.p + (-145.460434)*sailStates.q + (-9.832550)*sailStates.r + (-0.067604)*sailStates.de;
	Cn = (-0.725824)*sailStates.alpha + (0.120399)*sailStates.beta + (-2.105281)*sailStates.p + (9.139633)*sailStates.q + (0.015095)*sailStates.r + (0.000600)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end