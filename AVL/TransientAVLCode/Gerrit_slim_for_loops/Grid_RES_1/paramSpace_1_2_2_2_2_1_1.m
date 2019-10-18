function [aeroForces] = paramSpace_1_2_2_2_2_1_1(sailStates,airStates)

	CL = (7.984216)*sailStates.alpha + (-0.615385)*sailStates.beta + (-2.585766)*sailStates.p + (29.045017)*sailStates.q + (0.612868)*sailStates.r + (0.008707)*sailStates.de;
	CD = -5.562490;
	CY = (1.889210)*sailStates.alpha + (-0.004968)*sailStates.beta + (-0.080587)*sailStates.p + (15.366751)*sailStates.q + (-0.006256)*sailStates.r + (0.003274)*sailStates.de;

	Cl = (-2.509269)*sailStates.alpha + (-0.611638)*sailStates.beta + (-1.387402)*sailStates.p + (11.294041)*sailStates.q + (1.268218)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-11.617057)*sailStates.alpha + (2.937961)*sailStates.beta + (9.511220)*sailStates.p + (-138.849533)*sailStates.q + (-2.329220)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-2.034805)*sailStates.alpha + (-0.083742)*sailStates.beta + (-0.418845)*sailStates.p + (-9.232140)*sailStates.q + (0.126781)*sailStates.r + (-0.004339)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end