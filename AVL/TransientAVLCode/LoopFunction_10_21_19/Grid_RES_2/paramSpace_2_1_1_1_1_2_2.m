function [aeroForces] = paramSpace_2_1_1_1_1_2_2(sailStates,airStates)

	CL = (5.227046)*sailStates.alpha + (0.313377)*sailStates.beta + (-3.077398)*sailStates.p + (42.277218)*sailStates.q + (2.324906)*sailStates.r + (0.011752)*sailStates.de;
	CD = -1.018340;
	CY = (0.032358)*sailStates.alpha + (-0.026476)*sailStates.beta + (0.933260)*sailStates.p + (-1.226116)*sailStates.q + (-0.122779)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (2.042649)*sailStates.alpha + (-0.312190)*sailStates.beta + (-1.640809)*sailStates.p + (14.920300)*sailStates.q + (1.949780)*sailStates.r + (0.001049)*sailStates.de;
	Cm = (-13.525417)*sailStates.alpha + (-1.140045)*sailStates.beta + (9.387600)*sailStates.p + (-148.931046)*sailStates.q + (-7.770968)*sailStates.r + (-0.070142)*sailStates.de;
	Cn = (-0.543008)*sailStates.alpha + (0.057768)*sailStates.beta + (-1.889015)*sailStates.p + (8.790803)*sailStates.q + (0.020216)*sailStates.r + (0.000541)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end