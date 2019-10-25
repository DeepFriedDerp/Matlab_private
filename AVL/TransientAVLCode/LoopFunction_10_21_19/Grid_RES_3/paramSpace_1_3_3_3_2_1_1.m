function [aeroForces] = paramSpace_1_3_3_3_2_1_1(sailStates,airStates)

	CL = (4.185189)*sailStates.alpha + (0.262631)*sailStates.beta + (-2.278285)*sailStates.p + (34.889767)*sailStates.q + (-1.432925)*sailStates.r + (0.010997)*sailStates.de;
	CD = -0.186050;
	CY = (0.027631)*sailStates.alpha + (-0.025225)*sailStates.beta + (-0.454366)*sailStates.p + (-0.173375)*sailStates.q + (-0.080133)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.094906)*sailStates.alpha + (0.311861)*sailStates.beta + (-0.931554)*sailStates.p + (7.855938)*sailStates.q + (-1.100978)*sailStates.r + (-0.000113)*sailStates.de;
	Cm = (-13.116635)*sailStates.alpha + (-0.915548)*sailStates.beta + (7.062774)*sailStates.p + (-127.559647)*sailStates.q + (4.765824)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (-0.250450)*sailStates.alpha + (0.040369)*sailStates.beta + (0.919855)*sailStates.p + (-3.742243)*sailStates.q + (-0.003151)*sailStates.r + (-0.000033)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end